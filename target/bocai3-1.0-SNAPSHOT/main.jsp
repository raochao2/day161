<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        #div1{
            float: left;
        }
        #div2{
            float: left;
        }
        #div6{
          float: left;
        }
        #div5{
            float: left;
        }
        .toast-center-center{
            position: absolute;
            margin-top: 20px;
            margin-left: 20px;
        }
    </style>
    <link rel="stylesheet" href="scripts/style.css">
    <link rel="stylesheet" href="bootstrap/css/toastr.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-1.12.4.js" language="JavaScript" type="text/javascript" ></script>
    <script src="bootstrap/js/bootstrap.min.js" language="JavaScript" type="text/javascript"></script>
    <script src="bootstrap/js/toastr.min.js"></script>
    <script src="scripts/bootstrap-table.js"></script>
    <script src="scripts/bocai1.js"  language="JavaScript" type="text/javascript"></script>
    <script>
        toastr.options.positionClass = 'toast-center-center';
       function  addmoney(id){
         location.href="addmoney?userid="+id;
       }
        function  alltotalist(id){
            location.href="alltotalist?userid="+id+"&pageNum=1";
        }
        <c:if test="${modify.equals('success')}"> alert("客服将会审查，并在三分钟内为你添加金额")</c:if>
    </script>
</head>
<body>
  <div class="container" style="margin-left: 25px;margin-top: 25px">
 <h1 style="text-align: center;color:darkgreen">饶超和他的朋友们做的<a href="https://baike.so.com/doc/5437353-7626544.html" target="_blank" style="text-decoration: none"> 澳门线上 </a> 赌博网站</h1>
<h2 style="margin-left: 10px">欢迎你，尊贵的用户【${people.name}】</h2> <input id="peoplId" type="hidden" value="${people.id}">
    <div id="money" style="color: lightseagreen;font-size: large;font-weight: bolder;margin-left: 10px">
    账户余额为：<input type="text"  size="10px" disabled  id="span1" value="${people.money}">元
    <button class="btn-success" id="addMoney" onclick="addmoney(${people.id})">充值通道</button>
    <button class="btn-success" onclick="alltotalist(${people.id})">全部投注记录</button>
   </div>
 <hr width="95%">
  <div id="div6">
 <div id="div1" style="border:1px solid #000;width: 170px;height: 300px;background-color:pink" >
     <br>
      &nbsp;&nbsp;选择投注类型：<select name="mysel" id="mysel">     &nbsp;
      &nbsp;  <option value="1">大</option>
     &nbsp;  <option value="2">小</option>
     &nbsp;   </select><br><br><br>
     &nbsp;  选择投注金额：<select name="mysel2" id="mysel2">
      <option value="5">5</option>
      <option value="10">10</option>
      <option value="20">20</option>
      <option value="50">50</option>
      <option value="100">100</option>
      <option value="5000">5000</option>
      <option value="8000">8000</option>
     </select>   <br>  <br>
     &nbsp;  <button id="btn" class="btn btn-primary">投注</button>
        <button id="btn2" class="btn btn-danger">取消投注</button>
  </div>

    <input type="hidden" id="div3" value="0">

    <input type="hidden" id="div4" value="0">
 <div id="div2" style="border:1px solid #3a52a8;width: 561px;height: 300px;padding-left: 10px;margin-left: 10px" >
    <span style="color: #ff3300;font-size: xx-large">开奖结果：</span>  <input type="text" disabled id="result" size="1" style="font-weight: bolder;background-color: #a0f5ff;font-size: 50px">
    <span style="color: #3b6e22;font-size: large"> 倒计时： </span><input type="text" disabled id="timer" size="2"  style="font-weight: bolder;background-color: #a0f5ff;font-size: 45px" >
     <br>我的投注展示：<br>
    <input type="text" disabled id="mychioce" style="font-size: 20px;font-weight: bolder;background-color: aqua">
    <br>中奖结果展示：<br>
     <input type="text" disabled id="result2"  style="font-size: 20px;font-weight: bolder;background-color: aqua">
     <p style="color: #3a52a8;font-size: large;font-family: 微软雅黑">
      网站申明：0——4为小，5——9为大，押中即中奖，一分钟一期。珍爱生命，远离赌博！</p>
 </div>


  <%--这是图片模块--%>
   <div id="picArea"><br><br>
       <img src="http://localhost:80/leige.jpg" alt="磊哥" width="175px" height="175px">
    <img src="http://localhost:80/328.jpg" alt="磊哥" width="170x" height="170px">
    <img src="http://localhost:80/huolong.JPEG" alt="磊哥" width="171px" height="171px">
    <img src="http://localhost:80/178.jpg" alt="磊哥" width="172px" height="172px">
  <br><br> <p style="margin-left: 100px;font-weight: bolder;font-size: 20px">免责声明：本网站仅代表此网站本身，与开发者无关，不承担法律责任.</p>
   </div>
  </div>
  <%--表格模块 --%>
  <div id="div5"  style="margin-left: 5px">
      <table id="table"  class="table-striped table-bordered table-responsive table-hover" style="text-align: center;width: 370px" >
      </table>
  </div>
  </div>
</body>
</html>
