<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@media (max-width : 991px) {
		.menub {height: 19%;}
	}
	
	@media (max-width : 768px) {
		.menub {height: 19%;}
	}
	
	@media ( min-width : 992px) and (max-width : 1904px) {
		.menub {
			height: 80%;
		}
		.dropdowns {
			margin-bottom: 60px;
		}
	}
</style>
</head>
<body>
	<div class="menub">
		<ul>
			<li class="dropdowns"><a href="#">커뮤니티</a>
				<ul class="dropdown-contents" style="text-align: center;">
					<li><a href="adminRequireList.doa">요청사항</a></li>
					<li><a href="noticeRequireList.doa">공지사항</a></li>
					<li><a href="adminChatList.doa">채팅</a></li>
				</ul>
			</li>
			<li class="dropdowns"><a href="adminFacilityList.doa">운동시설</a></li>
			<li class="dropdowns"><a href="adminCalorieList.doa">음식칼로리</a></li>
			<li><a href="adminMemberList.doa">회원관리</a></li>
		</ul>
	</div>
</body>
</html>