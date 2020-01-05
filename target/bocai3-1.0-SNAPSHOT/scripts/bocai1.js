$(function () {
    //表格的数据绑定
    $('#table').bootstrapTable({
        method:"get",
        url: 'getResult',
        pageNumber:1,
        pageSize:10,
        sidePagination: 'server', // 设置为服务器端分页
        pagination:false,
        width: 370,
        dataType:'json',
        columns: [ {field:'date',align:'center',
            title:'开奖期号'},{
            field: 'number',align:'center',
            title: '开奖数字'
        }]
    });

    var  timeoutId = setInterval(function () {
        var mytime=getLocaltime();
        var ids=$("#peoplId").val();
        var i=Math.floor(Math.random()*10);
       //每期的结果记录在数据库里
        $.post(
            "addResult",
            {"date":mytime,"number":i},
            function (data) {
            } ,"json"
        );//记录结束
        $("#table").append($("<tr class='tr'> <td>"+mytime+"</td> <td>"+i+"</td></tr>"));
        var nodes=$("table tr");
        if(nodes.length>=15){
            $("table tr:eq(1)").remove();
        }
        $("#result").val(i);
        var choice2=$("#div4").val();
        var choice=$("#div3").val();
        if(i>4){
            var j="1";
            if(j==choice){
                $("#result2").val("中奖！获得奖金："+ parseInt(choice2)*2);
                toastr.success("恭喜中奖！");
                $.get(
                    "addtotalist",
                    {"userid":ids,"date":mytime,"type":'0',"luam":choice2,"rest":'1'},
                    function (data) {
                    } ,"json"
                );
                $("#btn").attr("disabled", false);
                /*给顾客资金加*/
                var num=parseInt($("#span1").val())+parseInt(choice2)*2;
                $("#span1").val(num);
                /*发送异步请求*/
                $.post(
                   "modifiMoney",
                   {"money":num,"id":ids},
                   function (data) {
                      console.log("success!");
                   } ,"text"
                );
                $("#mychioce").val("  ");
                $("#div3").val("0");
                $("#div4").val("0");
            }
            else if(choice!="0"){
                $("#result2").val("很遗憾！没中奖！");
                toastr.success("再接再厉！");
                $.get(
                    "addtotalist",
                    {"userid":ids,"date":mytime,"type":'1',"luam":choice2,"rest":0},
                    function (data) {
                    } ,"json"
                );
                $("#btn").attr("disabled", false);
                $("#mychioce").val("  ");
                $("#div3").val("0");
                $("#div4").val("0");
                var num=parseInt($("#span1").val());
                /*修改用户账户金额*/
                $.post(
                    "modifiMoney",
                    {"money":num,"id":ids},
                    function (data) {
                        console.log("success!");
                    } ,"text"
                );
            }
            else if(choice=="0"){  $("#result2").val("  "); }
        }
        if(i<5){
            var j="2";
            if(j==choice){
                $("#result2").val("中奖！获得奖金：" + parseInt(choice2)*2);
                toastr.success("恭喜中奖！");
                //记下用户这次的投注记录
                $.get(
                    "addtotalist",
                    {"userid":ids,"date":mytime,"type":'1',"luam":choice2,"rest":1},
                    function (data) {
                    } ,"json"
                );
                $("#btn").attr("disabled", false);
                /*给顾客资金加*/
                var num=parseInt($("#span1").val())+parseInt(choice2)*2;
                $("#span1").val(num);
               /*修改用户账户金额*/
                $.post(
                    "modifiMoney",
                    {"money":num,"id":ids},
                    function (data) {
                        console.log("success!");
                    } ,"text"
                );
                $("#mychioce").val("  ");
                $("#div3").val("0");
                $("#div4").val("0");
            }
            else if(choice!="0"){
                $("#result2").val("很遗憾！没中奖！");
                toastr.success("再接再厉！");
                //记下用户这次的投注记录
                $.get(
                    "addtotalist",
                    {"userid":ids,"date":mytime,"type":'0',"luam":choice2,"rest":0},
                    function (data) {
                    } ,"json"
                );
                $("#btn").attr("disabled", false);
                $("#mychioce").val("  ");
                $("#div3").val("0");
                $("#div4").val("0");
                var num=parseInt($("#span1").val());
                /*修改用户账户金额*/
                $.post(
                    "modifiMoney",
                    {"money":num,"id":ids},
                    function (data) {
                        console.log("success!");
                    } ,"text"
                );

            }
            else if(choice=="0"){$("#result2").val("  "); }
        }

    }, 10000);

    var i=10;
    /*显示倒计时的定期器函数*/
    var  timeoutId2 = setInterval(function () {
        i=i-1;
        $("#timer").val(i);
        if(i==0){
          i=10;
        }
    }, 1000);
   /*投注按钮的触发函数*/
    $("#btn").click(function () {
        var choice=$("#mysel").val();
        $("#div3").val(choice);
        var choice2="0";
        if(choice=="1"){
            choice2="大";
        }else if(choice=="2"){
            choice2="小";
        }
        /*投注的金额*/
        var choice3=$("#mysel2").val();
        $("#div4").val(choice3);
        $("#mychioce").val("押"+choice2+"  ,  "+choice3+"元");
        $("#result2").val("  ");
        var num=parseInt($("#span1").val())-parseInt(choice3);
        $("#span1").val(num);
        $("#btn").attr("disabled", true);

    })
   /*取消投注按钮的触发函数*/
    $("#btn2").click(function () {
        var num=parseInt($("#span1").val())+parseInt($("#div4").val());
        $("#span1").val(num);
        $("#btn").attr("disabled", false);
        $("#result2").val("  ");
        $("#mychioce").val(" ");
        $("#div3").val("0");
        $("#div4").val("0");
    })

    function getLocaltime() {
        var i=1;
        var myDate = new Date();
        var year=myDate.getFullYear();
        var mon=myDate.getMonth()+1;
        i=parseInt(mon);
        if(i<10){
            mon="0"+mon;
        }
        var day=myDate.getDate();
        i=parseInt(day);
        if(i<10){
            day="0"+day;
        }
        var hour=myDate.getHours();
        i=parseInt(hour);
        if(i<10){
            hour="0"+hour;
        }
        var mins=myDate.getMinutes();
        i=parseInt(mins);
        if(i<10){
          mins="0"+mins;
        }
        var secon=myDate.getSeconds();
        i=parseInt(secon);
        if(i<10){
            secon="0"+secon;
        }
        var timelo=""+year+""+mon+""+day+hour+mins+secon+"期";
        return timelo;
    } ;

});

/*
不论是 有没有押中
那么都需要发送异步请求，
后台修改用户的账户金额*/