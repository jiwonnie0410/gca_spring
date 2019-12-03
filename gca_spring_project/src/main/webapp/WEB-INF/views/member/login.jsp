<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	
	<title> 로그인 페이지</title>
	
	<style>
		.btn {
			  border: 2px solid black;
			  background-color: white;
			  color: black;
			  padding: 14px 28px;
			  font-size: 10px;
			  cursor: pointer;
			  height: 20px;
			}
		.pink {
			  border-color: #FE9191;
			  color: #FE9191;
		}
			
		.pink:hover {
			  background-color: #FE9191;
			  color: white;
		}
		
		.button-general {
			  background: #FE9191;
			  border: 3px solid #fff;
			  border-radius: 7px;
			  color: #fff;
			  font-size: 15px;
			  font-weight: bold;
			  padding: 2px 4px;
			  position: relative;
			  text-transform: uppercase;
			  height: 50px;
			  width: 340px;
		}
		
		.button-title {
			  background: #fff;
			  border: 3px solid #FE9191;
			  border-radius: 7px;
			  color: #FE9191;
			  font-size: 15px;
			  font-weight: bold;
			  margin: 0.3em auto;
			  padding: 2px 4px;
			  position: relative;
			  text-transform: uppercase;
			  height: 40px;
			  width: 165px;
		}
		
		.button-naver {
			border-radius: 8px;
			background-image:url('./resources/images/naver_button.PNG');
			background-size: 165px 50px;
			padding: 2px 4px;
			height: 49px;
			width: 165px;
		}
		
	</style>
</head>
<body>
		<%
		    String clientId = "BJ76vTS9xilyC5p9YXrY";//애플리케이션 클라이언트 아이디값";
		    String redirectURI = URLEncoder.encode("http://localhost/gca/login/naverCallback", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
		 %>
	<div align="center">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default"><br />
					<div class="panel-heading text-center" style="padding-top:100px;">
						<h4><b> LOGIN </b></h4>
					</div>
				</div><br /><br />
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3"></div>

			<div class="col-md-6">
				<form role="form" id="loginfrm" name="loginfrm" action="basic_login.do" method="POST">
					<table>
						<tr>
							<th width="100"> ID </th>
							<td width="240"><input type="text" class="form-control" id="id" name="id" value="${param.id}" /></td>
						</tr>
						<tr>
							<th> Password </th>
							<td><input type="password" class="form-control" id="pw" name="pw" /></td>
						</tr>
					</table>
					<div style="height: 11px;">&nbsp;</div> <!-- 그냥 테이블이랑 버튼 사이 간격 조정을 위한 태그 -->
					<table>
						<tr>
							<td><div id="naverIdLogin"></div></td>
							<td width="170"><a href="<%=apiURL%>"><img height="50" src="./resources/images/naver_button.PNG"/></a></td>
							<td width="170"><button type="button" onclick="checkForm()" class="button-general" style="width:165px;"> LOGIN </button></td>
						</tr>
						<tr>
							<td colspan="2"><button type="button" onclick="location.href='#'" class="button-general" style="width:340px;"> JOIN </button></td>
						</tr>
						<tr>
							<td width="170"><button type="button" onclick="location.href='#'" class="button-title"> 아이디 찾기 </button></td>
							<td width="170"><button type="button" onclick="location.href='#'" class="button-title"> 비밀번호 찾기 </button></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>
	</div>
<!-- 네이버아디디로로그인 초기화 Script -->
		<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "BJ76vTS9xilyC5p9YXrY",
					callbackUrl: "http://localhost/gca/login/naverCallback",
					isPopup: true, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
				}
			);
			
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
			
		</script>
		<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>