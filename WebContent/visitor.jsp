<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智享楼栋管理系统-访客登记</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/stylelogin.css">
	<link rel="stylesheet" type="text/css" href="css/visitorstyle.css">
	<script type="text/javascript" src="js/jquerylogin.min.js"></script>
	<script type="text/javascript" src="js/vector.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style >#jz{ margin:0 auto; width:320px; height:50px; }</style>
  </head>
  
  <body>
   <div id="container">
	<div id="output">
		<div class="containerT">
			<h1>智享楼栋管理系统</h1>
			<h1>访客登记</h1>
			<form class="form" id="entry_form" action="InsertVisitor">
				<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " placeholder="访客id" id="visitor_id" name="visitor_id" >
				<input type="text" placeholder="访客姓名" id="visitor_name" name="visitor_name">
				
				
				
				<div id="jz" class="c-dropdown js-dropdown" align="center">
 					<input type="hidden" name="visitor_reason" id="visitor_reason" class="js-dropdown__input">
 					<span class="c-button c-button--dropdown js-dropdown__current">来访原因</span>
 					<ul class="c-dropdown__list">
  					<li class="c-dropdown__item" data-dropdown-value="探望朋友" value="探望朋友">探望朋友</li>
    				<li class="c-dropdown__item" data-dropdown-value="参加聚会" value="参加聚会">参加聚会</li>
    				<li class="c-dropdown__item" data-dropdown-value="检查卫生" value="检查卫生">检查卫生</li> 
    				<li class="c-dropdown__item" data-dropdown-value="路过上厕所" value="路过上厕所">路过上厕所</li> 
					</ul>
				</div>
				
				<br>
				<br>
				<br>
				<br>
				<br>
				<button type="submit id="entry_btn">提交</button>
				<div id="prompt" class="prompt"></div>
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
<script src='js/jquery.min.js'></script>

   
 <script  src="js/index.js"></script>


<div style="text-align:center;">
  </body>
</html>
