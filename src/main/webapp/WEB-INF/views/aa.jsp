<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
<br>
<br>
<br>
<h3>주문 내역</h3>
<table class="table table-borderless table-striped">
		<thead>
			<tr>
				<th scope="col">BUY_ID</th>
				<th scope="col">종목명</th>
				<th scope="col">주문계좌</th>
				<th scope="col">주문금액</th>
				<th scope="col">주문량</th>
				<th scope="col">채결량</th>
				<th scope="col">잔여량</th>
				<th scope="col">주문일자</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>1251</td>
					<td>Bitcoin</td>
					<td>20491036082207</td>
					<td>48749.34</td>
					<td>28</td>
					<td>11</td>
					<td>7</td>
					<td>2021-08-30 06:01:57</td>
					<td>처리중</td>
				</tr>
				<tr>
					<td>1247</td>
					<td>Bitcoin</td>
					<td>20491036082207</td>
					<td>48760.11</td>
					<td>2</td>
					<td>1</td>
					<td>1</td>
					<td>2021-08-30 05:27:19</td>
					<td>주문취소</td>
				</tr>
				<tr>
					<td>1234</td>
					<td>Bitcoin</td>
					<td>20491036082207</td>
					<td>48755.02</td>
					<td>5</td>
					<td>5</td>
					<td>0</td>
					<td>2021-08-30 01:12:35</td>
					<td>완료</td>
				</tr>
		</tbody>
	</table>


</div>
</body>
</html>