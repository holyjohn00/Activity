<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/demo.css" />

<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" type="text/css" href="css/content.css" />
<link href="css/full.css" rel="stylesheet">
<script src="js/modernizr.custom.js"></script>
</head>
<body>
	<div
					class="morph-button morph-button-modal morph-button-modal-2 morph-button-fixed">
					<button type="button">Login</button>
					<div class="morph-content">
						<div>
							<div class="content-style-form content-style-form-1">
								<span class="icon icon-close">Close the dialog</span>
								<h2>Login</h2>
								<form action="Login" method="post">
									<p>
										<label>Username</label><input type="text" name="username" />
									</p>
									<p>
										<label>Password</label><input type="password" name="password" />
									</p>
									<p>
										<input type="submit" value="login">
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div
					class="morph-button morph-button-modal morph-button-modal-3 morph-button-fixed">
					<button type="button">Signup</button>
					<div class="morph-content" >
						<div>
							<div class="content-style-form content-style-form-2" >
								<span class="icon icon-close">Close the dialog</span>
								<h2>Sign Up</h2>
								<form action="Signup" method="post" >
									<p>
										<input type="text" name="firstname" placeholder="first name"/>
									</p>
									<p>
										<input type="text" name="lastname" placeholder="last name"/>
									</p>
									<p>
										<input type="text" name="username" placeholder="username"/>
									</p>

									<p>
										<input type="password" name="password" placeholder="password"/>
									</p>
									<p>
										<input type="password" name="password2" placeholder="password2"/>
									</p>
									<p>
										<input type="text" name="email" placeholder="email"/>
									</p>
									<p>
										<input type="submit" value="Sign Up">
									</p>
								</form>
							</div>
						</div>
					</div>
					</div>
</body>
<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/uiMorphingButton_fixed.js"></script>
	<script>
		(function() {
			var docElem = window.document.documentElement, didScroll, scrollPosition;

			// trick to prevent scrolling when opening/closing button
			function noScrollFn() {
				window.scrollTo(scrollPosition ? scrollPosition.x : 0,
						scrollPosition ? scrollPosition.y : 0);
			}

			function noScroll() {
				window.removeEventListener('scroll', scrollHandler);
				window.addEventListener('scroll', noScrollFn);
			}

			function scrollFn() {
				window.addEventListener('scroll', scrollHandler);
			}

			function canScroll() {
				window.removeEventListener('scroll', noScrollFn);
				scrollFn();
			}

			function scrollHandler() {
				if (!didScroll) {
					didScroll = true;
					setTimeout(function() {
						scrollPage();
					}, 60);
				}
			}
			;

			function scrollPage() {
				scrollPosition = {
					x : window.pageXOffset || docElem.scrollLeft,
					y : window.pageYOffset || docElem.scrollTop
				};
				didScroll = false;
			}
			;

			scrollFn();

			[].slice.call(document.querySelectorAll('.morph-button')).forEach(
					function(bttn) {
						new UIMorphingButton(bttn, {
							closeEl : '.icon-close',
							onBeforeOpen : function() {
								// don't allow to scroll
								noScroll();
							},
							onAfterOpen : function() {
								// can scroll again
								canScroll();
							},
							onBeforeClose : function() {
								// don't allow to scroll
								noScroll();
							},
							onAfterClose : function() {
								// can scroll again
								canScroll();
							}
						});
					});

			// for demo purposes only
			[].slice.call(document.querySelectorAll('form button')).forEach(
					function(bttn) {
						bttn.addEventListener('click', function(ev) {
							ev.preventDefault();
						});
					});
		})();
	</script>
</html>