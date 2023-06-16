<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="cssfile.css" type="text/css"/>
  <link rel="stylesheet" href="css/displaytag.css" type="text/css"/>
  <link rel="stylesheet" href="css/screen.css" type="text/css"/>
  <link rel="stylesheet" href="css/site.css" type="text/css"/>
  <title>Marks Registrations</title>
  <style>
    table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    td, th {
      border: 1px solid #DDDDDD;
      text-align: left;
      padding: 8px;
    }
    thead {
      background-color: #008DD4;
      color: white;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div id="layout">
  <div id="banner">
    <div class="bannerlogo"></div>
    <div class="text_header">RCA Management Information System</div>
    <div class="right" style="text-align: right;">
      <c:if test="${authenticatedUser !=null}">
        <b> <a
                href="listuser.php?page=profile&&id=${authenticatedUser.id}">
          <button>Profile
          </button>
        </a> | <img src="icons/user.png"/> <font color="#FFFFFF">${authenticatedUser.userRole}:
            ${authenticatedUser.username}</font> | <a href="login.ap?page=logout"><font
                color="#FFFFFF">Logout</font></a>
        </b>
      </c:if>
      <c:if test="${authenticatedUser ==null}">
        <div class="menu" align="left">
          | <a href="login.php?">Login</a> |
        </div>
      </c:if>
    </div>
  </div>
  <div>
    <%@ include file="menu.jsp" %>
  </div>
  <div id="middle">
    <c:if test="${authenticatedUser !=null}">
      <div class="options">
        <a href="createmarks.php?page=createmarks">
          <button>
            <img src="icons/user_add.png"/> Create New Marks
          </button>
        </a>
      </div>
      <div class="search">
        <form action="listuser.php" method="get">
          <table>
            <tr>
              <td style="color: #000000;">Enter User ID</td>
              <td><input type="text" name="id" id="id"/></td>
              <td><input type='submit' name="userregistrationsearch"
                         value='search'/></td>
            </tr>
          </table>
        </form>
      </div>
      <hr/>
      <table style="border: 0;">
        <td align="left"><input type="text" size="15"
                                maxlength="50" readonly="readonly" name="savedBy" id="savedBy"
                                hidden="hidden" value="${authenticatedUser.id}"/></td>
        <table>
          <thead>
          <tr>
            <td>Student Name</td>
            <td>Subject</td>
            <td>Score</td>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${marks}" var="mark" varStatus="markstatus">
            <tr>
              <td>${mark.getStudent().getName()}</td>
              <td>${mark.getCourse().getName()}</td>
              <td>${mark.getScore()}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </table>
    </c:if>
  </div>
  <%@ include file="footer.jsp" %>
</div>
</body>
</html>