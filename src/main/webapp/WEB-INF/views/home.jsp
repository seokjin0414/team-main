<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>옥수수 차트</h1>
	<div>
		<iframe height="480" width="650"
			src="https://ssltvc.forexprostools.com/?pair_ID=8918&height=480&width=650&interval=300&plotStyle=candles&domain_ID=18&lang_ID=18&timezone_ID=26"></iframe>
	</div>

	<h1>변동성 차트</h1>
	<div>


		<iframe
			src="https://kr.widgets.investing.com/top-cryptocurrencies?theme=lightTheme&hideTitle=true&roundedCorners=true"
			width="100%" height="45%" frameborder="0" allowtransparency="true"
			marginwidth="0" marginheight="0"></iframe>
	</div>

	<h1>라이브크로스</h1>
	<div>
		<iframe
			src="https://kr.widgets.investing.com/live-currency-cross-rates?theme=darkTheme"
			width="100%" height="42%" frameborder="0" allowtransparency="true"
			marginwidth="0" marginheight="0"></iframe>
	</div>

	<h1>금리</h1>
	<div>
		<iframe frameborder="0" scrolling="no" height="10%" width="100%"
			allowtransparency="true" marginwidth="0" marginheight="0"
			src="https://sslirates.forexprostools.com/index.php?rows=2&bg1=FFFFFF&bg2=F1F5F8&text_color=333333&enable_border=show&border_color=0452A1&header_bg=0452A1&header_text=FFFFFF&force_lang=18"
			align="center"></iframe>


	</div>


	<h1>확인</h1>

	<div>
		<!-- TradingView Widget BEGIN -->
		<div class="tradingview-widget-container">
			<div id="tradingview_25f88"></div>
			<div class="tradingview-widget-copyright">
				<a href="https://www.tradingview.com/symbols/NASDAQ-AAPL/"
					rel="noopener" target="_blank"><span class="blue-text">AAPL
						Chart</span></a> by TradingView
			</div>
			<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
			<script type="text/javascript">
				new TradingView.widget({
					"autosize" : true,
					"symbol" : "NASDAQ:AAPL",
					"interval" : "D",
					"timezone" : "Etc/UTC",
					"theme" : "light",
					"style" : "1",
					"locale" : "en",
					"toolbar_bg" : "#f1f3f6",
					"enable_publishing" : false,
					"allow_symbol_change" : true,
					"container_id" : "tradingview_25f88"
				});
			</script>
		</div>
		<!-- TradingView Widget END -->
	</div>

	<h1>확인2</h1>
	<div>
		<!-- TradingView Widget BEGIN -->
		<div class="tradingview-widget-container">
			<div id="tradingview_8850a"></div>
			<div class="tradingview-widget-copyright">
				<a href="https://www.tradingview.com/symbols/CBOT-ZC2!/"
					rel="noopener" target="_blank"><span class="blue-text">ZC2!
						Chart</span></a> by TradingView
			</div>
			<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
			<script type="text/javascript">
				new TradingView.widget({
					"autosize" : true,
					"symbol" : "CBOT:ZC2!",
					"interval" : "1",
					"timezone" : "Etc/UTC",
					"theme" : "light",
					"style" : "1",
					"locale" : "en",
					"toolbar_bg" : "#f1f3f6",
					"enable_publishing" : false,
					"allow_symbol_change" : true,
					"container_id" : "tradingview_8850a"
				});
			</script>
		</div>
		<!-- TradingView Widget END -->
	</div>

</body>
</html>
