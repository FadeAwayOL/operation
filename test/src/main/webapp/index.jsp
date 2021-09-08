<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/9/6
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*,cn.fade.Question"  contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>首页</title>
    <script type="text/javascript" src="./jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function (){
            var j=0,flag=false;
            var language=1;
            var config = {
                "title": ['四则运算题目', 'Four arithmetic problems'],
                "view": ['查看答案', 'View answers'],
                "start": ['开始答题', 'Start answering questions'],
                "exchange": ['English', '简体中文'],
                "countdown": ["倒计时60s", "count down 60s"],
                "check": ["提交答案", "Submit"],
                "refresh": ['刷新题目', 'Refresh title'],
                "score": ['分数', 'score']
            }

            $("#demo").click(function (){
                //var d2 = document.getElementById('demo4');
                //d2.click();
                if(!flag){
                    count_time();
                    flag=true;
                }
                else{
                    return;}
                //   $("input").toggle();
                 console.log("get");
            })
            $("#demo2").click(function (){
                $("span[class='an']").toggle();
                console.log("get");
            })
            $("#demo3").click(function (){
                console.log("demo3");
                check();
            })
            $("#language").click(function (){

                changeLanguage();
                //timer = setInterval("CountDown()", 1000);

            })
            $("#exchange").change(function (e) {
                e.preventDefault();
                language = language * (-1);
                var index = $(this).val();
                console.log("index " + index);
                $(".btnn").each(function () {
                    var _this = $(this);
                    console.log(config['title']);
                    console.log(_this);
                    console.log(config[_this.data("name")]);
                    console.log("in " + config[_this.data("name")][index]);
                    _this.html(config[_this.data("name")][index]);
                })
            })
            function count_time(time) {
                if (time != undefined) {
                    var len = time;
                } else {
                    var len = 60;
                }
                btn = $("#time");
                btn.text(len + 's');
                ctime = setInterval(function () {
                    usetime = parseFloat(btn.text()) - 1;
                    btn.text(parseFloat(btn.text()) - 1 + 's');
                    console.log(parseFloat(btn.text()));
                    console.log(typeof parseFloat(btn.text()));
                    if (parseFloat(btn.text()) === 0){
                        console.log("stop");
                        clearInterval(ctime);
                        check();
                    }
                }, 1000);
            }
            function check() {
                j=0;
                let a = $("input");
                let b = $("span[class='an']");
                let c = $("span[class='notice']");
                for(let i = 0; i < 10 ; i++){
                    console.log(a.eq(i).val() + "-----" + b.eq(i).text())
                    if(a.eq(i).val() == b.eq(i).text()){
                        // alert(i+"right")
                        j++;
                        console.log(j);
                        c.eq(i).text("✔");
                    } else {
                        //alert(i+"wrong")
                        c.eq(i).text("❌");
                    }
                }
                console.log(j);
                $("#score").text(10*j);
                clearInterval(ctime);
                flag=false;
            }


        })
        function renovates() {
            document.location.reload();
            flag=false;
        }

        function changeLanguage() {

            language = language * (-1);
            var index = $(this).val();
            $(".btnn").each(function () {
                var _this = $(this);
                _this.html(lanconfig[_this.data("name")][index]);
            })

            // document.getElementById("demo1").innerText = "Four arithmetic problems";
            // document.getElementById("demo").innerText = "Start answering questions";
            // document.getElementById("demo2").innerText = "View answers";
            // document.getElementById("demo3").innerText = "Hand in the paper";
            // document.getElementById("renovates").innerText = "Refresh title";
            // document.getElementById("language").innerText = "Language switching";
            // document.getElementById("divcss5").innerText = "count down 60s";
            // document.getElementById("w").innerText = "score ";
        }
    </script>
<%--    <SCRIPT type="text/javascript">--%>
<%--            var maxtime = 1 * 59; //一个小时，按秒计算，自己调整!--%>
<%--            function CountDown() {--%>
<%--                if (maxtime >= 0) {--%>
<%--                    msg = Math.floor(maxtime / 60);--%>
<%--                    secondsMsg = Math.floor(maxtime % 60);--%>

<%--                    if (msg == 0) {--%>
<%--                        document.all["divcss5"].innerHTML = "";--%>
<%--                    } else if (msg < 10) {--%>
<%--                        document.all["divcss5"].innerHTML = "0" + msg;--%>
<%--                    } else {--%>
<%--                        document.all["divcss5"].innerHTML = msg;--%>
<%--                    }--%>

<%--                    document.all["timerSeconds"].innerHTML = secondsMsg;--%>
<%--                    // if (maxtime == 5 * 60)alert("还剩5分钟");--%>

<%--                    --maxtime;--%>
<%--                } else {--%>
<%--                    clearInterval(timer);--%>
<%--                    document.all["timerSeconds"].innerHTML = "Time's up";--%>
<%--                    var d1 = document.getElementById('demo3');--%>
<%--                    d1.click();--%>
<%--                }--%>
<%--            }--%>

<%--            timer = setInterval("CountDown()", 1000);--%>
<%--    </SCRIPT>--%>
    <style>
        body{

           text-align: center;

        }
        .notice{
            font-family: Microsoft YaHei; /* 设置字体 */
            color: red; /* 字体颜色 */
            font-size: 10px; /* 字体大小 */
            margin: auto;
            solid-color: #1E90FF;

        }
        button { /* 按钮美化 */
            width: 270px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
            margin: auto;
        }
        #exchange { /* 按钮美化 */
            width: 270px; /* 宽度 */
            height: 40px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: #1E90FF; /* 背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
            margin: auto;
            text-align: center;
        }
        div{
            width: 250px; /* 宽度 */
            height: 30px; /* 高度 */
            border-width: 0px; /* 边框宽度 */
            border-radius: 3px; /* 边框半径 */
            background: red; /*
             背景颜色 */
            cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
            outline: none; /* 不显示轮廓线 */
            font-family: Microsoft YaHei; /* 设置字体 */
            color: white; /* 字体颜色 */
            font-size: 17px; /* 字体大小 */
            margin: auto;
            text-align: center;
        }
        #divcss5{
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -150px 0 0 -250px;
            width: 90px;
            height: 50px;
        //border: 1px solid red;
        }
        #timerSeconds{
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -70px 0 0 -250px;
            width: 50px;
            height: 50px;
        //border: 1px solid red;
        }
    </style>
</head>
    <div id="demo1" class="btnn" data-name="title">四则运算题目</div><br>
    <button id="demo" class="btnn" data-name="start">开始答题</button>
    <button id="demo2" class="btnn" data-name="view">查看答案</button>
    <button id="demo3" class="btnn" data-name="check">交卷</button>
    <button id="renovates" class="btnn" data-name="refresh" onclick="renovates()" />刷新题目</button>
    <button id="language" hidden/>英语切换</button>
    <select id="exchange" class="btnn2">
        <option value="0">简体中文</option>
        <option value="1">English</option>
    </select>

    <button id="divcss5" class="btnn" data-name="countdown" >倒计时60S</button>

    <button id="timerSeconds" ><span id="time"></span></button>
    <br>
    <br>
    <div ><span id="w" class="btnn" data-name="score">分数：</span><span id="score"></span></div>
    <%
        for(int i=0;i<10;i++) {
            Question question = new Question();
            question.setEquation();
            String test = question.getEquation();
            String result = question.result();
    %>
    <ul ><%=test %><input type="text" ><span class="an" style="display:none"><%=result %></span><span  class="notice"></span></ul>
    <% } %>

</body>
</html>
