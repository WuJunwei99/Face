
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>宿舍人脸识别</title>

<meta http-equiv="pragma" content="no-cache">

<meta http-equiv="cache-control" content="no-cache">

<meta http-equiv="expires" content="0">

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/stylelogin.css" />

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquerylogin.min.js"></script>
<script type="text/javascript" src="js/vector.js"></script>
</head>
<body>
<div id="output">
<div id="container">
<div class="containerT">
	<form class="form" id="entry_form" action="${pageContext.request.contextPath}/FaceServlet" method="get">
                <h1>人脸识别系统 请把你的脸放摄像头面前</h1>
                <video id="video" width="400" height="300" autoplay></video>
                <canvas id="canvas" width="400" height="300"></canvas>
                <input type="button" onclick="query()" value="点击识别" class="submit_btn"/>

                <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

                <script type="text/javascript">

                    //var 是定义变量

                    var video = document.getElementById("video"); //获取video标签

                    var context = canvas.getContext("2d");

                    var con = {

                        audio: false,

                        video: {

                            width: 1980,

                            height: 1024,

                        }

                    };

                    //导航 获取用户媒体对象

                    navigator.mediaDevices.getUserMedia(con)

                        .then(function (stream) {
                            try {
                                video.src = window.URL.createObjectURL(stream);
                            } catch (e) {
                                console.log(e);
                                video.srcObject = stream;
                            }
                            video.onloadmetadate = function (e) {

                                video.play();

                            }

                        });

                    function query() {

                        //把流媒体数据画到convas画布上去,即将拍下的用户头像画到convas上去

                        context.drawImage(video, 0, 0, 400, 300);

                        //获取到截取到的已经转换成base64的图片
                        var base = getBase64();

                        $.ajax({

                            type: "post",

                            url: "${pageContext.request.contextPath}/FaceServlet",

                            data: {"base": base},

                            success: function (data) {

                                //alert(data)

                                //var result = eval(data);
                                var jsonobj = eval("(" + data + ")");
                                //alert(jsonobj.result)
                                if (jsonobj.result) {

                                    // location.replace("/www.baidu.com");

                                    //此处跳转页面
                                    var info = "识别成功！尊敬的" + jsonobj.studentnum + "欢迎回来!";
                                    alert(info);
                                    location.href = "try.jsp";

                                } else {

                                    alert("面容识别失败,请注明来访理由");
                                    location.href = "visitor.jsp";
                                }
                                ;
                            }
                        });
                    }

                    function getBase64() {
                        //从convas画布上得到图片，并将图片存储将转换成base64编码
                        //canvas.toDataURL([type, encoderOptions]);
                        // 参数type指定图片类型，如果指定的类型不被支持则以默认值image/png替代；
                        // encoderOptions可以为image/jpeg或image/webp类型的图片设置则以默认值0.92替代。图片质量，取值0-1，超出
                        var imgSrc = document.getElementById("canvas").toDataURL(
                            "image/png");
                        //这里得到的是图片的base64 dataURL，而下面是正统的 dataURL 的语法
                        // data:[<mediatype>][;base64],<data>，
                        // 其中mediatype声明了文件类型，遵循MIME规则，如“image/png”、“text/plain”；之后是编码类型，这里我们只涉及 base64


                        //alert(imgSrc);
                        // 下面是canvas base64路径（base64 dataURL）  ，img的src可以直接使用这个地址,再返回这个编码，
                        // 只要取出其中的base64编码部分就好了，并返回
                        return imgSrc.split("base64,")[1];


                    };

                </script>
            </form>
	</div>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    });
</script> 
</body>

</html>
