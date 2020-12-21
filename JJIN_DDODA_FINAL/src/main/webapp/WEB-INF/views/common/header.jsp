<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <div class="col-md-6">
                                <div class="navbar-socail text-right sm-text-center">
                                    <ul class="list-inline">
                                        <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                        <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href=""><i class="fa fa-behance"></i></a></li>
                                        <li><a href=""><i class="fa fa-dribbble"></i></a></li>
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
                        <a class="navbar-brand" href="#brand">
                            <img src="assets/images/logo.png" class="logo" alt="">
                            <!--<img src="assets/images/footer-logo.png" class="logo logo-scrolled" alt="">-->
                        </a>

                    </div>
                    <!-- End Header Navigation -->

                    <!-- navbar menu -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right"> <!-- bootstrap.css의 navbar-right -->
                            <li><a href="/">Home</a></li>                    
                            <li><a href="#features">Calendar</a></li>
                            <li><a href="#business">Facility</a></li>
                            <li class="dropdowns">
                            	<a href="#test">Community</a>
                            	<div class="dropdown-contents">
                            		<a href="opendiaryList.doa">공유일기 커뮤니티</a><br>
                            		<a href="mateList.doa">메이트 커뮤니티</a>
                            	</div>
                            </li>
                            <li><a href="requireList.doa">Q&A</a></li>
                            <li><a href="#test">Mypage</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div> 
            </nav>

</body>
</html>