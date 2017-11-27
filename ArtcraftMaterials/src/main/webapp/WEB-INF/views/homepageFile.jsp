
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>ArtcraftMaterials -${title }</title>

<script>
	window.menu = "${title}";
</script>
   

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>
<!-- navigation -->
<%@include file="./shared/navbar.jsp"%>

<!-- page content -->
   <!-- loading the home content -->
			<c:if test="${userclickhome"" true }">
				<%@include file="home.jsp"%>
			</c:if>

			<!-- load only when user clicks about -->
			<c:if test="${userclickabout"" true }">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- load only when user clicks contact -->
			<c:if test="${userclickcontact"" true }">
				<%@include file="contact.jsp"%>
			</c:if>
		
		</div>
	</div>
   

    <!--footer comes here  -->
    <%@include file="./shared/footer.jsp"%>

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>

</html>
