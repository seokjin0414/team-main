<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<script>
$(document).ready(function() {
	$(".valuesAdditionalWrapper-2KhwsEwE:nth-child(5)").attr()
	
});

</script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">

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


	</div>
</body>
</html>