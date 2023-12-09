<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<input type="hidden" id="status" value=<%= request.getAttribute("status") %>>">
	
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">회원가입</h2>
					
						<form method="post" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="text" name="userId" id="userId" placeholder="Your Id" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>

							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>저는 모두 이해했으면 <a href="#" class="term-service">약관 동의</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" onclick="Registration();" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">로그인 하러 가기</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
	
	async function Registration() {
		var name = document.getElementById("name").value;
		
		if (!name) {
		    alert('name is empty!');
		    return false;
		}
		
		var userId = document.getElementById("userId").value;
		
		if (!name) {
		    alert('userId is empty!');
		    return false;
		}
		
		var password = document.getElementById("pass").value;
		var repeatPassword = document.getElementById("re_pass").value;
		
		if(!password)
			{
			alert('Password Is Empty');
			return false;
			}
		
		if(!repeatPassword){
			alert('2');
			return false;
		}
		
		if(password !== repeatPassword){
			alert('일치하지 않음');
			return false;
		}
		
		var hashedPassword = await hash(password);
		
		SendRegistrationRequest("name=" + name + "&userId=" + userId + "&password=" + hashedPassword);
		
	    
	    alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
	    window.location.href = 'login.jsp';
	}	
	
	function SendRegistrationRequest(string){
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "../register", true);

		// Send the proper header information along with the request
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	
		xhr.send(string);
	}
	
	function hash(string) {
		  const utf8 = new TextEncoder().encode(string);
		  return crypto.subtle.digest('SHA-256', utf8).then((hashBuffer) => {
		    const hashArray = Array.from(new Uint8Array(hashBuffer));
		    const hashHex = hashArray
		      .map((bytes) => bytes.toString(16).padStart(2, '0'))
		      .join('');
		    return hashHex;
		  });
		}
	
	//var status = document.getelement8yId("status").value;
	//if(status == "success"){
	//	swal("축하해요","계정 정상적으로 만들어졌어요","success");
	//}

</script>


</body>

</html>