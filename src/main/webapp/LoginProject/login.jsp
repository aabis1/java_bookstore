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

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">회원가입!</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">로그인 페이지</h2>
						<form method="post" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="userId" id="userId"
									placeholder="ID" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" />
							</div>
					
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" onclick="Login();" value="Login" />
							</div>
						</form>
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

	// id, password 입력받은 값 가져와서
	async function Login() {
		
		var userId = document.getElementById("userId").value;
		
		if (!userId) {
		    alert('userId is empty!');
		    return false;
		}
		
		var password = document.getElementById("password").value;
		
		if (!password) {
		    alert('password is empty!');
		    return false;
		}

	
		// Password 암호화 하고
	var hashedPassword = await hash(password);
	
	SendLoginRequest("userId=" + userId + "&password=" + hashedPassword);
	
    
    alert("로그인 완료되었습니다. 홈페이지로 이동합니다.");
    window.location.href = 'index.jsp';
    
	}
	
	// login.jsp 로 POST 요청 보내기

	
	function SendLoginRequest(string){
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "../login", true);

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

</script>
</body>

</html>