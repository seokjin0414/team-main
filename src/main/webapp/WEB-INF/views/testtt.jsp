<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<style>
#body {
	background-color: #e9ecef;
}
</style>

<script>
	$(document).ready(function() {
		$(".valuesAdditionalWrapper-2KhwsEwE:nth-child(5)").attr()

	});
</script>

<title>Insert title here</title>
</head>
<body id="body">
	<div class="container">
	<div class="row row-col-md-4">
	<div class="col">
		<!-- TradingView Widget BEGIN -->
		<div class="tradingview-widget-container">
			<div id="tradingview_6b067"></div>
			<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
			<script type="text/javascript">
				new TradingView.widget({
					"width" : 700,
					"height" : 500,
					"symbol" : "BINANCE:BTCUSDT",
					"interval" : "1",
					"timezone" : "Asia/Tokyo",
					"theme" : "light",
					"style" : "1",
					"locale" : "kr",
					"toolbar_bg" : "#f1f3f6",
					"enable_publishing" : false,
					"allow_symbol_change" : true,
					"container_id" : "tradingview_6b067"
				});
			</script>
		</div>
		<!-- TradingView Widget END -->
		</div>
		
		<div class="col-lg-3">
	
		<br>
		<br>
		<br>
	<input type="text" name="idA" class="btn btn-success btn-lg" readonly value="현재가" id="input3">
	<div class="input-group" id="i31">
	<input type="text" name="idA" class="form-control" value="48757.43" id="input3">
	<div class="input-group-append">
    <span class="input-group-text" id="basic-addon3">USD$</span>
    </div>
    </div>
		<br>
		<form action="">
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
				<label class="btn btn-outline-success active btn-lg">
				<input type="radio" name="options" id="option1" checked> Buy
				</label>
				<label class="btn btn-outline-success btn-lg">
				<input type="radio" name="options" id="option2"> Sell
				</label>
			</div>
			<br>
	<div class="input-group" id="i1">
	<input type="text" name="idA" class="form-control" placeholder="주문 금액" id="input1">
	<div class="input-group-append">
    <span class="input-group-text" id="basic-addon2">SUSD$</span>
    </div>
 	</div>
    <div class="input-group" id="i2">
    <input type="text" id="custom-selectDirect" class="form-control" name="idC" placeholder="주문량">
    <div class="input-group-append">
    <span class="input-group-text" id="basic-addon3">개</span>
    <button class="btn btn-outline-success" id="but2" type="button">주문하기</button>
	</div>
	</div>	
		</form>
	    </div>
</div>
	</div>
</body>
</html>