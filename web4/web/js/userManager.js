var isName=false;
var isChrName=false;
var isEmail=false;
var isProvince=false;
var isCity=false;
var isPwd=false;
var isConfrimPwd=false;

$(document).ready(function () {
    init();
    deleteUser();
    showUser();
    controlsListener();

    fillProvince("province");
    fillCity("province","city");

    fillProvince("add_province");
    fillCity("add_province","add_city");
});

function request(queryParams, pageParams) {
    $.ajax({
        type: "post",
        url: "userManager.do",
        async: true,
        data: {
            queryParams: JSON.stringify(queryParams),
            pageParams: JSON.stringify(pageParams)
        },
        dataType: "json",
        success: function (data) {
            userList(data)
        }
    });
}


////列表循环
function userList(data) {
    let rows = data.rows;
    let total = data.total;

    let pageSize = $('#pageSize option:selected').val();
    let pageCount = Math.ceil(total / pageSize); //算总页数

    $('#total').text(total);
    $('#pageCount').text(pageCount);

    $('tbody').empty();
    $.each(rows, function (index, row) {
        const s = JSON.stringify(row);
        let str = "<tr data='" + s + "'>";
        str = str + '<td><input type="checkbox" value="' + row.userName + '"/></td>';
        str = str + '<td>' + row.userName + '</td>';
        str = str + '<td>' + row.chrName + '</td>';
        str = str + '<td>' + row.emailAddress + '</td>';
        str = str + '<td>' + row.province + '</td>';
        str = str + '<td>' + row.city + '</td>';
        str = str + '<td><a href="#" id="btnDel" value=' + row.userName + '>删除</a>';
        str = str + '|<a href="#" id="btnUpdate" value=' + row.userName + '>修改</a></td>'
        str = str + '</tr>';
        $('tbody').append(str);
    });
}


//删除一条记录
function deleteUser() {
    $('table').on('click', '#btnDel', function () {
        let flag = window.confirm("你真的要删除吗？");
        if (flag) {
            const userName = $(this).attr('value');
            $.ajax({
                type: 'post',
                url: 'userCRUDServlet.do?oper=delete',
                async: true,
                data: {
                    ids: userName
                },
                dataType: 'json',
                success: function (response) {
                    alert(response.info);
                    if (response.code === 0) {
                        location.reload();
                    }
                }
            })
        }
    });
}

//点击修改回显数据
function showUser() {
    $('table').on('click', '#btnUpdate', function () {
        const userName = $(this).attr('value');
        $.ajax({
            type: 'post',
            url: 'userCRUDServlet.do?oper=getUser',
            async: true,
            data: {
                ids: userName
            },
            dataType: 'json',
            success: function (response) {
                let user = response.user;
                //回显到页面上
                $('#m_username').val(user.userName);
                $('#m_userChrName').val(user.chrName);
                $('#m_emailAddress').val(user.emailAddress);
                $("#province").find("option[value='']").text(user.province);
                $("#city").find("option[value='']").text(user.city);
                console.log(user.userName);
            }
        });
        showDiv('MyDiv', 'fade');
    });
}
//修改
function updateUser() {
        let updateUser = {
            userName: $('#m_username').val(),
            password: $('#m_userPassword').val() ,
            chrName: $('#m_userChrName').val(),
            emailAddress: $('#m_emailAddress').val(),
            province: $('#province').val(),
            city: $('#city').val(),
        };
        $.ajax({
            type: 'post',
            url: 'userCRUDServlet.do?oper=update',
            async: true,
            data: {
                updateUser: JSON.stringify(updateUser)
            },
            dataType: 'json',
            success: function (response) {
                alert(response.info);
                if (response.code === 0) {
                    location.reload();
                }
            }
        });
}


//页面加载执行 页面初始化
function init() {
    let queryParams = {
        userName: '',
        chrName: '',
        emailAddress: '',
        province: ''
    };
    let pageParams = {
        pageSize: $('#pageSize').val(),
        pageNumber: 0,
        sort: "userName",
        sortOrder: "asc"
    };
    request(queryParams, pageParams);
}


//多条件查询
function query() {
    let queryParams = {
        userName: $('#r_user').val(),
        chrName: $('#r_name').val(),
        emailAddress: $('#r_email').val(),
        province: $('#r_province').val()
    };
    let pageParams = {
        pageSize: $('#pageSize').val(),
        pageNumber: 0,
        sort: "userName",
        sortOrder: "asc"
    };
    request(queryParams, pageParams);
}

//清空
function empty() {
    $('#r_user').val("");
    $('#r_name').val("");
    $('#r_email').val("");
    $('#r_province').val("");
    init();
}

//添加弹出框
function showAddUser(){
	 showDiv('add_MyDiv', 'add_fade');
}
function addUser() {
    if(isName && isChrName && isEmail && isProvince && isCity && isPwd && isConfrimPwd) {
        let updateUser = {
            userName: $('#add_username').val(),
            password: $('#add_userPassword').val() ,
            chrName: $('#add_userChrName').val(),
            emailAddress: $('#add_emailAddress').val(),
            province: $('#add_province').val(),
            city: $('#add_city').val(),
        };
        $.ajax({
        	type:"post",
        	url:"userCRUDServlet.do?oper=add",
        	async:true,
        	data: {
        		updateUser : JSON.stringify(updateUser)
        	},
        	datatype: 'json',
            success: function(response){
            	let data = JSON.parse(response);
        		alert(data.msg);
        		if (data.code === 0){
        		    location.reload();
                }
        	}
        });
    }else {
        alert("请检查各选项是否有误!");
    }
}




//弹出隐藏框
function showDiv(show_div, bg_div) {
    document.getElementById(show_div).style.display = 'block';
    document.getElementById(bg_div).style.display = 'block';

    //弹出层居中
    let windowHeight = $(window).height(); //获取当前窗口高度
    let windowWidth = $(window).width();  //获取当前窗口宽度
    let popupHeight = $("#" + show_div).height(); //获取弹出层高度
    let popupWidth = $("#" + show_div).width(); //获取弹出层宽度
    let posiTop = (windowHeight - popupHeight) / 2;
    let posiLeft = (windowWidth - popupWidth) / 2;
    $('#' + show_div).css({"left": posiLeft + "ps", "top": posiTop + "px", "display": "block"}); //设置position
}

//关闭弹出层
function CloseDiv(show_div, bg_div) {
    document.getElementById(show_div).style.display = "none";
    document.getElementById(bg_div).style.display = "none";
}

// 自动填充省份
function fillProvince(province) {
    $.ajax({
        type:"post",
        url: "queryProvinceCity.do",
        data: {},
        dataType: "json",
        success: function (response) {
            let provinceElement = document.getElementById(province);
            provinceElement.options.length = 0;
            provinceElement.add(new Option("请选择省份",""));
            for (let index = 0;index < response.length;index++) {
                provinceElement.add(new Option(response[index].province,response[index].p_id));
            }
        }
    });

}

function  fillCity(province,city){
    // 通过选择的省份，填充响应的城市
    $("#"+province).change(function (e) {
        $("#"+city).empty();
        $("#"+city).append($("<option>").val("").text("请选择城市"));
        if ($(this).val() === "") {
            $("#provinceError").text("必须选择省份！");
            return;
        }
        const provinceCode = $("#"+province).val();
        $.ajax({
            type: "post",
            url: "queryProvinceCity.do",
            data: {provinceCode:provinceCode},
            dataType: "json",
            success : function (response) {
                let cityElement = document.getElementById(city);
                cityElement.options.length = 0;
                cityElement.add(new Option("请选择城市",""));
                for(let index = 0;index < response.length;index++) {
                    cityElement.add(new Option(response[index].city,response[index].c_id));
                }
            }
        });
    });
}

function controlsListener() {
    // 用户名进行效验
    $("#add_username").blur(function () {
        const userName = $("#add_username").val();
        const error_text = $("#userNameError");
        if (userName === "") {
            isName = false;
            error_text.text("用户名不能为空");
            error_text.css("color","#FA8072");
        } else {
            let champter = /^[A-Za-z]+[A-Za-z0-9]{3,14}$/;
            if(champter.test(userName)) {
                $.ajax({
                    type: "get",
                    url: "Login.do",
                    data: {userName:userName},
                    dataType: "json",
                    success : function (response) {
                        if(response) {
                            error_text.text("该用户已存在");
                            error_text.css("color","#FA8072");
                            isName = false;
                        } else {
                            error_text.text("输入字符合法");
                            error_text.css("color","#2DFF77");
                            isName = true;
                        }
                    }
                });
            } else {
                error_text.text("只能输入字母和数字，以字母开头，长度为4到15个字符");
                error_text.css("color","#FA8072");
                isName = false;
            }
        }
    });

    // 用户真实姓名进行效验
    $("#add_userChrName").blur(function () {
        const userChrName = $("#add_userChrName").val();
        const error_text = $("#chrNameError");
        if(userChrName === "") {
            error_text.text("真实姓名不能为空");
            error_text.css("color","#FA8072");
            isChrName = false;
        } else {
            const champter = /^[\u4e00-\u9fa5]{2,4}$/;
            if(champter.test(userChrName)) {
                error_text.text("输入中文字符合法");
                error_text.css("color","#2DFF77");
                isChrName = true;
            } else {
                error_text.text("请输入长度在（2-4）内的中文姓名");
                error_text.css("color","#FA8072");
                isChrName = false;
            }
        }
    });

    // 邮箱进行效验
    $("#add_emailAddress").blur(function () {
        const userEmail = $("#add_emailAddress").val();
        const error_text = $("#emailError");
        if(userEmail === "") {
            error_text.text("邮箱不能为空");
            error_text.css("color","#FA8072");
            isEmail = false;
        } else {
            let champter = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(champter.test(userEmail)) {
                $.ajax({
                    type: "get",
                    url: "Login.do",
                    data: {userEmail:userEmail},
                    dataType: "json",
                    success : function (response) {
                        if(response) {
                            error_text.text("该邮箱已存在");
                            error_text.css("color","#FA8072");
                            isEmail = false;
                        } else {
                            error_text.text("输入邮箱地址合法");
                            error_text.css("color","#2DFF77");
                            isEmail = true;
                        }
                    }
                });
            } else {
                error_text.text("请输入合法的邮箱地址");
                error_text.css("color","#FA8072");
                isEmail = false;
            }
        }
    });

    // 省份选择效验
    $("#add_province").blur(function () {
        const province = $("#add_province option:selected").val();
        const error_text = $("#provinceError");
        if(province !== "") {
            error_text.text("合法选择");
            error_text.css("color","#2DFF77");
            isProvince = true;
        } else {
            error_text.text("必须选择省份！");
            error_text.css("color","#FA8072");
            isProvince = false;
        }
    });

    // 城市选择效验
    $("#add_city").blur(function () {
        const city = $("#add_city option:selected").val();
        const error_text = $("#cityError");
        if(city !== "") {
            error_text.text("合法选择");
            error_text.css("color","#2DFF77");
            isCity = true;
        } else {
            error_text.text("必须选择城市！");
            error_text.css("color","#FA8072");
            isCity = false;
        }
    });

    // 密码进行效验
    $("#add_userPassword").blur(function () {
        const userPassword = $("#add_userPassword").val();
        const error_text = $("#passwordError");
        if(userPassword === "") {
            error_text.text("密码长度至少为4");
            error_text.css("color","#FA8072");
            isPwd = false;
        } else {
            if(userPassword.length>=4) {
                error_text.text("输入字符合法");
                error_text.css("color","#2DFF77");
                isPwd = true;
            } else {
                error_text.text("密码长度至少为4");
                error_text.css("color","#FA8072");
                isPwd = false;
            }
        }
    });

    // 确认密码进行效验
    $("#add_confirmPassword_Attribute").blur(function () {
        const  confirmPassword = $("#add_confirmPassword_Attribute").val();
        const error_text = $("#confirmError");
        if(confirmPassword === "") {
            error_text.text("密码不一致或长度不够");
            error_text.css("color","#FA8072");
            isConfrimPwd = false;
        } else {
            if($("#add_userPassword").val() === confirmPassword) {
                error_text.text("输入字符合法");
                error_text.css("color","#2DFF77");
                isConfrimPwd = true;
            } else {
                error_text.text("密码不一致或长度不够");
                error_text.css("color","#FA8072");
                isConfrimPwd = false;
            }
        }
    });
}

