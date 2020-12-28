<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link rel="stylesheet" href="../resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="../resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="../resources/css/animate.css">
        <link rel="stylesheet" href="../resources/css/iconfont.css">
        <link rel="stylesheet" href="../resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="../resources/css/bootstrap.css">
        <link rel="stylesheet" href="../resources/css/magnific-popup.css">
        <link rel="stylesheet" href="../resources/css/bootsnav.css">
        <!-- xsslider slider css -->

        <!--<link rel="stylesheet" href="assets/css/xsslider.css">-->

        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="../resources/css/style.css">
        <!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="../resources/css/responsive.css" />

        <script src="../resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"> -->


<style>
/*  제목용 폰트 */
@font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('/resources/fonts/Wemakeprice_TTF/Wemakeprice-Bold.ttf') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*  메뉴바용 폰트 */
@font-face {
    font-family: 'Wemakeprice-Regular';
    src: url('/resources/fonts/Wemakeprice_TTF/Wemakeprice-Regular.ttf') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*  바디용 폰트 */
@font-face {
    font-family: 'NanumSquareR';
    src: url('/resources/fonts/NanumFontSetup_TTF_SQUARE/NanumSquareR.ttf') format('woff');
    font-weight: normal;
    font-style: normal;
}
.dropdown-btn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  border: none;
}
.dropdown-wrapper {
  position: relative;
  display: inline-block;
}
.dropdown-contents {
	display:none;
	position : absolute;
  background-color: #f1f1f1;
  min-width: 130px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-contents a {
  color: black;
  padding: 12px 13px;
  text-decoration: none;
  display: block;
}

.dropdown-wrapper:hover .dropdown-contents {display: block;}
.dropdown-wrapper:hover .dropdown-btn {background-color: #3e8e41;}

@media ( max-width : 991px) {
	.dropdown-contents  {
		display:none; position:relative;
		box-shadow : none;
		 background-color: white;
	}
	.dropcontents  a{
	} 
	.dropdowns:hover .dropcontents{display:block;}
	.dropdowns:hover .dropcontents>a:hover{ color:white;}
	.dropdowns:hover .dropbtns {background-color: white;}
	.dropcontents li {
		position : relative;
	}
	.navbar-brand > img {
		 width:150px;
		 height:47px;
		 padding-top:10px;
	}
}

.dropdown-contents {display : none;}
.dropdowns:hover .dropdown-contents{display:block;}
.dropdowns:hover .dropdown-contents>a:hover{background-color : gray; color:white;}
</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
 <!-- JS includes -->
        <script src="../resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="../resources/js/vendor/bootstrap.min.js"></script>

        <script src="../resources/js/owl.carousel.min.js"></script>
        <script src="../resources/js/jquery.magnific-popup.js"></script>
        <script src="../resources/js/jquery.easing.1.3.js"></script>
        <script src="../resources/css/slick/slick.js"></script>
        <script src="../resources/css/slick/slick.min.js"></script>
        <script src="../resources/js/jquery.collapse.js"></script>
        <script src="../resources/js/bootsnav.js"></script>

        <script src="../resources/js/plugins.js"></script>
        <script src="../resources/js/main.js"></script>

        <div class="culmn">
            <!--Home page style-->

            <nav class="navbar navbar-default bootsnav">
                <div class="navbar-top bg-grey fix">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="navbar-callus text-left sm-text-center">
                                    <ul class="list-inline">
                                        <li><a href=""><i class="fa fa-phone"></i> Call us: 1234 5678 90</a></li>
                                        <li><a href=""><i class="fa fa-envelope-o"></i> Contact us: your@email.com</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="/">
                            <img src="../resources/assets/mainlogo.jpg" class="logo" alt="" style="width:150px;height:50px;padding-top:5px;">
                            <!--<img src="assets/images/footer-logo.png" class="logo logo-scrolled" alt="">-->
                        </a>

                    </div>
                    <!-- End Header Navigation -->
					<input type="hidden" id="userId" name="userId" value="${loginUser.userId }">
                    <!-- navbar menu -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right"> <!-- bootstrap.css의 navbar-right -->
                            <li><a href="/">Home</a></li>                    
                            <li id="calendarr"><a href="calendarView.doa">Calendar</a></li>
                            <li class="dropdown-wrapper">
                            	<a href="facilityListView.doa">Facility</a>
                            	<ul class="dropdown-contents">
                            		<li><a href="facilityListView.doa">시설찾기</a></li>
                            		<c:if test="${loginUser.userField eq 'healthCeo'}">
                            			<li><a href="facilityInfoRegistView.doa">시설등록</a></li>
                            			<li><a href="myfacilityList.doa">내가 등록한 시설</a></li>
                            		</c:if>
                            	</ul>
                            </li>
                            <li class="dropdown-wrapper">
                            	<a class="dropdown-btn" href="#">Community</a>
                            	<ul class="dropdown-contents">
                            		<li><a href="opendiaryList.doa">공유일기 커뮤니티</a></li>
                            		<li><a href="mateList.doa?category=health">메이트 커뮤니티</a></li>
                            	</ul>
                            </li>
                            <li><a href="requireList.doa">Q&A</a></li>
                            <c:choose>
                            	<c:when test="${ empty sessionScope.loginUser }">
                            		<li><a href="LoginView.doa">Login</a></li>
                            	</c:when>
                            	<c:when test="${ !empty sessionScope.loginUser }">
                            		<c:if test="${loginUser.userId == 'admin' }">
                            			<li class="dropdowns">
                            				<a href="adminRequireList.doa">Admin</a>
                            				<div class="dropdown-contents">
                            					<a href="logout.doa">로그아웃</a>
                            				</div>
                            			</li>
                            		</c:if>
                            		<c:if test="${loginUser.userId != 'admin' }">
                            			<li><a href="myInfo.doa">Mypage</a></li>
                                    	<li><a href="logout.doa">Logout</a></li>
                                    </c:if>
                            	</c:when>
                            </c:choose>
                        </ul>
                    </div><!-- /.navbar-collapse -->
            </nav>
<!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div>
   <!--End off Preloader -->
   <script>
   $("#calendarr").on("click", function() {
	   var userId = $('#userId').val();
	  if(userId == "") {
		  alert("로그인 후 이용해주세요.");
		  return false;
	  } else {
	  }
   });
   </script>
</body>
</html>