
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="bootstrap/js/jquery-1.12.4.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
 <h1 style="text-decoration: #ff3300;text-align: center" >充值业务中心</h1>
    <p style="margin-left: 200px">请选择充值方式:<button id="zhifubao" class="btn-danger">支付宝</button> <button id="weixin" class="btn-danger">微信</button> </p>
    <p  style="margin-left: 205px;font-weight: bold;color: #ff3300">支付成功后，填写你的支付金额并提交即可！</p>
 <form action="submitmoney" method="post" onsubmit="return check()">
   <p style="margin-left: 200px">选择充值金额：<input type="text" name="jinge"   placeholder="请填写整数"> <input type="hidden" name="id"  value="${userid}">
       <button type="submit">提交</button></p>
 </form>
    <div id="bcimg" style="width: 300px;height: 380px;float: left;background-image: url(weixinma.jpg)"></div>
    <div id="mainpage" style="float: left">
       <form action="/login" method="post" >
           <input type="hidden" name="id" value="${userid}">
           <button class="btn-success" type="submit" style="font-size: xx-large"> 返回主页</button>
       </form>
    </div>
</body>
<script>
    $(function () {
       $("#zhifubao").click(function () {
           $("#bcimg").css("background-image","url(zhifubao.jpg)");
       })
        $("#weixin").click(function () {
          $("#bcimg").css("background-image","url(weixinma.jpg)");
        })
    })
    function  check(){
       var im=$("#bcimg").css("background-image");
       if(im==null||im==""){
           alert("你还没选择支付方式");
           return false;
       }
       return true;
    }
</script>
</html>
