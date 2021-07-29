<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

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
		<div>
		
		<h4> 계좌 연동?</h4>
		<h4> 입금 수수료 free</h4>
		<h4> 출금 수수료 1$</h4>
		<h4> buy & sell 수수료 0.1%</h4>
		<h4> min 입출금 금액 = 1$(1point)</h4>
		<h4> 기준 통화 ? 입금: 원/(USD/KRW) = x -> x point(1p = 1$) 출금: point * (USD/KRW) = y -> y 원? </h4>
		<h4> 출금수수료 1$ ,  -1 point</h4>
		<h4>서킷 구현 가능?</h4>
		<h4>거래량 노출??</h4>
		<h4>거래 종목 선정 난이도</h4> 
		<h4>코인(가장 간단하다))</h4>  
		<h4>나스닥(섬머타임 적용)</h4>  
		<h4>국내주식(상한&하한, 통화 변동x) 시간외거래 시가 종가 동시호가 구현?</h4>  
		<h4>선물(월물 구분? 자동 롤오버?,청산,마진콜,증거금 추가입금시 처리?) 당일 정산으로 해결?</h4>  
		<h4>옵션(월물 종류+ sell 매수&매도+ put 매수&매도 만료 ,-시점 포지션 유지 > 손실 청구 문제) 만료시점 각 거래자 정산 문제?</h4>  
		
		
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
<p>order price</p>
				<input value="">
			</form>
		</div>

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
