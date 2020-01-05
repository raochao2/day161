<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="scripts/jquery-1.12.4.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/bootstrap-table.js"></script>
</head>
<body>
<h1 style="text-align: center">用户的所有投注记录</h1>
 <br/> <p style="font-size: large;margin-left: 300px"> <a href="/login?id=${userid}" style="text-decoration: #ff3300;">返回主页</a></p>
<form action="alltotalist" method="post" id="myform">
    <input type="hidden" name="userid"  value=${userid}>
    <input type="hidden" name="pageNum" id="pageNum" value="1">
</form>
  <div class="container">
    <table  width="70%" class="table table-bordered table-striped table-hover">
        <tr><th>开奖期数 </th><th>投注类别 </th><th> 投注量</th><th>输赢结果 </th></tr>
        <c:forEach items="${pageInfo.list}" var="tol">
           <tr><td>${tol.date}</td>
               <td> <c:if test="${tol.type==0}">大</c:if>
                    <c:if test="${tol.type==1}">小</c:if>
               </td>
               <td>${tol.luam}</td>
               <td>
               <c:if test="${tol.rest==0}">输</c:if>
               <c:if test="${tol.rest==1}">赢</c:if>
               </td>
           </tr>
        </c:forEach>
    </table>
  </div>
  <p style="text-align: center">
      <button class="btn btn-success" onclick="javascript:gotopage(${pageInfo.pageNum-1})">上一页</button>&nbsp;
      <button class="btn btn-success" onclick="javascript:gotopage(${pageInfo.pageNum+1})">下一页</button>
      &nbsp;&nbsp;
      第${pageInfo.pageNum}页/共${pageInfo.pages}页
  </p>


</body>
<script>
    function gotopage(num) {
        $("#pageNum").val(num);
        $("#myform").submit();
    }
</script>
</html>
