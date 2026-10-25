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
TUV1</title>
<script src="PAGE144.JS?U=1656419266" language="JavaScript" charset="utf-8" />
</head>
<body onload="GetXML('PAGE144.XML'); FunWatchDog();" style="margin: 0px 0px 0px 0px">
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
<input class="mono" tabindex="5" type="text" id="INPUT6" style="position: absolute; top: 421px; left: 584px; width: 89px; z-index: 30; font-size: 24px; color: #FFFFFF; background: none; font-weight: bold; border: none; text-align: center;" value="{INPUT[6]/@VALUE}" readonly="readonly" />
</form>
<div style="position: absolute; top: 96px; left: 4px; z-index: 1; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px; color: #FFFFFF; font-weight: bold;"></div>
<div style="position: absolute; top: 324px; left: 4px; z-index: 2; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 248px; left: 4px; z-index: 3; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 172px; left: 4px; z-index: 4; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 1px; left: 0px; z-index: 5; background-image: url(IMAGES/LISTA5.PNG); line-height: 91px; height: 91px; width: 799px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<a href="PAGE131.XML" class="ablock" style="position: absolute; top: 0px; left: 334px; z-index: 6; background-image: url(IMAGES/MENU7.PNG); line-height: 99px; height: 99px; width: 131px;"></a>
<div style="position: absolute; top: 26px; left: 20px; z-index: 7; font-size: 24px; color: #FFFFFF; font-weight: bold;">OHÅ˜EV TEPLÃ‰ VODY</div>
<div style="position: absolute; top: 28px; left: 742px; z-index: 8; font-size: 24px; color: #FFFFFF; font-weight: bold;">2/4</div>
<div style="position: absolute; top: 120px; left: 20px; z-index: 9; font-size: 22px; color: #FFFFFF; font-weight: bold;">PoÅ¾adovanÃ¡ teplota vody</div>
<a href="PAGE143.XML" class="ablock" style="position: absolute; top: 8px; left: 578px; z-index: 10; background-image: url(IMAGES/SIPKA__5.PNG); line-height: 70px; height: 70px; width: 70px;"></a>
<xsl:if test="1 &lt;= ACCESS/@USER_LEVEL">
<form style="position: absolute; top: 8px; left: 650px; z-index: 11;">
<xsl:if test="INPUT[1]/@VALUE = 0">
<input id="INPUT1h" type="hidden" name="{INPUT[1]/@NAME}" value="1" />
<div id="INPUT1" class="imgsub" onclick="PostXML1()" style="background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<input id="INPUT1h" type="hidden" name="{INPUT[1]/@NAME}" value="0" />
<div id="INPUT1" class="imgsub" onclick="PostXML1()" style="background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
</form>
</xsl:if>
<xsl:if test="1 &gt; ACCESS/@USER_LEVEL">
<xsl:if test="INPUT[1]/@VALUE = 0">
<div id="INPUT1" style="position: absolute; top: 8px; left: 650px; z-index: 11; background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
<xsl:if test="INPUT[1]/@VALUE != 0">
<div id="INPUT1" style="position: absolute; top: 8px; left: 650px; z-index: 11; background-image: url(IMAGES/SIPKA__3.PNG); line-height: 70px; height: 70px; width: 70px; color: #FFFFFF;"></div>
</xsl:if>
</xsl:if>
<div style="position: absolute; top: 400px; left: 4px; z-index: 12; background-image: url(IMAGES/POLE23.PNG); line-height: 76px; height: 76px; width: 792px;"></div>
<div style="position: absolute; top: 103px; left: 566px; z-index: 13; background-image: url(IMAGES/PO3443_1.PNG); line-height: 62px; height: 62px; width: 119px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<form action="javascript:PostXML2()" style="position: absolute; top: 119px; left: 584px; z-index: 14; font-size: 24px;">
<input title="PoÅ¾adovanÃ¡ teplota vody" id="INPUT2" onfocus="document.getElementById('INPUT2x').style.visibility='visible';SetInputEdited(2, event);" onblur="InputFocused[1]=0" onkeydown="SetInputEdited(2, event);" class="mono" tabindex="1" type="text" style="width: 89px; background: none; font-weight: bold; border: none; text-align: center;" name="{INPUT[2]/@NAME}" value="{INPUT[2]/@VALUE}" />
<input type="submit" id="INPUT2x" style="position: absolute; top: 0px; height: 30px; width: 30px; visibility: hidden;" value="&gt;" />
</form>
<div style="position: absolute; top: 121px; left: 701px; z-index: 15; font-size: 22px; color: #FFFFFF; font-weight: bold;">Â°C</div>
<div style="position: absolute; top: 273px; left: 701px; z-index: 16; font-size: 22px; color: #FFFFFF; font-weight: bold;">hh:mm</div>
<div style="position: absolute; top: 331px; left: 566px; z-index: 17; background-image: url(IMAGES/PO3443_1.PNG); line-height: 62px; height: 62px; width: 119px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<div style="position: absolute; top: 255px; left: 566px; z-index: 18; background-image: url(IMAGES/PO3443_1.PNG); line-height: 62px; height: 62px; width: 119px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<div style="position: absolute; top: 179px; left: 566px; z-index: 19; background-image: url(IMAGES/PO3443_1.PNG); line-height: 62px; height: 62px; width: 119px; font-size: 20px; color: #FFFFFF; font-weight: bold;"></div>
<div style="position: absolute; top: 198px; left: 701px; z-index: 20; font-size: 22px; color: #FFFFFF; font-weight: bold;">Â°C</div>
<div style="position: absolute; top: 347px; left: 701px; z-index: 21; font-size: 22px; color: #FFFFFF; font-weight: bold;">hh:mm</div>
<div style="position: absolute; top: 423px; left: 701px; z-index: 22; font-size: 22px; color: #FFFFFF; font-weight: bold;">Â°C</div>
<div style="position: absolute; top: 196px; left: 20px; z-index: 23; font-size: 22px; color: #FFFFFF; font-weight: bold;">Hystereze ohÅ™evu teplÃ© vody</div>
<form action="javascript:PostXML3()" style="position: absolute; top: 195px; left: 584px; z-index: 24; font-size: 24px;">
<input title="Hystereze ohÅ™evu teplÃ© vody" id="INPUT3" onfocus="document.getElementById('INPUT3x').style.visibility='visible';SetInputEdited(3, event);" onblur="InputFocused[2]=0" onkeydown="SetInputEdited(3, event);" class="mono" tabindex="2" type="text" style="width: 89px; background: none; font-weight: bold; border: none; text-align: center;" name="{INPUT[3]/@NAME}" value="{INPUT[3]/@VALUE}" />
<input type="submit" id="INPUT3x" style="position: absolute; top: 0px; height: 30px; width: 30px; visibility: hidden;" value="&gt;" />
</form>
<div style="position: absolute; top: 273px; left: 20px; z-index: 25; font-size: 22px; color: #FFFFFF; font-weight: bold;">ÄŒas zapnutÃ­ ohÅ™evu teplÃ© vody</div>
<div style="position: absolute; top: 348px; left: 20px; z-index: 26; font-size: 22px; color: #FFFFFF; font-weight: bold;">ÄŒas vypnutÃ­ ohÅ™evu teplÃ© vody</div>
<div style="position: absolute; top: 424px; left: 20px; z-index: 27; font-size: 22px; color: #FFFFFF; font-weight: bold;">AktuÃ¡lnÃ­ teplota teplÃ© vody</div>
<form action="javascript:PostXML4()" style="position: absolute; top: 345px; left: 584px; z-index: 28; font-size: 24px;">
<input title="ÄŒas vypnutÃ­ ohÅ™evu" id="INPUT4" onfocus="document.getElementById('INPUT4x').style.visibility='visible';SetInputEdited(4, event);" onblur="InputFocused[3]=0" onkeydown="SetInputEdited(4, event);" class="mono" tabindex="3" type="text" style="width: 89px; background: none; font-weight: bold; border: none; text-align: center;" name="{INPUT[4]/@NAME}" value="{INPUT[4]/@VALUE}" />
<input type="submit" id="INPUT4x" style="position: absolute; top: 0px; height: 30px; width: 30px; visibility: hidden;" value="&gt;" />
</form>
<form action="javascript:PostXML5()" style="position: absolute; top: 270px; left: 584px; z-index: 29; font-size: 24px;">
<input title="ÄŒas zapnutÃ­ ohÅ™evu" id="INPUT5" onfocus="document.getElementById('INPUT5x').style.visibility='visible';SetInputEdited(5, event);" onblur="InputFocused[4]=0" onkeydown="SetInputEdited(5, event);" class="mono" tabindex="4" type="text" style="width: 89px; background: none; font-weight: bold; border: none; text-align: center;" name="{INPUT[5]/@NAME}" value="{INPUT[5]/@VALUE}" />
<input type="submit" id="INPUT5x" style="position: absolute; top: 0px; height: 30px; width: 30px; visibility: hidden;" value="&gt;" />
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
