<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	/* background: linear-gradient(#ffffff, #9198e5); */
	height: 100vh;
	padding: 0;
}

h1 {
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: center;
	padding: 10px;
	border-spacing: 10px;
}

.tableTitle {
	font-size: 10px;
	font-weight: bold;
}

#idea_poll_table {
	width: 610px;
} /*전체 테이블 width 값 고정 // table에 td width는 colgroup으로 고정*/
#idea_poll_table th { /* table의 th - 투표의 답이 들어가는 부분 */
	height: 41px;
	text-align: left;
	margin: 0px;
	color: #333333;
	font-family: dotum, 돋움;
	font-size: 12px;
}

#idea_poll_table td {
	/* td의 텍스트 element 지정 // 그래프가 들어가는 부분에는 텍스트가 없으므로 전체 td로 정해버렸음 */
	color: #757575;
	font-family: dotum, 돋움;
	font-size: 12px;
}

/* 요기부터 그래프 관련 */
#idea_poll_table .graph_yl {
	width: 245px; /* padding으로 전체 1px 밀었으므로 가로사이즈 왼쪽, 오른쪽 각각 1px 씩 뺀 사이즈 */
	height: 7px; /* padding으로 전체 1px 밀었으므로 세로 사이즈 위, 아래 각각 1px 씩 뺀 사이즈 */
	background-image: url(../../nsquare/image/idea_poll_graph_yl_off.gif);
	/* 그래프의 테두리만 남기고 투명 Gif 로 저장 */
	background-repeat: no-repeat; /* 테두리가 반복되면 안되므로 배경 고정 */
	background-position: left; /* 테두리의 위치는 항상 왼쪽에 위치 */
	background-color: #FFAE22; /* 속을 파낸 그래프 테두리안에 off 컬러 지정 */
	margin: 0px;
	/* IE6 과 IE7의 padding 인식 차이를 맞추기 위한 margin 지정 // 이미 body에 지정되어 있으나 다시 지정 */
	padding: 1px; /* 그래프의 테두리 안쪽으로 on 이미지가 늘어나야 하므로 전체 1px padding */
	text-align: left; /* 그래프의 시작은 항상 왼쪽부터 */
}

#idea_poll_table .bold_yl {
	color: #D68A06;
} /* 우측의 투표인원수의 컬러값 지정 */
#idea_poll_table .poll_line { /* 각 그래프 사이의 점선 라인 */
	height: 1px;
	width: 610px;
	background-image:
		url(../../nsquare/image/idea_online_poll_table_line.gif);
	background-repeat: repeat-x;
}
</style>
</head>
<body>
	<label>
		<h1>결과보기</h1>
	</label>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://13.209.35.25:3307/db01?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
	con = DriverManager.getConnection(url, "lion", "1234");

	String sql = "select r.res_nm, count(v.res) as count, count(v.res)/count(v.id) as rate from voted v"
			+ " join result r on r.id = v.res" + " group by v.res";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();

	/* String sql2 = "select count(*) as total from voted";
	pstmt2 = con.prepareStatement(sql2);
	rs2 = pstmt2.executeQuery(); */
	%>
	<div>
		<label>
			<table>
				<thead>
					<tr class="tableTitle">
						<td>가게명</td>
						<td>득표수</td>
						<!-- <td>득표율</td> -->
					</tr>
				</thead>
				<tbody class="tableBody">
					<%
					while (rs.next()) {
						String res_nm = rs.getString("r.res_nm");
						String count = rs.getString("count");
						out.println("<tr>");
						out.println("<td><h3>" + res_nm + "</h3></td>");
						out.println("<td><h3>" + count + "</h3></td>");
						out.println("</tr>");
					}
					%>
				</tbody>
			</table> <!--  -->
			<table cellpadding="0" cellspacing="0" border="0"
				id="idea_poll_table">
				<colgroup>
					<col width="148px;">
					<col width="276px" align="left">
					<col width="184px" align="left">
					<!--  -->
					<%
					while (rs.next()) {
						String res_nm = rs.getString("r.res_nm");
						String count = rs.getString("count");
					%>
					<tr>
					<th><img src="image/idea_online_poll_tip.gif" width="8"
						height="9" border="0" alt="" align="absmiddle"> res_nm
					</td>
					<td>
						<div class="graph_yl">
							<img src="image/idea_poll_graph_yl_on.gif" width="80%" height="7"
								border="0" align="absmiddle" alt="">
						</div>
					</td>
					<td><b class="bold_yl">982</b> 명 (50%)</td>
				</tr>
				<tr>
					<td colspan="3" class="poll_line"></td>
				</tr>
					<%
					}
					%>
				
				
			</table> <!--  -->
		</label>
	</div>
</body>
</html>