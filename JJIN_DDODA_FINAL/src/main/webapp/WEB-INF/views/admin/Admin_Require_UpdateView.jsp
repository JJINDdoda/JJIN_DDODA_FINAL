<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/basicStyle.css">
<style>
.main-name-h2 {
	font-family: 'Wemakeprice-Regular';
	color: #424242;
	font-size : 1.7em;
}
.menub {
	margin-left:6%;
	width:150px;
	height : 570px;
	background-color:white;
	text-align:left;
	float:left;
	border : 1px solid #edd5c5;
	border-top : 1px solid #f7bf99;
}

.menub>ul li {
	padding-left : 15px;
}
.menub>ul li:first-child {
	border-left : 1px solid #f7bf99;
	background-color:#f7bf99;
	height:40px;
	margin-top:0;
}
.menub>ul>li a {
	font-family: 'NanumSquareR';
	color:#797979;
	position:relative;
}
.menub>ul>li:hover a, .menub>ul>li:hover .imgwrapper {
	color : #f7bf99;
	-webkit-transition: all 0.5s ease;
  	transition: all 0.5s ease;
}
.name {
	width:100px;
	float:left;
}
.more {
	width:100px;
}
.menub>ul>li .imgwrapper {
	width:120px;
	text-align:right;
	color : #707070;
}
.menub>ul li .imgwrapper img {
	width:10px;
}
.main {
	width : 94%;
	margin-left : 5%;
}
.table, table {
	font-family: 'NanumSquareR';
	font-size : 0.6em;
}
.tableComment {
	font-size : 0.2em;
}

.table tr {
	width : 100%;
	border-top : 1px solid white;
}
.table tr td {
	padding-top : 10px;
	padding-bottom : 10px;
	text-align :center;
	font-size : 1.3em;
}
input[type="text"] {
	width: 100%;
}
textarea {
	width : 100%;
	resize : none;
}

.btndelete {
	width:68%;
	text-align:right;
	}
.addReply{
	width:7%;
	text-align:right;
}
@media ( max-width : 991px) {
		.menub {
			width:85%;
			height : 50px;
		}
		.menub>ul {
			height :100%;
		}
		.menub>ul li:first-child {
			width : 0px;
			height : 100%;
		}
		.menub>ul li:nth-child(2){
			width : 20%;
			padding-left : 30px;
		}
		.menub li {
			width: 25%;
			padding-left : 20px;
		}
		.menub>ul>li .imgwrapper {
			display:none;
		}
		.main {
			width : 90%;
		}
		.btndelete {
			width:63%;
			text-align:right;
		}
		.addReply{
			width:7%;
			text-align:right;
		}
	}
	.menuSelect { 
		width: 200px; /* 원하는 너비설정 */ 
		padding: .4em .4em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.searchSelect { 
		width: 100px; /* 원하는 너비설정 */ 
		padding: .1em .1em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(/resources/assets/down_arrow.png) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		background-size : 10px 10px;
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none; 
	}
	.select-wrapper {
		width : 20%;
		text-align:right;
		float:left;
	}
	.table-wrap {
		margin-top : 20px;
		float:left;
		width : 45%;
		height : 450px;
		border-bottom : 1px solid lightgray;
		margin-bottom : 15px;
	}
	.searchText {
		width: 20%;
	}
	.content {
		height : 650px;
	}
	.btn{
	 	padding : 3px 3px;
	}
	.tableComment tbody {margin:5px;}
	.tableComment tbody tr {border : 1px solid lightgray;}
	.tableComment tr td, .mateComReplyTb tr td {
		float:left;
	}
	.tableComment>tr>td {
		border-top : 1px splid white;
	}
	.first {
		margin-right : 10px;
	}
	.third {
		text-align : right;
		width : 90%;
	}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<!-- end header -->

	<!-- content -->
	<div class="content">
		<form action="adminRequireUpdate.doa" method="post">
		<div class="main">
			<div class="main-name">
				<h2 class="main-name-h2">문의사항 수정하기</h2>
			</div>
			<div class="third">
				<input type="hidden" name="requireNo" value="${require.requireNo }">
				<c:url var="adminRequireList" value="adminRequireList.doa">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-primary"  onClick="location.href='${adminRequireList }'">목록으로</button>
			</div>
			<div class="table-wrap first">
				<table align="center" width="800" cellspacing="0"
					style="clear: right;" class="table table-hover table-responsive">
					<tr align="center" valign="middle">
						<!-- valign : 수직 가운데 -->
						<th colspan="2">${require.requireNo }번글 상세보기</th>
					</tr>
					<tr>
						<td height="15" width="70">제목</td>
						<td><input type="text" name="requireTitle" value="${require.requireTitle }"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${require.userId }</td>
					</tr>
					<tr height="100">
						<td>내용</td>
						<td><textarea cols="50" rows="15" name="requireContents">${require.requireContents }</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><c:if test="${!empty require.originalFilename }">
								<img
									src="/resources/requireUploadFiles/${require.userId}/${require.renameFilename}"
									width="250" height="200"><br>
									<a href="/resources/requireUploadFiles/${require.userId}/${require.renameFilename}" download>
									${require.renameFilename } </a>
							</c:if></td>
					</tr>
				</table>
			</div>
			<div class="table-wrap second">
			<table align="center" width="800" cellspacing="0"
					style="clear: right;" class="table table-hover table-responsive">
					<tr align="center" valign="middle">
						<th colspan="2"> 관리자 답변 </th>
					</tr>
					<tr>
						<td height="15" width="70">제목</td>
						<td>
							<c:if test="${!empty reply.rComTitle }">
						  		<input type="text" name="rComTitle" value="${reply.rComTitle }">
						  	</c:if>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${loginUser.userId }</td>
					</tr>
					<tr height="330">
						<td>내용</td>
						<c:if test="${!empty reply.rComContents }">
							<td><textarea cols="50" rows="15" name="rComContents">${reply.rComContents }</textarea></td>
						</c:if>
					</tr>
				</table>
			</div>
			
		</div>
		</form>
	</div>
	<script>
		
		function deleteRequire() {
			var answer = confirm("정말로 삭제하시겠습니까?");
			if (answer) {
				location.href = '${requireDelete}';
			}
			/* location.href='${requireUpdate}'; */
		}
	</script>
	<!-- end content -->

	<!-- footer -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>