<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/userManager.css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript"src="${pageContext.request.contextPath}/js/userManager.js"></script>
   <!--<link type="text/css" href="../css/userManager.css" rel="stylesheet"/>
   <script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"src="../js/userManager.js"></script>-->
</head>
<body>
<div class="header">
    <div class="header_right">
        <div class="user_info">
            <p>欢迎您：<span id="user_name">${main.chrName}</span>
                <a href="Logout.do" id="exit_btn">【安全退出】</a>
            </p>
        </div>
        <div>
            <ul>
                <li><a href="main.jsp">首页</a></li>
                <li><a href="GetDownloadList.do">资源下载</a></li>
                <li>用户管理</li>
                <li><a href="resourceManager.do">资源管理</a></li>
                <li><a href="personalCenter.do">个人中心</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="searchForm">
        <div class="search">
            <div class="input_list">
                <form id="searchForm">
                    <input id="r_user" type="text" placeholder="输入用户名" name="inUser"/>
                    <input id="r_name" type="text" placeholder="输入姓名" name="inName"/>
                    <input id="r_email" type="text" placeholder="输入邮箱地址" name="inEmail"/>
                    <input id="r_province" type="text" placeholder="输入省份" name="inProvince"/>
                </form>
            </div>

            <div class="bt">
                <a href="#" onclick="query()">查找</a>
                <a href="#" onclick="empty()">清空</a>
                <a href="#" onclick="showAddUser()">增加</a>
                <a href="">删除</a>
            </div>
        </div>
    </div>
    <hr/>
    <div class="user_table">
        <table border="1">
            <thead>
            <tr>
                <th><input type="checkbox" name="ckAll" id="ckAll" title="选择"/></th>
                <th>用户名</th>
                <th>中文名</th>
                <th>邮箱</th>
                <th>省份</th>
                <th>城市</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="areaItems">

           
            </tbody>
        </table>
    </div>

    <div class="paging">
        <div class="pageSize">每页
            <select id="pageSize">
                <option>5</option>
                <option>10</option>
                <option selected="selected">15</option>
            </select>,共
            <span id="total"></span>条数据,
            <span id="pageNumber">1</span>
            	页/
            <span id="pageCount"></span>页
        </div>
        <div class="pageNav">
            <a href="#"  onclick="firstPage()">首页</a>
            <a href="#"  onclick="">上一页</a>
            <a href="#"  onclick="">下一页</a>
            <a href="#"  onclick="">尾页</a>
        </div>
    </div>
</div>

<div id="fade" class="black_overlay" onclick="CloseDiv('MyDiv','fade')"></div>
<div id="MyDiv" class="white_content">
	<div style="text-align: right;height: 20px;">
		<span style="font-size: 24px;cursor: pointer;" title="点击关闭" onclick="CloseDiv('MyDiv','fade')">
			×
		</span>
    </div>
		<div>
            <div class="title">
                <h2>修改用户信息</h2>
            </div>
            <label class="label_UserName">
                <input type="text" id="m_username" name="userName" placeholder="用户名">
            </label>

            <label class="label_ChrName">
                <input type="text" id="m_userChrName" name="chrName" placeholder="真实姓名">
            </label>

            <label class="label_Email">
                <input type="email" id="m_emailAddress" name="emailAddress" placeholder="邮箱">
            </label>

            <label class="label_Province">
                <select id="province" name="provinceCode">
	                <option value="">

	                </option>
                </select>
            </label>

            <label class="label_City">
                <select id="city" name="cityCode">
	                <option value="">

	                </option>
                </select>
            </label>

            <label class="label_Password">
                <input type="password" id="m_userPassword" name="userPassword" placeholder="密码">
            </label>

            <label class="label_Confirm">
                <input type="password" id="confirmPassword_Attribute" name="confirmPassword" placeholder="确认密码">
            </label>

            <label>
                <a href="javascript:void(0)" id="btn_summit" onclick="updateUser()">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</a>
            </label>
		</div>
	</div>
</div>

<div id="add_fade" class="black_overlay" onclick="CloseDiv('add_MyDiv','add_fade')"></div>
<div id="add_MyDiv" class="white_content">
	<div style="text-align: right;height: 20px;">
		<span style="font-size: 24px;cursor: pointer;" title="点击关闭" onclick="CloseDiv('add_MyDiv','add_fade')">
			×
		</span>
    </div>
		<div id="">
            <div class="title">
                <h2>添加用户</h2>
            </div>
            <label class="label_UserName">
                <input type="text" id="add_username" name="userName" placeholder="用户名">
                <span id="userNameError"></span>
            </label>

            <label class="label_ChrName">
                <input type="text" id="add_userChrName" name="chrName" placeholder="真实姓名">
                <span id="chrNameError"></span>
            </label>

            <label class="label_Email">
                <input type="email" id="add_emailAddress" name="emailAddress" placeholder="邮箱">
                <span id="emailError"></span>
            </label>

            <label class="label_Province">
                <select id="add_province" name="provinceCode">
	                <option value="">

	                </option>
                </select>
                <span id="provinceError"></span>
            </label>

            <label class="label_City">
                <select id="add_city" name="cityCode">
	                <option value="">

	                </option>
                </select>
                <span id="cityError"></span>
            </label>

            <label class="label_Password">
                <input type="password" id="add_userPassword" name="userPassword" placeholder="密码">
                <span id="passwordError"></span>
            </label>

            <label class="label_Confirm">
                <input type="password" id="add_confirmPassword_Attribute" name="confirmPassword" placeholder="确认密码">
                <span id="confirmError"></span>
            </label>

            <label>
                <a href="javascript:void(0)" onclick="addUser()">添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</a>
            </label>
		</div>
	</div>
</div>
</body>
</html>
