<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Menu</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<script src="/js/jquery.js" language="javascript"></script>
<style tyle="text/css">
body {
	margin: 0px;
}

.menuHead{
	line-height: 30px;
	font-size: 14px;
	text-align: center;	
	background-color: #507BAE;	
	font-weight: bold;
	color:white;
	border-bottom:2px #aaaaaa solid;
}

.menuItem{
	padding-left:10px;
	line-height: 30px;
	font-size: 12px;
	text-align: left;
	border-bottom:1px #507BAE solid;
	color:#507BAE;
	cursor:pointer;
}

.subItem{
	padding-left:20px;
	line-height: 25px;
	font-size: 12px;
	text-align: left;
	background-color: #fff;	
	cursor:pointer;
	background:url(./image/arrow-right.png) no-repeat 8px 8px
}
.subItem2{
	padding-left:40px;
	line-height: 25px;
	font-size: 12px;
	text-align: left;
	background-color: #fff;	
}

.menuHead a{color: #fff;}
.menuHead a:hover{text-decoration: none;}
	
</style>
<script language="javascript">
	$(document).ready(function(){
		$(".sty1").hide();	
		$(".subItem2").hide();
		$(".menuItem").click(
			function(){
				var men = $("#"+this.id+"1");
				if(men.is(':visible')){
					$("#"+this.id+"1").slideUp("fast");
				}else{
					$(".subItem").css("background","url(./image/arrow-right.png) no-repeat 8px 8px");
				    $(".sty1").slideUp("slow");
				    $(".subItem2").slideUp("slow");
				    $("#"+this.id+"1").slideDown("fast");
				}
			}
		);
		
		$(".subItem").click(
			function(){
				var men = $("#"+this.id+"1");
				if(men.is(':visible')){
					$(this).css("background","url(./image/arrow-right.png) no-repeat 8px 8px");
					$("div[name="+this.id+"1]").slideUp("fast");
				}else{
					$(this).css("background","url(./image/arrow-down.png) no-repeat 8px 8px");
				//	$(".subItem").slideDown("slow");
					$("div[name="+this.id+"1]").slideDown("fast");
				}
			}
		);
	});
</script>
</head>
<body>
<div class="menuHead">�˵�</div>
<#if param?index_of("100",0)&gt;-1>
<#assign allper = false>
<div style="background-color: #f5f5f5;">	
	<#if param?index_of("1009",0)&gt;-1 >	
	<#assign allper = true>
		<div class="menuItem"  id="per">ϵͳ����</div>
		<div id="per1" class="sty1">		
			<div id="per11" class="subItem">Ȩ�޹���</div>	
				<div name="per111" id="per111" class="subItem2">��<a href="/admin/role/roleList.action" target="contentFrame">��̨Ȩ�޹���</a></div>
				<div name="per111" id="per111" class="subItem2">��<a href="/admin/loadParameter.action" target="contentFrame">���ز���</a></div>
		</div>
	</#if>		
	
	<#if param?index_of("y",0)&gt;-1 || allper>
	<div class="menuItem"  id="y">�������ģ��</div>
	<div id="y1" class="sty1">	
		 	<div id="y11" class="subItem">��������ͳ��</div>
		 		<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/financing.jsp" target="contentFrame">�������ݲ�ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="http://fb.youjoy.com/manage/viewAllAmount.php" target="contentFrame">ÿ������¼��</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getAmount.jsp" target="contentFrame">����ͳ��</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getJsr.jsp" target="contentFrame">ÿ�վ������ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getYsk.jsp" target="contentFrame">ÿ��Ӧ�տ��ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getYfk.jsp" target="contentFrame">ÿ��Ӧ�����ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getJsrByM.jsp" target="contentFrame">�������²�ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getYskByM.jsp" target="contentFrame">Ӧ�տ��²�ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="/admin/financing/getYfkByM.jsp" target="contentFrame">Ӧ�����²�ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="http://fb.youjoy.com/manage/getYskSE.php" target="contentFrame">Ӧ�տ��ڳ�/ĩ����ѯ</a></div>
				<div name="y111" id="y111" class="subItem2">��<a href="http://fb.youjoy.com/manage/getYfkSE.php" target="contentFrame">Ӧ�����ڳ�/ĩ����ѯ</a></div>
	</div>
	</#if>
	
	<#if param?index_of("a",0)&gt;-1 >	
		<div class="menuItem"  id="a">��Ϸ����(����)</div>
		<div id="a1" class="sty1">
			<div id="a11" class="subItem">��Ϸ����</div>	
				<div name="a111" id="a111" class="subItem2">��<a href="/admin/game/gameList.action" target="contentFrame">����������</a></div>
				<div name="a111" id="a111" class="subItem2">��<a href="/admin/game/manage.jsp" target="contentFrame">����ƽ̨��</a></div>
			<div id="a12" class="subItem">�û���½</div>		
				<div name="a121" id="a121" class="subItem2">��<a href="/admin/iprestrict/setip.action" target="contentFrame">IP����</a></div>	
			<div id="a13" class="subItem">��������</div>	
				<div name="a131" id="a131" class="subItem2">��<a href="/admin/game/grantGoldleaf.action" target="contentFrame">���Ž�Ҷ��</a></div>
				<div name="a131" id="a131" class="subItem2">��<a href="/admin/game/prestigeSearch.action" target="contentFrame">����ʹ����</a></div>
		</div>
	</#if>

	<#if param?index_of("b",0)&gt;-1 || allper>	
	<div class="menuItem"  id="b">��ֵ����(����)</div>
	<div id="b1" class="sty1">	
		<div id="b11" class="subItem">���У�����ƽ̨��</div>
			<div name="b111" id="b111" class="subItem2">��<a href="/admin/pay/searchAll.action" target="contentFrame">��ֵ��ѯ</a></div>
			<div name="b111" id="b111" class="subItem2">��<a href="/admin/game/gameMoney.action" target="contentFrame">��ֵ��������</a></div>
			<div name="b111" id="b111" class="subItem2">��<a href="/admin/pay/gotoKKong.action" target="contentFrame">���ų�ֵ��ѯ</a></div>
			<div name="b111" id="b111" class="subItem2">��<a href="/admin/pay/queryAgent.jsp" target="contentFrame">�����̳�ֵ����</a></div>
		<div id="b12" class="subItem">���У�������Ϸ��</div>
			<div name="b121" id="b121"  class="subItem2">��<a href="/admin/pay/dailypay.action" target="contentFrame">������Ϸ����</a></div>
			<div name="b121" id="b121" class="subItem2">��<a href="/admin/business/gameDataDailyResult.action" target="contentFrame">ÿ����Ϸ���ݻ���</a></div>
			<div name="b121" id="b121" class="subItem2">��<a href="/admin/game/gameCoin.action" target="contentFrame">������Ӫ����</a></div>
			<div name="b121" id="b121" class="subItem2">��<a href="/admin/pay/goDateRechange.action" target="contentFrame">�һ���ѯ</a></div>
	</div>
	</#if>	
		
	<#if param?index_of("c",0)&gt;-1 || allper>
	<div class="menuItem"  id="c">�����Ϣ(����)</div>
	<div id="c1" class="sty1">	
		<div id="c11" class="subItem">��Ҹ�����Ϣ</div>
			<div name="c111" id="c111" class="subItem2">��<a href="/admin/user/userInfo.jsp" target="contentFrame">���ƽ̨��Ϣ</a></div>
			<div name="c111" id="c111" class="subItem2">��<a href="/admin/user/userGameInfo.jsp" target="contentFrame">�����Ϸ��Ϣ</a></div>
			<div name="c111" id="c111" class="subItem2">��<a href="/admin/pay/payChange.jsp" target="contentFrame">��ֵ�һ���ˮ</a></div>
			<div name="c111" id="c111" class="subItem2">��<a href="/admin/game/rpChange.jsp" target="contentFrame">������������</a></div>
		<div id="c12" class="subItem">�������ͳ��</div>
			<div name="c121" id="c121" class="subItem2">��<a href="/admin/pay/searchUUcoin.action" target="contentFrame">���ʣ��UCoins</a></div>
			<div name="c121" id="c121" class="subItem2">��<a href="/admin/pay/queryRankingRechangeRank.action" target="contentFrame">��ҳ�ֵ����</a></div>
			<div name="c121" id="c121" class="subItem2">��<a href="/admin/user/exportUserMail.jsp" target="contentFrame">�����û�����</a></div>			
	</div>
	</#if>
	
	<#if param?index_of("d",0)&gt;-1 || allper>
	<div class="menuItem"  id="d">�г����(����)</div>
	<div id="d1" class="sty1">
		<div id="d11" class="subItem">�������</div>
			<div name="d111" id="d111" class="subItem2">��<a href="/admin/ad/fromList.action" target="contentFrame">�����������</a></div>

		<div id="d12" class="subItem">���������ֵ</div>
			<div name="d121" id="d121" class="subItem2">��<a href="/admin/business/report/searchGameMoney.jsp" target="contentFrame">ע��/��ֵ���</a></div>
			<div name="d121" id="d121" class="subItem2">��<a href="/admin/business/report/searchGameMoneyByTime.jsp" target="contentFrame">ע��/��ֵͳ��</a></div>
			<div name="d121" id="d121" class="subItem2">��<a href="/admin/business/report/searchGameMoneyTotal.jsp" target="contentFrame">ע��/��ֵ����</a></div>
			<div name="d121" id="d121" class="subItem2">��<a href="/admin/business/report/searchCoin.jsp" target="contentFrame">ע��/�һ�ͳ��</a></div>
			<div name="d121" id="d121" class="subItem2">��<a href="/admin/business/report/searchCoinTotal.jsp" target="contentFrame">ע��/�һ�����</a></div>

		<div id="d13" class="subItem">���ͳ��</div>
			<div name="d131" id="d131" class="subItem2">��<a href="/admin/business/report/searchCountry.jsp" target="contentFrame">�г�����ͳ��</a></div>
			<div name="d131" id="d131" class="subItem2">��<a href="/admin/business/report/adReport.jsp" target="contentFrame">�û���Ϣ�����������</a></div>
	</div>
	</#if>
	
	<#if param?index_of("e",0)&gt;-1 || allper>
	<div class="menuItem"  id="e">��Ӫ����(����)</div>
	<div id="e1" class="sty1">	
		 	<div id="e11" class="subItem">Ͷ��</div>
		 		<div name="e111" id="e111" class="subItem2">��<a href="/admin/complain/complainList.action?p=all" target="contentFrame">Ͷ���б�</a></div>

			<div id="e12" class="subItem">���Ź���</div>
				<div name="e121" id="e121" class="subItem2">��<a href="/admin/news/add.action" target="contentFrame">�������</a></div>
				<div name="e121" id="e121" class="subItem2">��<a href="/admin/news/search.action" target="contentFrame">�����б�</a></div>
				<div name="e121" id="e121" class="subItem2">��<a href="/admin/news/makePage.jsp" target="contentFrame">����ҳ��</a></div>

			<div id="e13" class="subItem">�ʼ�</div>
				<div name="e131" id="e131" class="subItem2">��<a href="/admin/mail/sendMail.jsp" target="contentFrame">�ʼ�����</a></div>
			<div id="e14" class="subItem">���߿ͷ�</div>
			     <div name="e141" id="e141" class="subItem2">��<a href="/admin/mail/onlineChat.jsp" target="contentFrame">���߿ͷ�����</a></div>
			<div id="e15" class="subItem">OQ��������ѯ</div>
			     <div name="e151" id="e151" class="subItem2">��<a href="/admin/oq/share.jsp" target="contentFrame">OQ��������ѯ</a></div>
			<div id="e16" class="subItem">��Ӱ</div>
			     <div name="e161" id="e161" class="subItem2">��<a href="http://fb.youjoy.com/manage/viewEmail.php" target="contentFrame">��Ӱ</a></div>
	</div>
	</#if>
	
	<#if param?index_of("g",0)&gt;-1 || allper>
	<div class="menuItem"  id="g">��Ӫ����(�й�)</div>
	<div id="g1" class="sty1">
			<div id="g11" class="subItem">���Ź���</div>
				<div name="g111" id="g111" class="subItem2">��<a href="http://cn.youjoy.com/admin/news/add.action" target="contentFrame">�������</a></div>
				<div name="g111" id="g111" class="subItem2">��<a href="http://cn.youjoy.com/admin/news/search.action" target="contentFrame">�����б�</a></div>
				<div name="g111" id="g111" class="subItem2">��<a href="http://cn.youjoy.com/admin/news/makePage.jsp" target="contentFrame">����ҳ��</a></div>
	</div>
	</#if>
	
	<#if param?index_of("i",0)&gt;-1 || allper>
	<div class="menuItem"  id="i">��Ӫ����(̨��)</div>
	<div id="i1" class="sty1">
			<div id="i11" class="subItem">���Ź���</div>
				<div name="i111" id="i111" class="subItem2">��<a href="http://tw.youjoy.com/admin/news/add.action" target="contentFrame">�������</a></div>
				<div name="i111" id="i111" class="subItem2">��<a href="http://tw.youjoy.com/admin/news/search.action" target="contentFrame">�����б�</a></div>
				<div name="i111" id="i111" class="subItem2">��<a href="http://tw.youjoy.com/admin/news/makePage.jsp" target="contentFrame">����ҳ��</a></div>
	</div>
	</#if>
	
	<#if param?index_of("f",0)&gt;-1 || allper>
	<div class="menuItem"  id="f">��֮��Ϯ����Ӫ����</div>
	<div id="f1" class="sty1">	
		 	<div id="f11" class="subItem">��Ӫ������أ�����汾��</div>
		 		<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/operatorsAll.jsp" target="contentFrame">��Ӫ���ݲ�ѯ</a></div>
		 		<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/gemSearch.jsp" target="contentFrame">��ʯ���Ĳ�ѯ</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/getRecharge.jsp" target="contentFrame">��ֵ�û���ѯ</a></div>
		 		<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/sumary2.jsp" target="contentFrame">��Ӫ������ز�ѯ</a></div>
		 		<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/sumary.jsp" target="contentFrame">��Ϸ������ز�ѯ</a></div>
		 		<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/mobileSum.jsp" target="contentFrame">��Ӫ��������</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/consume.jsp" target="contentFrame">����ͳ��(�����ѯ)</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/consume2.jsp" target="contentFrame">����ͳ��(��Сʱ��ѯ)</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/userlevel.jsp" target="contentFrame">�û��ȼ��ֲ�</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/7daysleft.jsp" target="contentFrame">7�������ѯ</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/userspat.jsp" target="contentFrame">�û�����ֲ�</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="http://lznxquery.tw.youjoy.com/lznxRank/huodong/showEvents" target="contentFrame">����ӵ������ѯ</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="http://lznxquery.tw.youjoy.com/lznxRank/query/showRankData" target="contentFrame">���а������޸�</a></div>
				<div name="f111" id="f111" class="subItem2">��<a href="/admin/mobile/operators/chargeInfo.jsp" target="contentFrame">�����û������ϸ</a></div>
				
				<div name="f111" id="f111" class="subItem2">��<a href="http://lznxquery.tw.youjoy.com/lznxRank/rewardQuery.html" target="contentFrame">������Ų�ѯ����</a></div>
				

				
				
            <div id="f12" class="subItem">��Ӫ������أ�����汾��</div>
		 		<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/operatorsAll.jsp" target="contentFrame">��Ӫ���ݲ�ѯ</a></div>
		 		<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/gemSearch.jsp" target="contentFrame">��ʯ���Ĳ�ѯ</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/getRecharge.jsp" target="contentFrame">��ֵ�û���ѯ</a></div>
		 		<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/sumary2.jsp" target="contentFrame">��Ӫ������ز�ѯ</a></div>
		 		<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/sumary.jsp" target="contentFrame">��Ϸ������ز�ѯ</a></div>
		 		<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/mobileSum.jsp" target="contentFrame">��Ӫ��������</a></div>	
                <div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/consume.jsp" target="contentFrame">����ͳ��(�����ѯ)</a></div>	
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/consume2.jsp" target="contentFrame">����ͳ��(��Сʱ��ѯ)</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/userlevel.jsp" target="contentFrame">�û��ȼ��ֲ�</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/7daysleft.jsp" target="contentFrame">7�������ѯ</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/userspat.jsp" target="contentFrame">�û�����ֲ�</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="/admin/mobile/operators/simple/chargeInfo.jsp" target="contentFrame">�����û������ϸ</a></div>
				<div name="f121" id="f121" class="subItem2">��<a href="http://lznxquery.tw.youjoy.com/lznxRank/rewardQuery_cn.html" target="contentFrame">������Ų�ѯ����</a></div>
			 
				
	</div>
	</#if>

	<#if param?index_of("m",0)&gt;-1 || allper>
	<div class="menuItem"  id="m">������Ϸ��̨����</div>
	<div id="m1" class="sty1">	
		 	<div id="m15" class="subItem">��������</div>
				<div name="m151" id="m151" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/online.php" target="contentFrame">�����б�</a></div>
				<div name="m151" id="m151" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/userinfo.php" target="contentFrame">�û�����ϸ��Ϣ</a></div> 
				<div name="m151" id="m151" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/user.php" target="contentFrame">��ѯ�û���uid</a></div> 
			<div id="m11" class="subItem">����ϵͳ</div>
		 		<div name="m111" id="m111" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/announce.php" target="contentFrame">����ϵͳ</a></div>
			<div id="m12" class="subItem">����ҳtipsϵͳ</div>
		 		<div name="m121" id="m121" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/enter.php?file=enter" target="contentFrame">����������ҳtips</a></div>
				<div name="m121" id="m121" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/enter.php?file=leave" target="contentFrame">����������ҳtips</a></div>
			<div id="m13" class="subItem">΢�����</div>
		 		<div name="m131" id="m131" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/weixin_user.php" target="contentFrame">����ϷID��΢���û�</a></div>
		 		<div name="m131" id="m131" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/weixin_nologin.php" target="contentFrame">δ��¼��Ϸ��΢�����</a></div>
		 	<div id="m14" class="subItem">���������</div>
				<div name="m141" id="m141" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/truePlayer.php" target="contentFrame">��������ʵ�����������</a></div>	
                <div name="m141" id="m141" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/bangdan.php" target="contentFrame">������ʵʱ������</a></div>	
				<div name="m141" id="m141" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/history.php" target="contentFrame">��������ʷ������</a></div>
				<div name="m141" id="m141" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/addData.php" target="contentFrame">������Ϊ����</a></div>
			
			<div id="m16" class="subItem">��ֵ���</div>
				<div name="m161" id="m161" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/charge.php" target="contentFrame">��ֵ����</a></div>
				<div name="m161" id="m161" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/chargeLog.php" target="contentFrame">��ֵ��¼</a></div>
				<div name="m161" id="m161" class="subItem2">��<a href="http://112.124.4.59/texas_analyse/TV/game_charge.php" target="contentFrame">��ֵ����¼��ѯ</a></div>
				 
				
	</div>
	</#if>
	
	<#if param?index_of("h",0)&gt;-1 || allper>
	<div class="menuItem"  id="h">������������Ӫ����</div>
	<div id="h1" class="sty1">
			<div id="h11" class="subItem">����������ֵ��ѯ</div>
				<div name="h111" id="h111" class="subItem2">��<a href="http://cn.youjoy.com/admin/djsg/chargeQuery.html" target="contentFrame">��ֵ��ѯ</a></div>
	</div>
	</#if>
	
	<#if param?index_of("j",0)&gt;-1 || allper>
	<div class="menuItem"  id="j">��֮��Ϯ�����ˣ�</div>
	<div id="j1" class="sty1">	
		 	
			<div id="j13" class="subItem">��Ӫ������أ�����汾��</div>
		 		<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/operatorsAll.jsp" target="contentFrame">��Ӫ���ݲ�ѯ</a></div>
		 		<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/gemSearch.jsp" target="contentFrame">��ʯ���Ĳ�ѯ</a></div>
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/getRecharge.jsp" target="contentFrame">��ֵ�û���ѯ</a></div>
		 		<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/sumary2.jsp" target="contentFrame">��Ӫ������ز�ѯ</a></div>
		 		<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/sumary.jsp" target="contentFrame">��Ϸ������ز�ѯ</a></div>
		 		<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/mobileSum.jsp" target="contentFrame">��Ӫ��������</a></div>	
                <div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/consume.jsp" target="contentFrame">����ͳ��(�����ѯ)</a></div>	
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/consume2.jsp" target="contentFrame">����ͳ��(��Сʱ��ѯ)</a></div>
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/userlevel.jsp" target="contentFrame">�û��ȼ��ֲ�</a></div>
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/7daysleft.jsp" target="contentFrame">7�������ѯ</a></div>
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/userspat.jsp" target="contentFrame">�û�����ֲ�</a></div>
				<div name="j131" id="j131" class="subItem2">��<a href="/admin/mobile/operators/yunying/chargeInfo.jsp" target="contentFrame">�����û������ϸ</a></div>
				 
				
	</div>
	</#if>
</div>
</#if>

<div class="menuHead"><a href="javascript:top.window.location.href='/admin/logout.action'">�˳�</a></div>
</body>
</html>