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
TUV</title>
<script src="PAGE143.JS?U=1656419266" language="JavaScript" charset="utf-8" />
</head>
<body onload="GetXML('PAGE143.XML'); FunWatchDog();" style="margin: 0px 0px 0px 0px">
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
<form action="javascript:PostGlobal();"></form>
<div style="position: absolute; top: 96px; left: 4px; z-index: 1; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px; color: #FFFFFF; font-weight: bold;"></div>
<div style="position: absolute; top: 324px; left: 4px; z-index: 2; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 248px; left: 4px; z-index: 3; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 172px; left: 4px; z-index: 4; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 1px; left: 0px; z-index: 5; background-image: url(IMAGES/LISTA5.PNG); line-height: 91px; height: 91px; width: 799px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<a href="PAGE131.XML" class="ablock" style="position: absolute; top: 0px; left: 334px; z-index: 6; background-image: url(IMAGES/MENU7.PNG); line-height: 99px; height: 99px; width: 131px;"></a>
<div style="position: absolute; top: 26px; left: 20px; z-index: 7; font-size: 24px; color: #FFFFFF; font-weight: bold;">OHÅ˜EV TEPLÃ‰ VODY</div>
<div style="position: absolute; top: 28px; left: 742px; z-index: 8; font-size: 24px; color: #FFFFFF; font-weight: bold;">1/4</div>
<a href="PAGE144.XML" class="ablock" style="position: absolute; top: 8px; left: 650px; z-index: 9; background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px;"></a>
<form style="position: absolute; top: 106px; left: 554px; z-index: 10;">
<xsl:if test="INPUT[1]/@VALUE = 0">
<input id="INPUT1h" type="hidden" name="{INPUT[1]/@NAME}" value="1" />
<div id="INPUT1" class="imgsub" onclick="PostXML1()" style="background-image: url(IMAGES/VYPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<input id="INPUT1h" type="hidden" name="{INPUT[1]/@NAME}" value="0" />
<div id="INPUT1" class="imgsub" onclick="PostXML1()" style="background-image: url(IMAGES/ZAPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
</form>
<xsl:if test="INPUT[2]/@VALUE = 0">
<div id="INPUT2" style="position: absolute; top: 194px; left: 610px; z-index: 11; background-image: url(IMAGES/NEAKTI_3.PNG); line-height: 34px; height: 34px; width: 34px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[2]/@VALUE != 0">
<div id="INPUT2" style="position: absolute; top: 194px; left: 610px; z-index: 11; background-image: url(IMAGES/AKTIVNI2.PNG); line-height: 34px; height: 34px; width: 34px; color: #FFFFFF;"></div>
</xsl:if>
<div style="position: absolute; top: 120px; left: 20px; z-index: 12; font-size: 22px; color: #FFFFFF; font-weight: bold;">OhÅ™ev teplÃ© vody</div>
<div style="position: absolute; top: 196px; left: 20px; z-index: 13; font-size: 22px; color: #FFFFFF; font-weight: bold;">OhÅ™ev teplÃ© vody aktivovÃ¡n</div>
<div style="position: absolute; top: 273px; left: 20px; z-index: 14; font-size: 22px; color: #FFFFFF; font-weight: bold;">ÄŒasovaÄ� ohÅ™evu vody</div>
<form style="position: absolute; top: 258px; left: 554px; z-index: 15;">
<xsl:if test="INPUT[3]/@VALUE = 0">
<input id="INPUT3h" type="hidden" name="{INPUT[3]/@NAME}" value="1" />
<div id="INPUT3" class="imgsub" onclick="PostXML3()" style="background-image: url(IMAGES/VYPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[3]/@VALUE != 0">
<input id="INPUT3h" type="hidden" name="{INPUT[3]/@NAME}" value="0" />
<div id="INPUT3" class="imgsub" onclick="PostXML3()" style="background-image: url(IMAGES/ZAPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
</form>
<div style="position: absolute; top: 348px; left: 20px; z-index: 16; font-size: 22px; color: #FFFFFF; font-weight: bold;">Program Legionella</div>
<form style="position: absolute; top: 334px; left: 554px; z-index: 17;">
<xsl:if test="INPUT[4]/@VALUE = 0">
<input id="INPUT4h" type="hidden" name="{INPUT[4]/@NAME}" value="1" />
<div id="INPUT4" class="imgsub" onclick="PostXML4()" style="background-image: url(IMAGES/VYPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[4]/@VALUE != 0">
<input id="INPUT4h" type="hidden" name="{INPUT[4]/@NAME}" value="0" />
<div id="INPUT4" class="imgsub" onclick="PostXML4()" style="background-image: url(IMAGES/ZAPNUTO2.PNG); line-height: 55px; height: 55px; width: 144px; color: #FFFFFF;"></div>
</xsl:if>
</form>
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
