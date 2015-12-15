<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Profile Page</title>
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
          <link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="scripts/jquery.nivo.slider.setup.js"></script>
        <link rel="stylesheet" type="text/css" href="styles/style4.css" />
		<script src="js/modernizr.custom.63321.js"></script>
        <script type="text/javascript">
            function f1()
            {
                window.open("about.html");
            }
		function hidde()
		{
			var b=document.getElementById("hid");
			b.style.visibility='visible';
		}
		</script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			@import url(http://fonts.googleapis.com/css?family=Raleway:400,700);
			body {
				width:100%;
				height:100%;				
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
				background-color:#666;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.7);
			}
		</style>
        </head>
<body>

<div class="wrapper col1">
  <div id="header">
    <div class="fl_left">
      <h1>Campus Buzz</h1>
      <p>Stay Connected</p>
    </div>
    <div class="fl_right"><a href="#"><img src="images/demo/20.jpg" alt="" /></a></div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
          <li><a href="post.jsp" target="mid">Home</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
        <li><a href="#" onclick="f1()" >Developers</a></li>
    </div>
    <div id="search">
        <form action="IdSearch.jsp" method="post" target="mid">
        <fieldset>
          <legend >Search ID</legend>
          <input type="text" placeholder="Enter name for user_id" />
          <input type="submit" name="go" id="go" value="Search" />
        </fieldset>
      </form>
    </div>
    <br class="clear" />
  </div>
</div>


<div id="left1" style="background-color:rgba(1, 1, 1, 0.5)">
<h4 style="color:#FFF; color:rgba(255, 250, 250, 1);">Welcome,<% out.println((String)AuthenticateServlet.u);%> <label></label></h4>
<h4>
  <p id="user"></h4>
<center>
<img src="imageretrival.jsp" height="150px" width="150px"/>
</center>
<label></label>
</p>
<p style="color:#FFF; color:rgba(255, 250, 250, 1);">Category:
<label style="color:#FFF; color:rgba(255, 250, 250, 1);"></label></p>
<br>

<input type="button" id="ch1" onClick="hidde();" value="Chat">
<br>
<div class="regform" id="hid">
    <form id="chat1" method="post" action="ChatIdAuthenticate">
    <input type="text" name="idk" id="uid" placeholder="User Id">
<br>
<textarea cols="25" rows="4" name="text" id="message"></textarea>
<br>
<input type="submit"  id="go" value="Send"/>
</form>
</div>
</div>

<div id="middle">
    <form class="regform" method="post" action="PostServlet">
<textarea id="post1" name="usrPost" rows="10" cols="75"></textarea>
<input type="submit" id="submit" value="Post"/>
</form>
    <iframe src="post.jsp" id="middle" name="mid" width=700 height=500>
</iframe>
</div>

<div id="righ" style="background-color:rgba(0, 0, 0, 0.5); padding:20px;">
<center>
<form target="mid" action="inbox.jsp">
    <input type="submit" class="regform" id="ch1" name="inbox" value="Inbox">
</form>
<br>
<br>
<form target="mid" action="sent.jsp">
<input type="submit" class="regform" id="ch1" value="Sent">
</form>
<br>
<br>
<form target="mid" action="post.jsp">
<input type="submit" class="regform" id="ch1" value="View Post">
</form>
</center>
</div>

</body>
</html>
