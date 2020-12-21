<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 상세보기</title>
<style>
	table{
		border-collapse:collapse
	}
	td{
		border-bottom:1px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<jsp:include page="../common/leftMenuBar.jsp"></jsp:include>
	<div align="center" >
	
		<h1 align="center" >게시글 상세보기</h1>
		<br>
		${diary.publicCode }
			<c:if test="${ diary.publicCode eq 'N' || empty diary.publicCode }">
				<h3 align="center">
					<button onclick="location.href='diaryPublic.doa?publicCode=Y&diaryNo=${diary.diaryNo}'">공개</button>
				</h3>
			</c:if> 
			<c:if test="${ diary.publicCode eq 'Y'}">
				<h3 align="center">
					<button onclick="location.href='diaryPublic.doa?publicCode=N&diaryNo=${diary.diaryNo}'">비공개</button>
				</h3>
			</c:if> 	
	</div>
	<table align="center" cellpadding="10" cellspacing="0"  width="500" >
	
		<tr>
			<td height="15" width="70">제목</td>
			<td>${diary.diaryTitle }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${diary.diaryContents }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${!empty diary.originalFileName }">
					<a href="/resources/diaryUploadFiles/${diary.renameFileName }" download>
						${diary.originalFileName }
					</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<c:url var="dDelete" value="diaryDelete.doa">
				<c:param name="diaryNo" value="${diary.diaryNo }"></c:param>
			</c:url>
			<c:url var="dList" value="diaryList.doa">
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
			<c:url var="dUpdate" value="diaryUpdateView.doa">
				<c:param name="diaryNo" value="${diary.diaryNo}"></c:param>
				<c:param name="page" value="${currentPage }"></c:param>
			</c:url>
				<a href="${dUpdate }">수정하기</a>
				<a href="${dDelete }">삭제하기</a>
				<a href="${dList }">목록으로</a>
			</td>
		</tr>
		<!-- 댓글등록 -->
		<table align="center" width="500" border="1" cellspacing="0" >
			<tr>
				<td><textarea row="3" cols="55" id="rContent"></textarea>
				<td>
					<button id="rSubmit">등록하기</button>
				</td>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" border="1" cellspacing="0" id="rtb">
			<thead>
				<tr>
					<td colspan="2"><b id="rCount"></b>
				</tr>
			</thead>
			<tbody>
				<tr>
				
				</tr>
				
			</tbody>
		</table>
		
		<script>
			$(function(){
				getReplyList();
				// ajax polling
				// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글불러오기
				setInterval(function(){
					consol.log("동작중");
					getReplyList();
				}, 5000);
				
				$("#rSubmit").on("click", function(){
					
					
					//댓글 등록 ajax
					var rContent = $("#rContent").val();
					var refBid = ${diary.diaryNo};
					
					$.ajax({
						url : "addReply.doa",
						type : "post",
						data : {"rContent" : rContent, "refBid":refBid},
						success : function(data){
							if(data == "success"){
								getReplyList();// 댓글 리스트 새로고침 안하게 하는것?
								$("#rContent").val("");
							}else{
								alert("댓글 등록 실패..");
							}
						}
					});
				});
			});
			// 댓글 리스트를 불러오는 ajax Function
			function getReplyList(){
				var diaryNo = ${diary.diaryNo};
				$.ajax({
					url : "replyList.doa",
					type : "get",
					data : {"diaryNo":diaryNo},
					dataType:"json",
					success : function(data){
						// db에 있는 데이터를 json형태로 가져와서
						// 댓글 목록 테이블의 tbody에 넣어주어야 함.
						var $tableBody= $("#rtb tbody");
						$tableBody.html(""); // tbody에 존재하는 값을 초기화
						
						var $tr;
						var $rWriter;
						var $rContent;
						var $rCreateDate;
						
						$("#rCount").text("댓글 (" + data.length + ")"); //댓글의 갯수 표시
						if (data.length>0){
							for (var i in data){
								$tr = $("<tr>");
								$rWriter = $("<td width='100'>").text(data[i].rWriter);
								$rContent = $("<td>").text(decodeURIComponent(data[i].rContent).replace(/\+/g, " "));
								$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
								
								$tr.append($rWriter); //<tr><td width='100'>admin</td></tr>
								$tr.append($rContent); // <tr><td width='100'>admin</td><td>내용</td></tr>
								$tr.append($rCreateDate); // <tr><td width='100'>admin</td><td>내용</td><td>2018-10-30</td></tr>
								$tableBody.append($tr); // <tbody><tr><td width='100'>admin</td><td>내용</td><td>2018-10-30</td></tr></tbody>
								
							}
						}else{
							console.log("데이터없음");
							//tr 태그가 자동으로 생성되고 자동으로 닫힘
							$tr= $("<tr>");
							$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
							//<td colspan='3'> no reply</td>
							$tr.append($rContent); // <tr><td colspan='3'>no reply</td></tr>
							$tableBody.append($tr);
						}
					}
				})
			}
		</script>
	</table>

</body>
</html>