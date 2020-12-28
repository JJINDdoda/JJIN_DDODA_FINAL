<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
@media ( max-width : 991px) {
	.f_item_icon {
		margin-left : 5%;
	}
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- end header -->
	
	<!--Home Sections-->
            <section id="home" class="home bg-black fix" style="height:600px">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="col-md-12">
                                <div class="hello_slid">
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 class="text-white">Welcome to <strong>DDO:DA</strong></h2>
                                            <h1 class="text-white">더이상, 다이어트 실패하지 마세요</h1>
                                            <h3 class="text-white">- 알맞은 운동센터를 찾으세요? 검색해보세요! -</h3>
                                        </div>

                                        <div class="home_btns m-top-40">
                                            <a href="facilityListView.doa" class="btn btn-primary m-top-20">Search</a>
                                           
                                        </div>
                                    </div><!-- End off slid item -->
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 class="text-white">Welcome to <strong>DDO:DA</strong></h2>
                                            <h1 class="text-white">건강한 삶을 가져보세요</h1>
                                            <h3 class="text-white">- 우리는 캘린더를 서비스를 제공해드립니다. -</h3>
                                        </div>

                                        <div class="home_btns m-top-40">
                                            <a href="calendarView.doa" class="btn btn-primary m-top-20">Calendar</a>
                                           
                                        </div>
                                    </div><!-- End off slid item -->
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 class="text-white">Welcome to <strong>DDO:DA</strong></h2>
                                            <h1 class="text-white">혼자하는 다짐은 오래가지 못합니다.</h1>
                                            <h3 class="text-white">- 당신의 운동 메이트들을 찾아보세요.  -</h3>
                                        </div>

                                        <div class="home_btns m-top-40">
                                            <a href="mateList.doa?category=health" class="btn btn-primary m-top-20">Mate</a>
                                            
                                        </div>
                                    </div><!-- End off slid item -->
                                </div>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section>
    <!--End off Home Sections-->	
	<br><br>
	<!--Featured Section-->
            <section id="features" class="features">
                <div class="container">
                    <div class="row">
                        <div class="main_features fix roomy-70">
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30">
                                    <div class="f_item_icon">
                                        <i class="fa fa-thumbs-o-up" style="color:#f7bf99;"></i>
                                    </div>
                                    <div class="f_item_text">
                                        <h3>Best Quality</h3>
                                        <p>업계 쵝오</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30" >
                                    <div class="f_item_icon">
                                        <i class="fa fa-tablet" style="color:#f7bf99;"></i>
                                    </div>
                                    <div class="f_item_text">
                                        <h3>Responsive Design</h3>
                                        <p>어디서든 와우</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30">
                                    <div class="f_item_icon">
                                        <i class="fa fa-sliders" style="color:#f7bf99;"></i>
                                    </div>
                                    <div class="f_item_text">
                                        <h3>Easy to Customize</h3>
                                        <p>쩔지</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End off row -->
                </div><!-- End off container -->
            </section><!-- End off Featured Section-->
    
    <br><br>
	<!--Business Section-->
            <section id="business" class="business bg-grey roomy-70">
                <div class="container">
                    <div class="row">
                        <div class="main_business">
                            <div class="col-md-6">
                                <div class="business_slid">
                                    <div class="slid_shap bg-grey"></div>
                                    <div class="business_items text-center">
                                        <div class="business_item" style="height:300px;">
                                            <div class="business_img">
                                                <img src="/resources/assets/about-img1.jpg" alt="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="business_item sm-m-top-50">
                                    <h2 class="text-uppercase"><strong>DDODA, </strong> WHAT IS DDODA?</h2>
                                    <ul>
                                        <li><i class="fa fa-arrow-circle-right"></i> You can keep a diary every day</li>
                                        <li><i class="fa  fa-arrow-circle-right"></i> You can search health center</li>
                                        <li><i class="fa  fa-arrow-circle-right"></i> You can make friends</li>
                                    </ul>
                                    <p class="m-top-20">If you are with us, you can make a healthy life. Because we make you develop your own life through our functions.</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End off Business section -->
	<!-- end content -->
	<br><br><br>
	<!-- footer -->
		 <section id="action" class="action bg-primary roomy-40">
                <div class="container">
                    <div class="row">
                        <div class="maine_action">
                            <div class="col-md-8"style="">
                                <div class="action_item text-center" >
                                    <h2 class="text-white text-uppercase">올해의 브랜드 대상 2년 연속 수상</h2>
                                </div>
                                <div class="action_item text-center">온라인 서비스 부문 1위 | 올해를 빛낸 프로그램 부문 2위</div>
                            </div>
                            <div>
                                <div class="trophy">
                                    <img src="../resources/assets/trophy.png" alt="" style="width:100px;height:80px;margin-right:1%;"/>
                                     <img src="../resources/assets/trophy.png" alt="" style="width:100px;height:80px;"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>
