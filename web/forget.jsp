<%-- 
    Document   : forget
    Created on : Jun 23, 2014, 1:09:12 AM
    Author     : alok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Cbzzz Password Recovery</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
		<script src="js/modernizr.custom.63321.js"></script>
        <script type="text/javascript">
		function hidd(){
			var a=document.getElementById("reg");
			a.style.visibility='visible';
		}
		</script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
			body {
				background: #7f9b4e url(images/bg3.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>

</head>

<body>
    <font color="red" size="6">
    <center>
        <h3><%=request.getAttribute("Message")%></h3>
    </center></font>
<div class="container">

    <form class="form-4" action="AuthenticateEmail" method="post">
<h1 style="color:#FFFFFF; font-family:'Comic Sans MS', cursive">Cbuzz help forum. Happy to help you!!!:)</h1>
<h3>Having trouble Sigin!</h3>
<p>Enter your email_id to know your password<br/><br/>
<input type="text" name="email" placeholder="Email Id" required/></p>
<input type="submit" name="submit" value="Continue" />
</form>
</div>
</body>
</html>
