<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
	<link rel="stylesheet" type="text/css" href="Template.css" />
    <link rel="shortcut icon" href="Imagens/favicon.ico" type="image/x-icon" />
	<title>Simulador WS Cielo</title>
</head>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-24949717-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<%
usuario  = Request.Form("login")
senha = Request.Form("password")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.Jet.OLEDB.4.0"
conn.Open Server.MapPath("WebServiceCieloAdmin\Banco.mdb")

set rs = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados WHERE Usuario = '" & usuario & "' AND senha = '" & senha & "'"
rs.Open SQL, conn

If (rs.EOF) Then
	If usuario <> "" and senha <> "" Then
	%>
	<body><script language="javascript">alert("Login e senha incorretos !")</script></body></html>
	<%
	End if
Else
	If rs("Status") = "Bloqueado" Then
	%>
    <body><script language="javascript">alert("Login bloqueado, contate administrador !")</script></body></html>
    <%
	Else
	Session("login") = "suporteweb"
	Session("password") = "passw0rd"
	Session("nome") = rs("Nome")
	Session("usuario") = rs("Usuario")
	Session("tipo") = rs("tipo")
	erro = ""
	End if
End if

Set rs = Nothing
Set conn = Nothing

If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then
%>
<script language="javascript">
<!--
function alerta_cancelamento(){
	alert("CANCELAMENTO: Esta funcionalidade deve ser utilizada somente para testes !");
}

var dom = (document.getElementById) ? true : false;
var ns5 = ((navigator.userAgent.indexOf("Gecko")>-1) && dom) ? true: false;
var ie5 = ((navigator.userAgent.indexOf("MSIE")>-1) && dom) ? true : false;
var ns4 = (document.layers && !dom) ? true : false;
var ie4 = (document.all && !dom) ? true : false;
var nodyn = (!ns5 && !ns4 && !ie4 && !ie5) ? true : false;

var origWidth, origHeight;
if (ns4) {
	origWidth = window.innerWidth; origHeight = window.innerHeight;
	window.onresize = function() { if (window.innerWidth != origWidth || window.innerHeight != origHeight) history.go(0); }
}

if (nodyn) { event = "nope" }
var tipFollowMouse	= true;	
var tipWidth		= 250;
var offX		 	= 12;
var offY		 	= 12; 
var tipFontFamily 	= "Verdana, arial, helvetica, sans-serif";
var tipFontSize		= "10pt";

var tipFontColor		= "#000080";
var tipBgColor		= "#000080"; 
var origBgColor 		= tipBgColor;
var tipBorderColor 	= "#000080";
var tipBorderWidth 	= 4;
var tipBorderStyle 	= "ridge";
var tipPadding	 	= 4;

var messages = new Array();

messages[0] = new Array('Imagens/textos/info.jpg','<b>Cria\u00e7\u00e3o de uma transa\u00e7\u00e3o<br /><br />Regras:</b><br /><br />* O envio ou n\u00e3o-envio dos dados do cart\u00e3o deve ser condizente com o cadastro da loja junto \u00e0 Cielo.<br /><br />* A forma de pagamento (modalidade e n\u00famero de parcelas) deve tamb\u00e9m ser condizente com o cadastro.',"#FFFFFF");
messages[1] = new Array('Imagens/textos/info.jpg','<b>Autoriza\u00e7\u00e3o via TID<br /><br />Regras:</b><br /><br />* N\u00e3o \u00e9 aceito pedido de autoriza\u00e7\u00e3o caso a autentica\u00e7\u00e3o tenha sido negada. No caso de falha, a solicita\u00e7\u00e3o de autoriza\u00e7\u00e3o \u00e9 recusada (somente para a Visa).<br /><br />* A solicita\u00e7\u00e3o de autoriza\u00e7\u00e3o posterior pode ser efetuada em at\u00e9 90 dias contados a partir da data da transa\u00e7\u00e3o.',"#FFFFFF");
messages[2] = new Array('Imagens/textos/info.jpg','<b>Captura da transa\u00e7\u00e3o<br /><br />Regras:</b><br /><br />* Por padr\u00e3o, o prazo m\u00e1ximo para captura \u00e9 de 5 dias ap\u00f3s a data de autoriza\u00e7\u00e3o. Exemplo: se a data de autoriza\u00e7\u00e3o \u00e9 21/09, o prazo m\u00e1ximo \u00e9 as 0 hs do dia 27/09.<br /><br />* O valor da captura deve ser menor (captura parcial) ou igual (captura total) ao valor autorizado.<br /><br />* Somente transa\u00e7\u00f5es autorizadas podem ser capturadas.<br /><br />* Em caso de falha na captura, outras tentativas poderão ser realizadas.',"#FFFFFF");
messages[3] = new Array('Imagens/textos/info.jpg','<b>Cancelamento da transa\u00e7\u00e3o<br /><br />Regras:</b><br /><br />* Aplic\u00e1vel somente para transa\u00e7\u00e3o autorizada ou capturada.<br /><br />* Deve ser solicitado no mesmo dia da autoriza\u00e7\u00e3o.',"#FFFFFF");
messages[4] = new Array('Imagens/textos/info.jpg','<b>Consulta da transa\u00e7\u00e3o<br /><br />Regras:</b><br /><br />* Somente transa\u00e7\u00f5es dos \u00faltimos 180 dias est\u00e3o dispon\u00edveis para consulta.',"#FFFFFF");
messages[5] = new Array('Imagens/textos/info.jpg','<b>Autoriza\u00e7\u00e3o direta<br /><br />Regras:</b><br /><br />* A loja virtual deve estar habilitada a enviar os dados do cart\u00e3o.<br /><br />* A forma de pagamento (modalidade e n\u00famero de parcelas) deve ser condizente com o cadastro da loja.<br /><br />* A autoriza\u00e7\u00e3o direta aplica-se somente a transa\u00e7\u00f5es de cr\u00e9dito \u00e0 vista e parcelado.<br /><br />* O n\u00edvel de seguran\u00e7a da transa\u00e7\u00e3o (ECI) \u00e9 definido como 7 (se Visa) e 0 (se Mastercard).',"#FFFFFF");
messages[6] = new Array('Imagens/textos/info.jpg','Consulta de transa\u00e7\u00f5es processadas.',"#FFFFFF");
messages[7] = new Array('Imagens/textos/info.jpg','Envio manual do xml',"#FFFFFF");
messages[8] = new Array('Imagens/textos/info.jpg','Parametriza\u00e7\u00e3o dos dados usados no simulador',"#FFFFFF");


if (document.images) {
	var theImgs = new Array();
	for (var i=0; i<messages.length; i++) {
  	theImgs[i] = new Image();
		theImgs[i].src = messages[i][0];
  }
}

var startStr = '<table id="wtable" width="' + tipWidth + '"><tr><td align="center" width="100%"><img src="';
var midStr = '" border="0"></td></tr><tr><td valign="top">';
var endStr = '</td></tr></table>';

var tooltip, tipcss;
function initTip() {
	if (nodyn) return;
	tooltip = (ns4)? document.tipDiv.document: (ie4)? document.all['tipDiv']: (ie5||ns5)? document.getElementById('tipDiv'): null;
	tipcss = (ns4)? document.tipDiv: tooltip.style;
	if (ie4||ie5||ns5) {
		tipcss.width = tipWidth+"px";
		tipcss.fontFamily = tipFontFamily;
		tipcss.fontSize = tipFontSize;
		tipcss.color = tipFontColor;
		tipcss.backgroundColor = tipBgColor;
		tipcss.borderColor = tipBorderColor;
		tipcss.borderWidth = tipBorderWidth+"px";
		tipcss.padding = tipPadding+"px";
		tipcss.borderStyle = tipBorderStyle;
	}
	if (tooltip&&tipFollowMouse) {
		if (ns4) document.captureEvents(Event.MOUSEMOVE);
		document.onmousemove = trackMouse;
	}
}

window.onload = initTip;

var t1,t2;
var tipOn = false;
function doTooltip(evt,num) {

	if (!tooltip) return;
	if (t1) clearTimeout(t1);	if (t2) clearTimeout(t2);
	tipOn = true;
	if (messages[num][2])	var curBgColor = messages[num][2];
	else curBgColor = tipBgColor;
	if (messages[num][3])	var curFontColor = messages[num][3];
	else curFontColor = tipFontColor;
	if (ns4) {
		var tip = '<table id="wtable" bgcolor="' + tipBorderColor + '" width="' + tipWidth + '" cellspacing="0" cellpadding="' + tipBorderWidth + '" border="0"><tr><td><table bgcolor="' + curBgColor + '" width="100%" cellspacing="0" cellpadding="' + tipPadding + '" border="0"><tr><td>'+ startStr + messages[num][0] + midStr + '<span style="font-family:' + tipFontFamily + '; font-size:' + tipFontSize + '; color:' + curFontColor + ';">' + messages[num][1] + '</span>' + endStr + '</td></tr></table></td></tr></table>';
		tooltip.write(tip);
		tooltip.close();

	} else if (ie4||ie5||ns5) {
		var tip = startStr + messages[num][0] + midStr + '<span style="font-family:' + tipFontFamily + '; font-size:' + tipFontSize + '; color:' + curFontColor + ';">' + messages[num][1] + '</span>' + endStr;
		tipcss.backgroundColor = curBgColor;
	 	tooltip.innerHTML = tip;
	}
	if (!tipFollowMouse) positionTip(evt);
	else t1=setTimeout("tipcss.visibility='visible'",100);
}

var mouseX, mouseY;
function trackMouse(evt) {
	mouseX = (ns4||ns5)? evt.pageX: window.event.clientX + document.body.scrollLeft;
	mouseY = (ns4||ns5)? evt.pageY: window.event.clientY + document.body.scrollTop;
	if (tipOn) positionTip(evt);
}

function positionTip(evt) {
	if (!tipFollowMouse) {
		mouseX = (ns4||ns5)? evt.pageX: window.event.clientX + document.body.scrollLeft;
		mouseY = (ns4||ns5)? evt.pageY: window.event.clientY + document.body.scrollTop;
	}
	var tpWd = (ns4)? tooltip.width: (ie4||ie5)? tooltip.clientWidth: tooltip.offsetWidth;
	var tpHt = (ns4)? tooltip.height: (ie4||ie5)? tooltip.clientHeight: tooltip.offsetHeight;
	var winWd = (ns4||ns5)? window.innerWidth-20+window.pageXOffset: document.body.clientWidth+document.body.scrollLeft;
	var winHt = (ns4||ns5)? window.innerHeight-20+window.pageYOffset: document.body.clientHeight+document.body.scrollTop;
	if ((mouseX+offX+tpWd)>winWd) 
		tipcss.left = (ns4)? mouseX-(tpWd+offX): mouseX-(tpWd+offX)+"px";
	else tipcss.left = (ns4)? mouseX+offX: mouseX+offX+"px";
	if ((mouseY+offY+tpHt)>winHt) 
		tipcss.top = (ns4)? winHt-(tpHt+offY): winHt-(tpHt+offY)+"px";
	else tipcss.top = (ns4)? mouseY+offY: mouseY+offY+"px";
	if (!tipFollowMouse) t1=setTimeout("tipcss.visibility='visible'",100);
}

function hideTip() {
	if (!tooltip) return;
	t2=setTimeout("tipcss.visibility='hidden'",100);
	tipOn = false;
}
-->
</script>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" colspan="2" align="center" class="topo">Ações do Web Service</td>
        </tr>
    	<tr>
    		<td height="50" align="center" class="menu" width="172">Transação</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,0)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_trans.asp'">requisicao-transacao (versão 1.1.0)</td>
        </tr>
    	<tr>
    		<td height="50" align="center" class="menu" width="172">Transação</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,0)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_trans1.asp'">requisicao-transacao (versão 1.1.1)</td>
        </tr>
    	<tr>
    		<td height="50" align="center" class="menu" width="172">Transação</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,0)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_trans2.asp'">requisicao-transacao (versão 1.2.0)</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Autorização via TID</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,1)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_aut_tid.asp'">requisicao-autorizacao-tid</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Captura</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,2)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_captura.asp'">requisicao-captura</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Cancelamento</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='submenu';hideTip()" OnClick="alerta_cancelamento();window.location.href='Req_cancel.asp'">requisicao-cancelamento</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Cancelamento</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='submenu';hideTip()" OnClick="alerta_cancelamento();window.location.href='Req_cancel1.asp'">requisicao-cancelamento<br />(Cancelamento parcial - versão 1.2.0)</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Consulta</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,4)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_consulta.asp'">requisicao-consulta</td>
    	</tr>
        <tr>
        	<td height="50" align="center" class="menu" >Consulta</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,4)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_consulta1.asp'">requisicao-consulta<br />(Consulta por pedido - versão 1.2.0)</td>
    	</tr>
        <tr>
        	<td height="50" align="center" class="menu" >Autorização direta</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_tid.asp'">requisicao-tid + requisicao-autorizacao-portador (versão 1.1.0)</td>
        </tr>
        <tr>
        	<td height="50" align="center" class="menu" >Autorização direta</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_tid1.asp'">requisicao-tid + requisicao-autorizacao-portador (versão 1.1.1)</td>
        </tr>
    </table>
	<br />
	<br />
	<table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" colspan="2" align="center" class="topo">Outros</td>
        </tr>
    	<tr>
    		<td height="50" align="center" class="menu" width="172">Logs</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Consulta_xml.asp'">Consulta</td>
        </tr>
    	<tr>
    		<td height="50" align="center" class="menu" width="172">Envio de dados XML</td><td align="center" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7)" onMouseOut="this.className='submenu';hideTip()" OnClick="window.location.href='Req_manual.asp'">Enviar XML</td>
        </tr>
    </table>
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<% Else %>
<script language="javascript">
<!--
function validalogin(){
	if(document.acesscontrol.login.value == ""){
		alert("Insira o usu\u00e1rio !");
		return false;
	}else if(document.acesscontrol.password.value == ""){
		alert("Insira a senha !");
		return false;
	}
	return true;
}
-->
</script>
<body>
	<table width="100%" cellspacing="5">
		<tr>
			<td align="center" width="30%" class="submenugrande">Simulador Web Service Cielo</td><td align="right"><b>eCommerce Cielo</b><br /><a href="Sobre.asp" onmouseover="this.className='linkfundobranco'" onmouseout="this.className='normal'">Sobre o simulador</a></td>
		</tr>
	</table>
	<div id="divCentralizada" align="center">
	<table align="center" width="288" cellspacing="5">
    	<tr height="50">
        	<td align="center" class="topo" colspan="2">Acesso</td>
        </tr>
        <form name="acesscontrol" action="Default.asp" method="post">
    	<tr height="50">
    		<td align="center" class="menu" width="86">Usuário</td><td class="submenu" align="center"><input type="text" name="login" style="size:10px; font-family:Tahoma, Geneva, sans-serif"/></td>
        </tr>
        <tr height="50">
        	<td align="center" class="menu">Senha</td><td class="submenu" align="center"><input type="password" name="password" style="size:10px; font-family:Tahoma, Geneva, sans-serif"/></td>
        </tr>
        <tr height="50">
        	<td align="center" class="topo" colspan="2"><input type="submit" value="Entrar" onclick="return validalogin()"id="button"/></td>
        </tr>
        </form>
    </table>
	</div>
</body>
<% End if %>
</html>
