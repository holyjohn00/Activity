<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	if(session.getAttribute("username")!= null){
		
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css"
	href="cssSliding/normalize.css" />
<link rel="stylesheet" type="text/css" href="cssSliding/demo.css" />
<link rel="stylesheet" type="text/css"
	href="cssSliding/layout-simple.css" />
</head>

<body>
	<body>
	<div id="container" class="container">
		<header class="intro">
			<img class="intro__image" src="images/bg1.jpg"
				alt="Iceland galcier" />
			<div class="intro__content">
				<%
			HttpSession ses = request.getSession();
			String firstname = ses.getAttribute("firstname").toString();
			String lastname = ses.getAttribute("lastname").toString();
			out.print("<h1 class=\"intro__title\"> "
					+ firstname + " "+ lastname + "</h1>");
			%>
				<div class="intro__subtitle">
					
					<div class="intro__description">
						<div class="demos">
							<a class="demos__item demos__item--current" href="Logout">Logout</a>
						</div>
					</div>
					<button class="trigger">
						<svg width="100%" height="100%" viewBox="0 0 60 60"
							preserveAspectRatio="none">
								<g class="icon icon--grid">
									<rect x="32.5" y="5.5" width="22" height="22" />
									<rect x="4.5" y="5.5" width="22" height="22" />
									<rect x="32.5" y="33.5" width="22" height="22" />
									<rect x="4.5" y="33.5" width="22" height="22" />
								</g>
								<g class="icon icon--cross">
									<line x1="4.5" y1="55.5" x2="54.953" y2="5.046" />
									<line x1="54.953" y1="55.5" x2="4.5" y2="5.047" />
								</g>
							</svg>
						<span>View content</span>
					</button>
				</div>
			</div>
			<!-- /intro__content -->
		</header>
		
	</div>
</body>
<script src="jsSliding/classie.js" ></script>
	<script>
		(function() {
			var container = document.getElementById('container'), trigger = container
					.querySelector('button.trigger');

			function toggleContent() {
				if (classie.has(container, 'container--open')) {
					classie.remove(container, 'container--open');
					classie.remove(trigger, 'trigger--active');
					window.addEventListener('scroll', noscroll);
				} else {
					classie.add(container, 'container--open');
					classie.add(trigger, 'trigger--active');
					window.removeEventListener('scroll', noscroll);
				}
			}

			function noscroll() {
				window.scrollTo(0, 0);
			}

			// reset scrolling position
			document.body.scrollTop = document.documentElement.scrollTop = 0;

			// disable scrolling
			window.addEventListener('scroll', noscroll);

			trigger.addEventListener('click', toggleContent);

			// For Demo purposes only (prevent jump on click)
			[].slice.call(document.querySelectorAll('.items-wrap a')).forEach(
					function(el) {
						el.onclick = function() {
							return false;
						}
					});
		})();
	</script>
</html>
<% 
	} else{
		response.sendRedirect("index.jsp");
		
	}
%>