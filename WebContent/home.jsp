<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Welcome to YouPrize</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Login and Registration Form with HTML5 and CSS3" />
<meta name="keywords"
	content="html5, css3, form, switch, animation, :target, pseudo-class" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/additional-methods.min.js"></script>
</head>
<body
	style="background: url(214.png) no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;">
	<div>
		<div style="float: left;margin-left: 5px;">
			<img src="176.png" >
		</div>
		<div style="height:169px;">
			<p style="color:white;font-size:30px; text-align: center;margin-top: 20px;">Welcome to YouPrize</p>
			<p style="color:white;font-size:20px; text-align: center;">Discover award-winning content, share, and connect through what you prize.</p>
		</div>
	</div>
	<section>
	<div id="container_demo">
		<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
		<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
			id="tologin"></a>
		<div id="wrapper">
			<div id="login" class="animate form">
				<form method="post" action="login.jsp" autocomplete="on"
					id="loginForm">
					<h1>Log in</h1>
					<p>
						<label for="username" class="uname" data-icon="u"> Your
							email </label> <input id="username" name="username"
							type="text" placeholder="mymail@mail.com" />
					</p>
					<p>
						<label for="password" class="youpasswd" data-icon="p">
							Your password </label> <input id="password" name="password"
							type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p class="keeplogin">
						<input type="checkbox" name="loginkeeping" id="loginkeeping"
							value="loginkeeping" /> <label for="loginkeeping">Keep
							me logged in</label>
					</p>
					<p class="login button">
						<input type="submit" value="Login" />
					</p>
					<p class="change_link">
						New to YouPrize? Sign Up for free  <a href="#register" class="to_register">Join
							us</a>
					</p>
				</form>
			</div>
			<div id="register" class="animate form">
				<form method="post" action="registration.jsp" autocomplete="on"
					id="myForm">
					<h1>Sign up</h1>
					<p>
						<label for="usernamesignup" class="uname" data-icon="u">First
							Name</label> <input id="fname" name="fname" required="required"
							type="text" placeholder="mysuperusername690" />
					</p>
					<p>
						<label for="usernamesignup" class="uname" data-icon="u">Last
							Name</label> <input id="
" name="lname" required="required"
							type="text" placeholder="mysuperusername690" />
					</p>
					<p>
						<label for="emailsignup" class="youmail" data-icon="e">
							Your email</label> <input id="email" name="emailsignup"
							required="required" type="email"
							placeholder="mysupermail@mail.com" />
					</p>
					<p>
						<label for="pass" class="youpasswd" data-icon="p">Your
							password </label> <input id="pass" name="pass"
							required="required" type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p>
						<label for="pass2" class="youpasswd"
							data-icon="p">Please confirm your password </label> <input
							id="pass2" name="pass2" required="required"
							type="password" placeholder="eg. X8df!90EO" />
					</p>
					<p class="signin button">
						<input type="submit" value="Sign up" onclick="submitForm();" />
					</p>

					<p class="change_link">

						Already a member ? <a href="#tologin" class="to_login"> Go and
							log in </a>
					</p>
				</form>
				</div>
				<script>

// Code below changes between login and reg
$(".to_register").click(function(event){
    event.preventDefault(); // you href attr isn't working anymore
    $("#login").animate({
        opacity:"0"       
    },200, function(){
            $(this).css("z-index","1");
        });
    $("#register").animate({
        opacity:"1"       
    },200, function(){
            $(this).css("z-index","2");
        });

});

// Code below returns to login
$(".to_login").click(function(event){
    event.preventDefault(); // you href attr isn't working anymore
    $("#login").animate({
        opacity: 1       
    },400, function(){
            $(this).css("z-index","2");
        });
    $("#register").animate({
        opacity: 0,
          
    },400, function(){
            $(this).css("z-index","1");
            scroll(0,0);
        });

});




function submitForm(){
var validator = $("#myForm").validate({
rules: {     
fname: "required",
lname: "required",
email: "required",
pass: "required",
pass2: {
    equalTo:"#pass"
  }
    }, 
    errorElement: "span" ,                              
    messages: {
    name: " Enter Name",
	lname: "Enter Last name",
	email: " Enter email",
    pass: " Enter Password",
    pass2: " Must match password"
    }
});





if(validator.form()){ // validation perform

//$('form#myForm').attr({action: 'mycontroller'});
$('form#myForm').submit();

}

}

var loginVal = $("#loginForm").validate({
    rules: {     


username: "required",

password: "required",

    },  

    errorElement: "span" ,                              

    messages: {

    name: " Enter Username",

lname: "Enter password"

    }
});



</script>
</body>
</html>