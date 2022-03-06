<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="Pack.LoginManager"%>
<%!
    //싱글톤 패턴을 사용하였기 때문에 생생되어있는 인스턴스를 얻어온다.
    LoginManager loginManager = LoginManager.getInstance(); 
%>
<html>
<head>
<title>로그인 중복방지 Test</title>
</head>
<body>
	<%
    String userId = (String)session.getAttribute("userId");
    if(userId != null){
        //기존의 접속(세션)을 끊는다.
        loginManager.removeSession(userId);
        
        //새로운 세션을 등록한다. setSession함수를 수행하면 valueBound()함수가 호출된다.
        loginManager.setSession(session, userId);
        %>
        <script>
	            location.href = "index.jsp"
		
	</script>
		<%-- <jsp:forward page="index.jsp">
			<jsp:param value="<%=userId%>" name="userId"/>
		</jsp:forward> --%>
		<%	
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>