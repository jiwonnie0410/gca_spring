<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>challenge.jsp</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>

<!-- jquery js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- json-serializeObject js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
	

<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">


<style>

.container {
	max-width: 500px;
}

.image-div {
	position : relative;
}

.sports-div img {
	border-radius: 10px;
}


.join-mark {
	position: absolute;
    top: 5%;
    right: 5%;
}

.join-tag {
    position: absolute;
	border: none;
    width: 60px;
    border-radius: 10px;
    font-weight: 700;
    background: #5ab7a5;
    text-align: center;
    color: white;
    font-size: medium;
    right: 13%;
}


</style>
</head>
  
  <body>

    <div class="container">
    <span class="title">챌린지 목록</span>
      <div class="row">
        <div class="col">
        	<!-- 상단 nav-tabs 시작 -->
            <ul class="nav nav-fills">
              <!-- 기본 챌린지 탭-->
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#basicChallenges">기본 챌린지<br><span>Basic Challenges</span></a>
              </li>
              <!-- 스페셜 챌린지 탭-->
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#specialChallenges">스페셜 챌린지<br><span>Special Challenges</span></a>
              </li>
            </ul>
            <!-- 상단 nav-tabs 끝 -->
            
            <div class="tab-content">
              <!-- 기본 챌린지 내용 div 시작 -->
              <div class="tab-pane fade show active" id="basicChallenges">
              	<c:forEach items="${challengeList}" var="list">
	              	<c:if test="${list.cl_status == 'basic' }"> 
	              	<div class="content-div" onclick="location.href='contents?num=${list.cl_num}'">
	              		<div class="image-div">
	              			<div class="sports-div">
			              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              			</div>
	              			<!-- 유저가 참가중인 챌린지는 참여중 마크 띄움 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
		              			<div class="join-mark">
									<img src="${pageContext.request.contextPath }/resources/images/icon/join.png">
		              			</div>
	              			</c:if>         
							</c:forEach>
							<!-- 유저 참가중 마크 끝 -->
	              		</div>
	              		<span class="pinkText"><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />(D-${list.gap_day })</span>
						<span class="mediumText">${list.cl_name }</span>
						<span class="mediumText">기간내 | ${list.cl_cnt }회 성공</span>
						<span class="pinkText">
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점 
							<!-- 참가중일시 참가중 태그 시작 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
									<input class="join-tag" value="참가중">
	              			</c:if>         
							</c:forEach>
							<!-- 참가중 태그 끝 -->
						</span>
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              <!-- 기본 챌린지 내용 div 끝 -->    
              
              <!-- 스페셜 챌린지 내용 div 시작 -->
               <div class="tab-pane fade" id="specialChallenges">
              	<c:forEach items="${challengeList}" var="list">
              		<c:if test="${list.cl_status != 'basic' }"> 
	              	<div class="content-div" onclick="location.href='contents?num=${list.cl_num}'">
	                	<div class="image-div">
	              			<div class="sports-div">
			              		<img src="${pageContext.request.contextPath }/resources/images/sports/${list.sports1_cd }.jpg" width="100%" height="200px">
	              			</div>
	              			<!-- 유저가 참가중인 챌린지는 참여중 마크 띄움 -->
	              			<c:forEach items="${myHistory}" var ="myList">
	              			<c:if test="${list.cl_num == myList.cl_num }">
		              			<div class="join-mark">
									<img src="${pageContext.request.contextPath }/resources/images/icon/join.png">
		              			</div>
	              			</c:if>         
							</c:forEach>
							<!-- 유저 참가중 마크 끝 -->
	              		</div>

	              		<span class="pinkText"><fmt:formatDate value="${list.cl_start_dttm }" type="date" /> ~
						<fmt:formatDate value="${list.cl_end_dttm }" type="date" />(D-${list.gap_day })</span>
						<span class="mediumText">${list.cl_name }</span>
						<span class="mediumText">기간내 | ${list.cl_cnt }회 성공</span>
						<span class="pinkText">
							<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
							1천원~5천원
						</span>
						<span class ="pinkText"> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${list.cl_score }점 
								<!-- 참가중일시 참가중 태그 시작 -->
		              			<c:forEach items="${myHistory}" var ="myList">
		              			<c:if test="${list.cl_num == myList.cl_num }">
										<input class="join-tag" value="참가중">
		              			</c:if>         
								</c:forEach>
								<!-- 참가중 태그 끝 -->  
						</span>
	              	</div>
	              	</c:if>
              	</c:forEach>
              </div>
              <!-- 스페셜 챌린지 내용 div 끝 -->
            </div>
        </div>
      </div>
    </div>
  	
  </body>
</html>