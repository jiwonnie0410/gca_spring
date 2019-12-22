<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- 꼭있어야함 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!--json할때 필요  -->
<script
	src="${pageContext.request.contextPath }/resources/js/json.min.js"></script>
	
<!-- 미현 : 다음 주소 입력 및 xy좌표 입력 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e415eb9e7187154cd9c6308c036f0a6&libraries=services,clusterer"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/mihy/kakao_map.js"></script>
<script>
 // 확인 메시지 띄우기
 if('${pwMessage}' != ''){
	alert('${pwMessage}');
}  

//수정확인
$(document).ready(function() {
	$("#btnUpdate").click(function() {
		// 확인 대화상자    
		if (confirm("수정하시겠습니까?")) {
			document.form1.action = "${pageContext.request.contextPath}/member/update";
			document.form1.submit();
		}
	});
	
	/* $(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
	}); */

	
	
	//미현 주소 클릭 시 다음주소 및 xy좌표 입력
	$("#mAddress1").on("click", mAddress_find);
	console.log(xy);
	
});


</script>
<sec:authentication property="principal.m_image_cd" var="image"/>
<title>회원정보 상세 페이지</title>
		
</head>
<body>

  <div >
        <div class="col-50">
          <div class="card">
            <div class="card-header" style="background-color: #FEBABA;">
              my menu
            </div>
            <div class="card-body">
					<form name="form1" method="post">
						<table>
							<%-- <tr>
								<td><img  style="padding-bottom:5px;" width="65px" height="65px"src="${pageContext.request.contextPath }/resources/images/Characters/${dto.m_image_cd}.gif"></td>				
							</tr> --%>
							<tr>
								<td><label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">아이디</label>&nbsp;&nbsp;</td>
								<!-- id는 수정이 불가능하도록 readonly속성 추가 -->
								<td><input name="m_id" value="${dto.m_id}"readonly="readonly" style="border: none" ></td>
							</tr>
							<tr>
								<td><label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">이름</label>&nbsp;&nbsp;</td>
								<td><input name=m_name value="${dto.m_name}" style="border: none" readonly="readonly"></td>
							</tr> 
							 <tr>
								<td><label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">닉네임</label>&nbsp;&nbsp;</td>
								<td><input name=m_nick value="${dto.m_nick}"></td>
							</tr> 
							
							
							<!-- 미현 : 주소 및 주소찾기 버튼 -->
							<tr>
								<td><label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">주소</label>&nbsp;&nbsp;</td>
								<td><input type="text" id="address" value="${dto.m_location}" name="m_location" style="border: none" />
									<input type="hidden" id="xy" name="m_xy">
								</td>
							</tr>
							<tr>
								<th>  </th>
								<td align="left">
									<input type="button" id="mAddress1" class="button-title" style="height: 30px; background-color: #FE9191; color: white;" value="주소 찾기">
								</td>
							</tr>
							
							<tr>
								<td><label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">이메일 주소</label>&nbsp;&nbsp;</td>
								<td> <input width="90" name="m_email" value="${dto.m_email}"> </td>
							</tr>

							<tr>
					
							<tr>
								<td colspan="2" align="center"></td>
							</tr>
						</table>
						<!-- <div align="center">
							<h2>Choose Your Option</h2>
						</div> -->
						<br>
						<div class="info-user2">
							<div style="color: red;">${message}</div>
							<!--이모티콘이로 대체  -->
							<button type="submit" id="btnUpdate" name="btnUpdate" style="background-color: #FE9191; color: white;">확인</button>
						</div>
					</form>
							 <form action="../logout" method="post">
							  <button style="background-color: #FE9191; color: white;">로그아웃</button>
							</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
