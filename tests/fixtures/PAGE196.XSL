<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
<xsl:output doctype-public="-//W3C//DTD HTML 4.01 STRICT//EN" encoding="UTF-8" />
<xsl:template match="/PAGE">
<html>
<head>
<meta name="viewport" content="width=800" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes" />
<meta name="generator" content="WebMaker" />
<meta name="author" content=" SIOB s.r.o.." />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache, must-revalidate" />
<meta http-equiv="expires" content="0" />
<script type="text/javascript">
(function(document,navigator,standalone) {
if ((standalone in navigator) &amp;&amp; navigator[standalone]) {
var curnode, location=document.location, stop=/^(a|html)$/i;
document.addEventListener('click', function(e) {
curnode=e.target;
while (!(stop).test(curnode.nodeName)) {
curnode=curnode.parentNode;
}
if('href' in curnode &amp;&amp; ( curnode.href.indexOf('http') || ~curnode.href.indexOf(location.host) ) ) {
e.preventDefault();
location.href = curnode.href;
}
},false);
}
})(document,window.navigator,'standalone');
</script>
<link rel="shortcut icon" href="FAVICON.ICO" type="image/x-icon" />
<link href="STYLE.CSS" rel="stylesheet" type="text/css" />
<title>
<xsl:value-of select="/PAGE/@TITLE" />
Data - schÃ©ma</title>
<script src="PAGE196.JS?U=1656419266" language="JavaScript" charset="utf-8" />
</head>
<body onload="GetXML('PAGE196.XML'); FunWatchDog();" style="margin: 0px 0px 0px 0px">
<xsl:if test="1656419266 != ACCESS/@UCID">
<xsl:attribute name="onload">
null;
</xsl:attribute>
<div id="cachewarning" style="text-align: left;"></div>
<script src="REFCLR.JS" language="JavaScript" charset="utf-8"></script>
</xsl:if>
<xsl:if test="1656419266 = ACCESS/@UCID">
<table cellpadding="0" cellspacing="0">
<tr>
<!--menu-->
<!--plan-->
<td id="page" style="border: 0px;">
<div style="background-image: url(&quot;IMAGES/BG9.PNG&quot;); background-repeat: no-repeat; background-color:#000000;position: relative; width: 800px; height: 480px;">
<form action="javascript:PostGlobal();">
<input class="mono" tabindex="1" type="text" id="INPUT9" style="position: absolute; top: 242px; left: 137px; width: 45px; z-index: 16; font-size: 24px; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[8]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="17" type="text" id="INPUT10" style="position: absolute; top: 122px; left: 297px; width: 34px; z-index: 18; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[9]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="2" type="text" id="INPUT11" style="position: absolute; top: 203px; left: 272px; width: 56px; z-index: 20; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[10]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="15" type="text" id="INPUT12" style="position: absolute; top: 328px; left: 272px; width: 56px; z-index: 22; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[11]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="16" type="text" id="INPUT13" style="position: absolute; top: 281px; left: 310px; width: 56px; z-index: 24; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[12]/@VALUE}" readonly="readonly" />
<xsl:if test="INPUT[17]/@VALUE = 0">
<input class="mono" tabindex="13" type="text" id="INPUT21" style="position: absolute; top: 207px; left: 478px; width: 56px; z-index: 32; font-size: 18px; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[20]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE != 0">
<input class="mono" tabindex="13" type="text" id="INPUT21" style="position: absolute; top: 207px; left: 478px; width: 56px; z-index: 32; font-size: 18px; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[20]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE = 0">
<input class="mono" tabindex="7" type="text" id="INPUT24" style="position: absolute; top: 105px; left: 711px; width: 56px; z-index: 35; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[22]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE != 0">
<input class="mono" tabindex="7" type="text" id="INPUT24" style="position: absolute; top: 105px; left: 711px; width: 56px; z-index: 35; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[22]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<input class="mono" tabindex="5" type="text" id="INPUT33" style="position: absolute; top: 193px; left: 711px; width: 56px; z-index: 44; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[32]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<input class="mono" tabindex="5" type="text" id="INPUT33" style="position: absolute; top: 193px; left: 711px; width: 56px; z-index: 44; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[32]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE = 0">
<input class="mono" tabindex="14" type="text" id="INPUT40" style="position: absolute; top: 207px; left: 478px; width: 56px; z-index: 51; font-size: 18px; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[20]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE != 0">
<input class="mono" tabindex="14" type="text" id="INPUT40" style="position: absolute; top: 207px; left: 478px; width: 56px; z-index: 51; font-size: 18px; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[20]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE = 0">
<input class="mono" tabindex="11" type="text" id="INPUT43" style="position: absolute; top: 105px; left: 711px; width: 56px; z-index: 54; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[22]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE != 0">
<input class="mono" tabindex="11" type="text" id="INPUT43" style="position: absolute; top: 105px; left: 711px; width: 56px; z-index: 54; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[22]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<input class="mono" tabindex="9" type="text" id="INPUT52" style="position: absolute; top: 194px; left: 711px; width: 56px; z-index: 63; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[32]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<input class="mono" tabindex="9" type="text" id="INPUT52" style="position: absolute; top: 194px; left: 711px; width: 56px; z-index: 63; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[32]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<input class="mono" tabindex="12" type="text" id="INPUT61" style="position: absolute; top: 410px; left: 535px; width: 56px; z-index: 72; font-size: 18px; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[41]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<input class="mono" tabindex="12" type="text" id="INPUT61" style="position: absolute; top: 410px; left: 535px; width: 56px; z-index: 72; font-size: 18px; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[41]/@VALUE}" readonly="readonly" />
</xsl:if>
<input class="mono" tabindex="3" type="text" id="INPUT65" style="position: absolute; top: 288px; left: 97px; width: 82px; z-index: 78; font-size: 22px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: center;" value="{INPUT[45]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="8" type="text" id="INPUT66" style="position: absolute; top: 347px; left: 98px; width: 82px; z-index: 80; font-size: 22px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: center;" value="{INPUT[46]/@VALUE}" readonly="readonly" />
<input class="mono" tabindex="4" type="text" id="INPUT67" style="position: absolute; top: 318px; left: 97px; width: 82px; z-index: 83; font-size: 22px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: center;" value="{INPUT[47]/@VALUE}" readonly="readonly" />
<xsl:if test="INPUT[49]/@VALUE = 0">
<input class="mono" tabindex="10" type="text" id="INPUT73" style="position: absolute; top: 286px; left: 711px; width: 56px; z-index: 89; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[51]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<input class="mono" tabindex="10" type="text" id="INPUT73" style="position: absolute; top: 286px; left: 711px; width: 56px; z-index: 89; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[51]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<input class="mono" tabindex="6" type="text" id="INPUT79" style="position: absolute; top: 281px; left: 711px; width: 56px; z-index: 95; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; visibility: hidden; text-align: right;" value="{INPUT[51]/@VALUE}" readonly="readonly" />
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<input class="mono" tabindex="6" type="text" id="INPUT79" style="position: absolute; top: 281px; left: 711px; width: 56px; z-index: 95; font-size: 18px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: right;" value="{INPUT[51]/@VALUE}" readonly="readonly" />
</xsl:if>
</form>
<xsl:if test="INPUT[1]/@VALUE != 0">
<div style="position: absolute; top: 0px; left: 0px; z-index: 1; background-image: url(IMAGES/BG_SCH_5.PNG); line-height: 480px; height: 480px; width: 800px; visibility: hidden;" id="INPUT1"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<div style="position: absolute; top: 0px; left: 0px; z-index: 1; background-image: url(IMAGES/BG_SCH_5.PNG); line-height: 480px; height: 480px; width: 800px;" id="INPUT1"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<div style="position: absolute; top: 0px; left: 0px; z-index: 2; background-image: url(IMAGES/BG_SCH_4.PNG); line-height: 480px; height: 480px; width: 800px; visibility: hidden;" id="INPUT2"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<div style="position: absolute; top: 0px; left: 0px; z-index: 2; background-image: url(IMAGES/BG_SCH_4.PNG); line-height: 480px; height: 480px; width: 800px;" id="INPUT2"></div>
</xsl:if>
<div style="position: absolute; top: 1px; left: 0px; z-index: 3; background-image: url(IMAGES/LISTA5.PNG); line-height: 91px; height: 91px; width: 799px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<a href="PAGE131.XML" class="ablock" style="position: absolute; top: 0px; left: 334px; z-index: 4; background-image: url(IMAGES/MENU7.PNG); line-height: 99px; height: 99px; width: 131px;"></a>
<div style="position: absolute; top: 26px; left: 20px; z-index: 5; font-size: 24px; color: #FFFFFF; font-weight: bold;">DATA - schÃ©ma TÄŒ</div>
<div style="position: absolute; top: 28px; left: 742px; z-index: 6; font-size: 24px; color: #FFFFFF; font-weight: bold;">1/2</div>
<xsl:if test="1 &lt;= ACCESS/@USER_LEVEL">
<form style="position: absolute; top: 8px; left: 650px; z-index: 7;">
<xsl:if test="INPUT[2]/@VALUE = 0">
<input id="INPUT3h" type="hidden" name="{INPUT[2]/@NAME}" value="1" />
<div id="INPUT3" class="imgsub" onclick="PostXML3()" style="background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[2]/@VALUE != 0">
<input id="INPUT3h" type="hidden" name="{INPUT[2]/@NAME}" value="0" />
<div id="INPUT3" class="imgsub" onclick="PostXML3()" style="background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
</form>
</xsl:if>
<xsl:if test="1 &gt; ACCESS/@USER_LEVEL">
<xsl:if test="INPUT[2]/@VALUE = 0">
<div id="INPUT3" style="position: absolute; top: 8px; left: 650px; z-index: 7; background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[2]/@VALUE != 0">
<div id="INPUT3" style="position: absolute; top: 8px; left: 650px; z-index: 7; background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[3]/@VALUE = 0">
<div style="position: absolute; top: 131px; left: 167px; z-index: 8; background-image: url(IMAGES/HEAT4.PNG); line-height: 43px; height: 43px; width: 28px; visibility: hidden;" id="INPUT4"></div>
</xsl:if>
<xsl:if test="INPUT[3]/@VALUE != 0">
<div style="position: absolute; top: 131px; left: 167px; z-index: 8; background-image: url(IMAGES/HEAT4.PNG); line-height: 43px; height: 43px; width: 28px;" id="INPUT4"></div>
</xsl:if>
<xsl:if test="INPUT[4]/@VALUE = 0">
<div style="position: absolute; top: 132px; left: 164px; z-index: 9; background-image: url(IMAGES/COOL4.PNG); line-height: 40px; height: 40px; width: 34px; visibility: hidden;" id="INPUT5"></div>
</xsl:if>
<xsl:if test="INPUT[4]/@VALUE != 0">
<div style="position: absolute; top: 132px; left: 164px; z-index: 9; background-image: url(IMAGES/COOL4.PNG); line-height: 40px; height: 40px; width: 34px;" id="INPUT5"></div>
</xsl:if>
<xsl:if test="INPUT[5]/@VALUE = 0">
<div style="position: absolute; top: 131px; left: 167px; z-index: 10; background-image: url(IMAGES/DEFROST4.PNG); line-height: 41px; height: 41px; width: 28px; visibility: hidden;" id="INPUT6"></div>
</xsl:if>
<xsl:if test="INPUT[5]/@VALUE != 0">
<div style="position: absolute; top: 131px; left: 167px; z-index: 10; background-image: url(IMAGES/DEFROST4.PNG); line-height: 41px; height: 41px; width: 28px;" id="INPUT6"></div>
</xsl:if>
<div style="position: absolute; top: 145px; left: 292px; z-index: 11; background-image: url(IMAGES/CERPAD_5.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
<div style="position: absolute; top: 220px; left: 364px; z-index: 12; background-image: url(IMAGES/ELEKTR_7.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
<xsl:if test="INPUT[6]/@VALUE = 0">
<div style="position: absolute; top: 145px; left: 293px; z-index: 13; background-image: url(IMAGES/CERPAD_4.PNG); line-height: 54px; height: 54px; width: 53px; visibility: hidden;" id="INPUT7"></div>
</xsl:if>
<xsl:if test="INPUT[6]/@VALUE != 0">
<div style="position: absolute; top: 145px; left: 293px; z-index: 13; background-image: url(IMAGES/CERPAD_4.PNG); line-height: 54px; height: 54px; width: 53px;" id="INPUT7"></div>
</xsl:if>
<xsl:if test="INPUT[7]/@VALUE = 0">
<div style="position: absolute; top: 220px; left: 364px; z-index: 14; background-image: url(IMAGES/ELEKTR_8.PNG); line-height: 54px; height: 54px; width: 55px; visibility: hidden;" id="INPUT8"></div>
</xsl:if>
<xsl:if test="INPUT[7]/@VALUE != 0">
<div style="position: absolute; top: 220px; left: 364px; z-index: 14; background-image: url(IMAGES/ELEKTR_8.PNG); line-height: 54px; height: 54px; width: 55px;" id="INPUT8"></div>
</xsl:if>
<div style="position: absolute; top: 243px; left: 188px; z-index: 15; font-size: 20px; font-weight: bold;">%</div>
<div style="position: absolute; top: 124px; left: 334px; z-index: 17; font-size: 16px; color: #FFFFFF; font-weight: bold;">%</div>
<div style="position: absolute; top: 205px; left: 330px; z-index: 19; font-size: 16px; color: #FFFFFF; font-weight: bold;">Â°C</div>
<div style="position: absolute; top: 330px; left: 330px; z-index: 21; font-size: 16px; color: #FFFFFF; font-weight: bold;">Â°C</div>
<div style="position: absolute; top: 305px; left: 318px; z-index: 23; font-size: 16px; color: #FFFFFF; font-weight: bold;">l/min</div>
<xsl:if test="INPUT[1]/@VALUE != 0">
<div style="position: absolute; top: 385px; left: 727px; z-index: 25; background-image: url(IMAGES/UTOFF.PNG); line-height: 54px; height: 54px; width: 54px; visibility: hidden;" id="INPUT14"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<div style="position: absolute; top: 385px; left: 727px; z-index: 25; background-image: url(IMAGES/UTOFF.PNG); line-height: 54px; height: 54px; width: 54px;" id="INPUT14"></div>
</xsl:if>
<xsl:if test="INPUT[13]/@VALUE = 0">
<xsl:if test="INPUT[14]/@VALUE = 0">
<div id="INPUT15" style="position: absolute; top: 389px; left: 731px; z-index: 26; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[14]/@VALUE != 0">
<div id="INPUT15" style="position: absolute; top: 389px; left: 731px; z-index: 26; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[13]/@VALUE != 0">
<xsl:if test="INPUT[14]/@VALUE = 0">
<div id="INPUT15" style="position: absolute; top: 389px; left: 731px; z-index: 26; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[14]/@VALUE != 0">
<div id="INPUT15" style="position: absolute; top: 389px; left: 731px; z-index: 26; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[15]/@VALUE = 0">
<xsl:if test="INPUT[16]/@VALUE = 0">
<div id="INPUT16" style="position: absolute; top: 389px; left: 731px; z-index: 27; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[16]/@VALUE != 0">
<div id="INPUT16" style="position: absolute; top: 389px; left: 731px; z-index: 27; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[15]/@VALUE != 0">
<xsl:if test="INPUT[16]/@VALUE = 0">
<div id="INPUT16" style="position: absolute; top: 389px; left: 731px; z-index: 27; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[16]/@VALUE != 0">
<div id="INPUT16" style="position: absolute; top: 389px; left: 731px; z-index: 27; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE = 0">
<div style="position: absolute; top: 108px; left: 418px; z-index: 28; background-image: url(IMAGES/TUV_V3.PNG); line-height: 348px; height: 348px; width: 144px; visibility: hidden;" id="INPUT17"></div>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE != 0">
<div style="position: absolute; top: 108px; left: 418px; z-index: 28; background-image: url(IMAGES/TUV_V3.PNG); line-height: 348px; height: 348px; width: 144px;" id="INPUT17"></div>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE = 0">
<xsl:if test="INPUT[18]/@VALUE = 0">
<div id="INPUT18" style="position: absolute; top: 400px; left: 418px; z-index: 29; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[18]/@VALUE != 0">
<div id="INPUT18" style="position: absolute; top: 400px; left: 418px; z-index: 29; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE != 0">
<xsl:if test="INPUT[18]/@VALUE = 0">
<div id="INPUT18" style="position: absolute; top: 400px; left: 418px; z-index: 29; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[18]/@VALUE != 0">
<div id="INPUT18" style="position: absolute; top: 400px; left: 418px; z-index: 29; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE = 0">
<xsl:if test="INPUT[19]/@VALUE = 0">
<div id="INPUT19" style="position: absolute; top: 153px; left: 494px; z-index: 30; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[19]/@VALUE != 0">
<div id="INPUT19" style="position: absolute; top: 153px; left: 494px; z-index: 30; background-image: url(IMAGES/TUVOHRE3.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE != 0">
<xsl:if test="INPUT[19]/@VALUE = 0">
<div id="INPUT19" style="position: absolute; top: 153px; left: 494px; z-index: 30; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[19]/@VALUE != 0">
<div id="INPUT19" style="position: absolute; top: 153px; left: 494px; z-index: 30; background-image: url(IMAGES/TUVOHRE3.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE = 0">
<div style="position: absolute; top: 207px; left: 534px; z-index: 31; font-size: 16px; font-weight: bold; visibility: hidden;" id="INPUT20">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[17]/@VALUE != 0">
<div style="position: absolute; top: 207px; left: 534px; z-index: 31; font-size: 16px; font-weight: bold;" id="INPUT20">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE = 0">
<div style="position: absolute; top: 132px; left: 605px; z-index: 33; background-image: url(IMAGES/BAZEN_V2.PNG); line-height: 323px; height: 323px; width: 188px; visibility: hidden;" id="INPUT22"></div>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE != 0">
<div style="position: absolute; top: 132px; left: 605px; z-index: 33; background-image: url(IMAGES/BAZEN_V2.PNG); line-height: 323px; height: 323px; width: 188px;" id="INPUT22"></div>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE = 0">
<div style="position: absolute; top: 107px; left: 769px; z-index: 34; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT23">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE != 0">
<div style="position: absolute; top: 107px; left: 769px; z-index: 34; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT23">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[23]/@VALUE = 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT25" style="position: absolute; top: 400px; left: 605px; z-index: 36; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT25" style="position: absolute; top: 400px; left: 605px; z-index: 36; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[23]/@VALUE != 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT25" style="position: absolute; top: 400px; left: 605px; z-index: 36; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT25" style="position: absolute; top: 400px; left: 605px; z-index: 36; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[25]/@VALUE = 0">
<xsl:if test="INPUT[26]/@VALUE = 0">
<div id="INPUT26" style="position: absolute; top: 400px; left: 605px; z-index: 37; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[26]/@VALUE != 0">
<div id="INPUT26" style="position: absolute; top: 400px; left: 605px; z-index: 37; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[25]/@VALUE != 0">
<xsl:if test="INPUT[26]/@VALUE = 0">
<div id="INPUT26" style="position: absolute; top: 400px; left: 605px; z-index: 37; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[26]/@VALUE != 0">
<div id="INPUT26" style="position: absolute; top: 400px; left: 605px; z-index: 37; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE = 0">
<xsl:if test="INPUT[27]/@VALUE = 0">
<div id="INPUT27" style="position: absolute; top: 133px; left: 739px; z-index: 38; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[27]/@VALUE != 0">
<div id="INPUT27" style="position: absolute; top: 133px; left: 739px; z-index: 38; background-image: url(IMAGES/BAZENON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[21]/@VALUE != 0">
<xsl:if test="INPUT[27]/@VALUE = 0">
<div id="INPUT27" style="position: absolute; top: 133px; left: 739px; z-index: 38; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[27]/@VALUE != 0">
<div id="INPUT27" style="position: absolute; top: 133px; left: 739px; z-index: 38; background-image: url(IMAGES/BAZENON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[23]/@VALUE = 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT28" style="position: absolute; top: 108px; left: 695px; z-index: 39; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT28" style="position: absolute; top: 108px; left: 695px; z-index: 39; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[23]/@VALUE != 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT28" style="position: absolute; top: 108px; left: 695px; z-index: 39; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT28" style="position: absolute; top: 108px; left: 695px; z-index: 39; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[25]/@VALUE = 0">
<xsl:if test="INPUT[29]/@VALUE = 0">
<div id="INPUT29" style="position: absolute; top: 108px; left: 695px; z-index: 40; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[29]/@VALUE != 0">
<div id="INPUT29" style="position: absolute; top: 108px; left: 695px; z-index: 40; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[25]/@VALUE != 0">
<xsl:if test="INPUT[29]/@VALUE = 0">
<div id="INPUT29" style="position: absolute; top: 108px; left: 695px; z-index: 40; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
<xsl:if test="INPUT[29]/@VALUE != 0">
<div id="INPUT29" style="position: absolute; top: 108px; left: 695px; z-index: 40; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<div style="position: absolute; top: 218px; left: 669px; z-index: 41; background-image: url(IMAGES/MIX1_V1.PNG); line-height: 238px; height: 238px; width: 124px; visibility: hidden;" id="INPUT30"></div>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<div style="position: absolute; top: 218px; left: 669px; z-index: 41; background-image: url(IMAGES/MIX1_V1.PNG); line-height: 238px; height: 238px; width: 124px;" id="INPUT30"></div>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<xsl:if test="INPUT[31]/@VALUE = 0">
<div id="INPUT31" style="position: absolute; top: 218px; left: 738px; z-index: 42; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[31]/@VALUE != 0">
<div id="INPUT31" style="position: absolute; top: 218px; left: 738px; z-index: 42; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<xsl:if test="INPUT[31]/@VALUE = 0">
<div id="INPUT31" style="position: absolute; top: 218px; left: 738px; z-index: 42; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[31]/@VALUE != 0">
<div id="INPUT31" style="position: absolute; top: 218px; left: 738px; z-index: 42; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<div style="position: absolute; top: 195px; left: 769px; z-index: 43; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT32">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<div style="position: absolute; top: 195px; left: 769px; z-index: 43; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT32">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT34" style="position: absolute; top: 219px; left: 696px; z-index: 45; line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT34" style="position: absolute; top: 219px; left: 696px; z-index: 45; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT34" style="position: absolute; top: 219px; left: 696px; z-index: 45; line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT34" style="position: absolute; top: 219px; left: 696px; z-index: 45; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT35" style="position: absolute; top: 218px; left: 697px; z-index: 46; line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT35" style="position: absolute; top: 218px; left: 697px; z-index: 46; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT35" style="position: absolute; top: 218px; left: 697px; z-index: 46; line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT35" style="position: absolute; top: 218px; left: 697px; z-index: 46; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE = 0">
<div style="position: absolute; top: 108px; left: 418px; z-index: 47; background-image: url(IMAGES/TUV_V3.PNG); line-height: 348px; height: 348px; width: 144px; visibility: hidden;" id="INPUT36"></div>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE != 0">
<div style="position: absolute; top: 108px; left: 418px; z-index: 47; background-image: url(IMAGES/TUV_V3.PNG); line-height: 348px; height: 348px; width: 144px;" id="INPUT36"></div>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE = 0">
<xsl:if test="INPUT[18]/@VALUE = 0">
<div id="INPUT37" style="position: absolute; top: 400px; left: 418px; z-index: 48; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[18]/@VALUE != 0">
<div id="INPUT37" style="position: absolute; top: 400px; left: 418px; z-index: 48; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE != 0">
<xsl:if test="INPUT[18]/@VALUE = 0">
<div id="INPUT37" style="position: absolute; top: 400px; left: 418px; z-index: 48; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[18]/@VALUE != 0">
<div id="INPUT37" style="position: absolute; top: 400px; left: 418px; z-index: 48; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE = 0">
<xsl:if test="INPUT[19]/@VALUE = 0">
<div id="INPUT38" style="position: absolute; top: 153px; left: 494px; z-index: 49; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[19]/@VALUE != 0">
<div id="INPUT38" style="position: absolute; top: 153px; left: 494px; z-index: 49; background-image: url(IMAGES/TUVOHRE3.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE != 0">
<xsl:if test="INPUT[19]/@VALUE = 0">
<div id="INPUT38" style="position: absolute; top: 153px; left: 494px; z-index: 49; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[19]/@VALUE != 0">
<div id="INPUT38" style="position: absolute; top: 153px; left: 494px; z-index: 49; background-image: url(IMAGES/TUVOHRE3.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE = 0">
<div style="position: absolute; top: 207px; left: 534px; z-index: 50; font-size: 16px; font-weight: bold; visibility: hidden;" id="INPUT39">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[33]/@VALUE != 0">
<div style="position: absolute; top: 207px; left: 534px; z-index: 50; font-size: 16px; font-weight: bold;" id="INPUT39">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE = 0">
<div style="position: absolute; top: 132px; left: 480px; z-index: 52; background-image: url(IMAGES/BAZEN__6.PNG); line-height: 323px; height: 323px; width: 311px; visibility: hidden;" id="INPUT41"></div>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE != 0">
<div style="position: absolute; top: 132px; left: 480px; z-index: 52; background-image: url(IMAGES/BAZEN__6.PNG); line-height: 323px; height: 323px; width: 311px;" id="INPUT41"></div>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE = 0">
<div style="position: absolute; top: 107px; left: 769px; z-index: 53; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT42">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE != 0">
<div style="position: absolute; top: 107px; left: 769px; z-index: 53; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT42">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[35]/@VALUE = 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT44" style="position: absolute; top: 400px; left: 480px; z-index: 55; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT44" style="position: absolute; top: 400px; left: 480px; z-index: 55; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[35]/@VALUE != 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT44" style="position: absolute; top: 400px; left: 480px; z-index: 55; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT44" style="position: absolute; top: 400px; left: 480px; z-index: 55; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[36]/@VALUE = 0">
<xsl:if test="INPUT[26]/@VALUE = 0">
<div id="INPUT45" style="position: absolute; top: 400px; left: 480px; z-index: 56; line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[26]/@VALUE != 0">
<div id="INPUT45" style="position: absolute; top: 400px; left: 480px; z-index: 56; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[36]/@VALUE != 0">
<xsl:if test="INPUT[26]/@VALUE = 0">
<div id="INPUT45" style="position: absolute; top: 400px; left: 480px; z-index: 56; line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
<xsl:if test="INPUT[26]/@VALUE != 0">
<div id="INPUT45" style="position: absolute; top: 400px; left: 480px; z-index: 56; background-image: url(IMAGES/TUV_TRV1.PNG); line-height: 34px; height: 34px; width: 33px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE = 0">
<xsl:if test="INPUT[27]/@VALUE = 0">
<div id="INPUT46" style="position: absolute; top: 132px; left: 737px; z-index: 57; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[27]/@VALUE != 0">
<div id="INPUT46" style="position: absolute; top: 132px; left: 737px; z-index: 57; background-image: url(IMAGES/BAZENON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[34]/@VALUE != 0">
<xsl:if test="INPUT[27]/@VALUE = 0">
<div id="INPUT46" style="position: absolute; top: 132px; left: 737px; z-index: 57; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[27]/@VALUE != 0">
<div id="INPUT46" style="position: absolute; top: 132px; left: 737px; z-index: 57; background-image: url(IMAGES/BAZENON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[35]/@VALUE = 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT47" style="position: absolute; top: 108px; left: 695px; z-index: 58; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT47" style="position: absolute; top: 108px; left: 695px; z-index: 58; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[35]/@VALUE != 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT47" style="position: absolute; top: 108px; left: 695px; z-index: 58; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT47" style="position: absolute; top: 108px; left: 695px; z-index: 58; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[36]/@VALUE = 0">
<xsl:if test="INPUT[29]/@VALUE = 0">
<div id="INPUT48" style="position: absolute; top: 108px; left: 695px; z-index: 59; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[29]/@VALUE != 0">
<div id="INPUT48" style="position: absolute; top: 108px; left: 695px; z-index: 59; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[36]/@VALUE != 0">
<xsl:if test="INPUT[29]/@VALUE = 0">
<div id="INPUT48" style="position: absolute; top: 108px; left: 695px; z-index: 59; background-image: url(IMAGES/ULIGHTYO.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
<xsl:if test="INPUT[29]/@VALUE != 0">
<div id="INPUT48" style="position: absolute; top: 108px; left: 695px; z-index: 59; background-image: url(IMAGES/ULIGHTG.GIF); line-height: 16px; height: 16px; width: 16px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<div style="position: absolute; top: 217px; left: 682px; z-index: 60; background-image: url(IMAGES/MIX1_A_1.PNG); line-height: 238px; height: 238px; width: 108px; visibility: hidden;" id="INPUT49"></div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<div style="position: absolute; top: 217px; left: 682px; z-index: 60; background-image: url(IMAGES/MIX1_A_1.PNG); line-height: 238px; height: 238px; width: 108px;" id="INPUT49"></div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<xsl:if test="INPUT[31]/@VALUE = 0">
<div id="INPUT50" style="position: absolute; top: 217px; left: 736px; z-index: 61; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[31]/@VALUE != 0">
<div id="INPUT50" style="position: absolute; top: 217px; left: 736px; z-index: 61; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<xsl:if test="INPUT[31]/@VALUE = 0">
<div id="INPUT50" style="position: absolute; top: 217px; left: 736px; z-index: 61; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[31]/@VALUE != 0">
<div id="INPUT50" style="position: absolute; top: 217px; left: 736px; z-index: 61; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<div style="position: absolute; top: 196px; left: 769px; z-index: 62; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT51">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<div style="position: absolute; top: 196px; left: 769px; z-index: 62; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT51">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT53" style="position: absolute; top: 219px; left: 699px; z-index: 64; line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT53" style="position: absolute; top: 219px; left: 699px; z-index: 64; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<xsl:if test="INPUT[24]/@VALUE = 0">
<div id="INPUT53" style="position: absolute; top: 219px; left: 699px; z-index: 64; line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[24]/@VALUE != 0">
<div id="INPUT53" style="position: absolute; top: 219px; left: 699px; z-index: 64; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT54" style="position: absolute; top: 218px; left: 699px; z-index: 65; line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT54" style="position: absolute; top: 218px; left: 699px; z-index: 65; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<xsl:if test="INPUT[28]/@VALUE = 0">
<div id="INPUT54" style="position: absolute; top: 218px; left: 699px; z-index: 65; line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[28]/@VALUE != 0">
<div id="INPUT54" style="position: absolute; top: 218px; left: 699px; z-index: 65; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE = 0">
<div style="position: absolute; top: 386px; left: 713px; z-index: 66; background-image: url(IMAGES/TV_AKU_2.PNG); line-height: 76px; height: 76px; width: 80px; visibility: hidden;" id="INPUT55"></div>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE != 0">
<div style="position: absolute; top: 386px; left: 713px; z-index: 66; background-image: url(IMAGES/TV_AKU_2.PNG); line-height: 76px; height: 76px; width: 80px;" id="INPUT55"></div>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE = 0">
<xsl:if test="INPUT[39]/@VALUE = 0">
<div id="INPUT56" style="position: absolute; top: 391px; left: 729px; z-index: 67; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[39]/@VALUE != 0">
<div id="INPUT56" style="position: absolute; top: 391px; left: 729px; z-index: 67; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE != 0">
<xsl:if test="INPUT[39]/@VALUE = 0">
<div id="INPUT56" style="position: absolute; top: 391px; left: 729px; z-index: 67; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[39]/@VALUE != 0">
<div id="INPUT56" style="position: absolute; top: 391px; left: 729px; z-index: 67; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE = 0">
<xsl:if test="INPUT[40]/@VALUE = 0">
<div id="INPUT57" style="position: absolute; top: 391px; left: 729px; z-index: 68; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[40]/@VALUE != 0">
<div id="INPUT57" style="position: absolute; top: 391px; left: 729px; z-index: 68; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[38]/@VALUE != 0">
<xsl:if test="INPUT[40]/@VALUE = 0">
<div id="INPUT57" style="position: absolute; top: 391px; left: 729px; z-index: 68; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[40]/@VALUE != 0">
<div id="INPUT57" style="position: absolute; top: 391px; left: 729px; z-index: 68; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<xsl:if test="INPUT[14]/@VALUE = 0">
<div id="INPUT58" style="position: absolute; top: 350px; left: 552px; z-index: 69; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[14]/@VALUE != 0">
<div id="INPUT58" style="position: absolute; top: 350px; left: 552px; z-index: 69; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<xsl:if test="INPUT[14]/@VALUE = 0">
<div id="INPUT58" style="position: absolute; top: 350px; left: 552px; z-index: 69; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[14]/@VALUE != 0">
<div id="INPUT58" style="position: absolute; top: 350px; left: 552px; z-index: 69; background-image: url(IMAGES/TVTOPEN3.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<xsl:if test="INPUT[16]/@VALUE = 0">
<div id="INPUT59" style="position: absolute; top: 350px; left: 552px; z-index: 70; line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[16]/@VALUE != 0">
<div id="INPUT59" style="position: absolute; top: 350px; left: 552px; z-index: 70; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<xsl:if test="INPUT[16]/@VALUE = 0">
<div id="INPUT59" style="position: absolute; top: 350px; left: 552px; z-index: 70; line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
<xsl:if test="INPUT[16]/@VALUE != 0">
<div id="INPUT59" style="position: absolute; top: 350px; left: 552px; z-index: 70; background-image: url(IMAGES/TVCHLA_4.PNG); line-height: 46px; height: 46px; width: 46px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE = 0">
<div style="position: absolute; top: 412px; left: 593px; z-index: 71; font-size: 16px; font-weight: bold; visibility: hidden;" id="INPUT60">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<div style="position: absolute; top: 412px; left: 593px; z-index: 71; font-size: 16px; font-weight: bold;" id="INPUT60">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[42]/@VALUE = 0">
<div style="position: absolute; top: 389px; left: 625px; z-index: 73; background-image: url(IMAGES/CERPAD_5.PNG); line-height: 54px; height: 54px; width: 54px; visibility: hidden;" id="INPUT62"></div>
</xsl:if>
<xsl:if test="INPUT[42]/@VALUE != 0">
<div style="position: absolute; top: 389px; left: 625px; z-index: 73; background-image: url(IMAGES/CERPAD_5.PNG); line-height: 54px; height: 54px; width: 54px;" id="INPUT62"></div>
</xsl:if>
<xsl:if test="INPUT[43]/@VALUE = 0">
<div style="position: absolute; top: 389px; left: 626px; z-index: 74; background-image: url(IMAGES/CERPAD_4.PNG); line-height: 54px; height: 54px; width: 53px; visibility: hidden;" id="INPUT63"></div>
</xsl:if>
<xsl:if test="INPUT[43]/@VALUE != 0">
<div style="position: absolute; top: 389px; left: 626px; z-index: 74; background-image: url(IMAGES/CERPAD_4.PNG); line-height: 54px; height: 54px; width: 53px;" id="INPUT63"></div>
</xsl:if>
<xsl:if test="INPUT[44]/@VALUE = 0">
<div id="INPUT64" style="position: absolute; top: 178px; left: 150px; z-index: 75; background-image: url(IMAGES/LOGO_M_2.PNG); line-height: 57px; height: 57px; width: 64px; font-size: 16px; font-weight: bold;"></div>
</xsl:if>
<xsl:if test="INPUT[44]/@VALUE != 0">
<div id="INPUT64" style="position: absolute; top: 178px; left: 150px; z-index: 75; background-image: url(IMAGES/LOGO_F_2.PNG); line-height: 33px; height: 33px; width: 64px; font-size: 16px; font-weight: bold;"></div>
</xsl:if>
<div style="position: absolute; top: 286px; left: 11px; z-index: 76; font-size: 22px; color: #FFFFFF; font-weight: bold;">VÃ½kon</div>
<div style="position: absolute; top: 288px; left: 187px; z-index: 77; font-size: 18px; color: #FFFFFF; font-weight: bold;">kW</div>
<div style="position: absolute; top: 345px; left: 11px; z-index: 79; font-size: 22px; color: #FFFFFF; font-weight: bold;">COP</div>
<div style="position: absolute; top: 316px; left: 11px; z-index: 81; font-size: 22px; color: #FFFFFF; font-weight: bold;">PÅ™Ã­kon</div>
<div style="position: absolute; top: 318px; left: 187px; z-index: 82; font-size: 18px; color: #FFFFFF; font-weight: bold;">kW</div>
<xsl:if test="INPUT[48]/@VALUE = 0">
<a href="PAGE177.XML" class="ablock" style="position: absolute; top: 159px; left: 49px; z-index: 84; background-image: url(IMAGES/STAVYBG2.PNG); line-height: 78px; height: 78px; width: 78px; visibility: hidden;" id="INPUT68"></a>
</xsl:if>
<xsl:if test="INPUT[48]/@VALUE != 0">
<a href="PAGE177.XML" class="ablock" style="position: absolute; top: 159px; left: 49px; z-index: 84; background-image: url(IMAGES/STAVYBG2.PNG); line-height: 78px; height: 78px; width: 78px;" id="INPUT68"></a>
</xsl:if>
<xsl:if test="INPUT[48]/@VALUE = 0">
<a href="PAGE177.XML" class="ablock" id="INPUT69" style="position: absolute; top: 174px; left: 63px; z-index: 85; line-height: 44px; height: 44px; width: 49px;"></a>
</xsl:if>
<xsl:if test="INPUT[48]/@VALUE != 0">
<a href="PAGE177.XML" class="ablock" id="INPUT69" style="position: absolute; top: 174px; left: 63px; z-index: 85; background-image: url(IMAGES/CHYBA3.PNG); line-height: 44px; height: 44px; width: 49px;"></a>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<div style="position: absolute; top: 310px; left: 682px; z-index: 86; background-image: url(IMAGES/MIX2_A_2.PNG); line-height: 56px; height: 56px; width: 108px; visibility: hidden;" id="INPUT70"></div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<div style="position: absolute; top: 310px; left: 682px; z-index: 86; background-image: url(IMAGES/MIX2_A_2.PNG); line-height: 56px; height: 56px; width: 108px;" id="INPUT70"></div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<xsl:if test="INPUT[50]/@VALUE = 0">
<div id="INPUT71" style="position: absolute; top: 310px; left: 736px; z-index: 87; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[50]/@VALUE != 0">
<div id="INPUT71" style="position: absolute; top: 310px; left: 736px; z-index: 87; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<xsl:if test="INPUT[50]/@VALUE = 0">
<div id="INPUT71" style="position: absolute; top: 310px; left: 736px; z-index: 87; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[50]/@VALUE != 0">
<div id="INPUT71" style="position: absolute; top: 310px; left: 736px; z-index: 87; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<div style="position: absolute; top: 288px; left: 769px; z-index: 88; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT72">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<div style="position: absolute; top: 288px; left: 769px; z-index: 88; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT72">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<xsl:if test="INPUT[52]/@VALUE = 0">
<div id="INPUT74" style="position: absolute; top: 311px; left: 699px; z-index: 90; line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[52]/@VALUE != 0">
<div id="INPUT74" style="position: absolute; top: 311px; left: 699px; z-index: 90; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<xsl:if test="INPUT[52]/@VALUE = 0">
<div id="INPUT74" style="position: absolute; top: 311px; left: 699px; z-index: 90; line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[52]/@VALUE != 0">
<div id="INPUT74" style="position: absolute; top: 311px; left: 699px; z-index: 90; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<xsl:if test="INPUT[53]/@VALUE = 0">
<div id="INPUT75" style="position: absolute; top: 310px; left: 700px; z-index: 91; line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[53]/@VALUE != 0">
<div id="INPUT75" style="position: absolute; top: 310px; left: 700px; z-index: 91; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<xsl:if test="INPUT[53]/@VALUE = 0">
<div id="INPUT75" style="position: absolute; top: 310px; left: 700px; z-index: 91; line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[53]/@VALUE != 0">
<div id="INPUT75" style="position: absolute; top: 310px; left: 700px; z-index: 91; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<div style="position: absolute; top: 305px; left: 669px; z-index: 92; background-image: url(IMAGES/MIX2_V2.PNG); line-height: 56px; height: 56px; width: 124px; visibility: hidden;" id="INPUT76"></div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<div style="position: absolute; top: 305px; left: 669px; z-index: 92; background-image: url(IMAGES/MIX2_V2.PNG); line-height: 56px; height: 56px; width: 124px;" id="INPUT76"></div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<xsl:if test="INPUT[50]/@VALUE = 0">
<div id="INPUT77" style="position: absolute; top: 305px; left: 738px; z-index: 93; line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[50]/@VALUE != 0">
<div id="INPUT77" style="position: absolute; top: 305px; left: 738px; z-index: 93; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<xsl:if test="INPUT[50]/@VALUE = 0">
<div id="INPUT77" style="position: absolute; top: 305px; left: 738px; z-index: 93; line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
<xsl:if test="INPUT[50]/@VALUE != 0">
<div id="INPUT77" style="position: absolute; top: 305px; left: 738px; z-index: 93; background-image: url(IMAGES/MIXON.PNG); line-height: 54px; height: 54px; width: 54px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<div style="position: absolute; top: 283px; left: 769px; z-index: 94; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT78">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<div style="position: absolute; top: 283px; left: 769px; z-index: 94; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT78">Â°C</div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<xsl:if test="INPUT[52]/@VALUE = 0">
<div id="INPUT80" style="position: absolute; top: 306px; left: 696px; z-index: 96; line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[52]/@VALUE != 0">
<div id="INPUT80" style="position: absolute; top: 306px; left: 696px; z-index: 96; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<xsl:if test="INPUT[52]/@VALUE = 0">
<div id="INPUT80" style="position: absolute; top: 306px; left: 696px; z-index: 96; line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[52]/@VALUE != 0">
<div id="INPUT80" style="position: absolute; top: 306px; left: 696px; z-index: 96; background-image: url(IMAGES/MIXTRV_4.PNG); line-height: 33px; height: 33px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<xsl:if test="INPUT[53]/@VALUE = 0">
<div id="INPUT81" style="position: absolute; top: 305px; left: 697px; z-index: 97; line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
<xsl:if test="INPUT[53]/@VALUE != 0">
<div id="INPUT81" style="position: absolute; top: 305px; left: 697px; z-index: 97; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px; display: none;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<xsl:if test="INPUT[53]/@VALUE = 0">
<div id="INPUT81" style="position: absolute; top: 305px; left: 697px; z-index: 97; line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
<xsl:if test="INPUT[53]/@VALUE != 0">
<div id="INPUT81" style="position: absolute; top: 305px; left: 697px; z-index: 97; background-image: url(IMAGES/MIXTRV_3.PNG); line-height: 34px; height: 34px; width: 34px;"></div>
</xsl:if>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE = 0">
<div style="position: absolute; top: 244px; left: 724px; z-index: 98; font-size: 18px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT82">1</div>
</xsl:if>
<xsl:if test="INPUT[30]/@VALUE != 0">
<div style="position: absolute; top: 244px; left: 724px; z-index: 98; font-size: 18px; color: #FFFFFF; font-weight: bold;" id="INPUT82">1</div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE = 0">
<div style="position: absolute; top: 332px; left: 724px; z-index: 99; font-size: 18px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT83">2</div>
</xsl:if>
<xsl:if test="INPUT[54]/@VALUE != 0">
<div style="position: absolute; top: 332px; left: 724px; z-index: 99; font-size: 18px; color: #FFFFFF; font-weight: bold;" id="INPUT83">2</div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE = 0">
<div style="position: absolute; top: 247px; left: 725px; z-index: 100; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT84">1</div>
</xsl:if>
<xsl:if test="INPUT[37]/@VALUE != 0">
<div style="position: absolute; top: 247px; left: 725px; z-index: 100; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT84">1</div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE = 0">
<div style="position: absolute; top: 341px; left: 725px; z-index: 101; font-size: 16px; color: #FFFFFF; font-weight: bold; visibility: hidden;" id="INPUT85">2</div>
</xsl:if>
<xsl:if test="INPUT[49]/@VALUE != 0">
<div style="position: absolute; top: 341px; left: 725px; z-index: 101; font-size: 16px; color: #FFFFFF; font-weight: bold;" id="INPUT85">2</div>
</xsl:if>
</div>
</td>
</tr>
<!--bottom-->
</table>
</xsl:if>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
