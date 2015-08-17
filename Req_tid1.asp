<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement

'CONFIG.AMBIENTE'

'AMBIENTE CBP'
CBPtestes  = raiz.childNodes.item(0).childNodes.item(0).text
CBPproducao = raiz.childNodes.item(0).childNodes.item(1).text

'BUY PAGE LOJA TESTES'
BPLTESTmaquineta = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(0).text
BPLTESTchave = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(1).text

'BUY PAGE LOJA PRODUCAO'
BPLPRODmaquineta= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(0).text
BPLPRODchave = raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(1).text

Set MsXml = Nothing
%>
<!--#include file="Scripts.js"-->
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
If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then
%>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table cellspacing="5" align="center" width="576">
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo">CONFIGURAÇÃO DO AMBIENTE (AFILIAÇÕES CIELO)</td>
		</tr>
		<tr>
            <td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,1)" onMouseOut="this.className='menu';hideTip()">By Page "Loja"</td>
            <td align="center" class="submenu"><input type="button" value="Usar Testes" onClick="Ambiente_BPL_TESTE_TID()" id="button"/></td>
			<td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='menu';hideTip()">AMBIENTE</td>
			<form name="requisicao_tid" action="Req_tid_processamento1.asp" method="post">
			<td align="center" rowspan="2" class="submenu"><select name="ambiente">
											<option value="<%= CBPtestes %>">QASECOMMERCE-(TESTES)</option>
											<option value="<%= CBPproducao %>">ECOMMERCE-(PRODUÇÃO)</option>
											</select></td>
		</tr>
		<tr>
			<td align="center" class="submenu"><input type="button" value="Usar Produção" onClick="Ambiente_BPL_PRODUCAO_TID()" id="button"/></td>
        </tr>
		<tr>
			<td colspan="2" height="50" align="center" class="topo"><input type="reset" value="Limpar formulário" OnClick="limpar_formulario6()" id="button"/></td>
            <td colspan="2" height="50" align="center" class="topo"><input type="button" value="Voltar" onclick=window.location.href="Default.asp" id="button"/></td>
		</tr>
	</table>
	<br />
	<br />
    <table cellspacing="5" align="center" width="576">
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo" onMouseOver="this.className='menu_light';doTooltip(event,20)" onMouseOut="this.className='topo';hideTip()">REQUISICAO-TID (PASSO 1)</td>
      </tr>
    	<tr>
        	<td width="30%" rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='menu';hideTip()">DADOS-EC</td>
    		<td width="30%" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_numero" size="10" maxlength="20"/></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.2)" onMouseOut="this.className='submenu';hideTip()">Chave:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_chave" size="30" maxlength="100"/></td>
        </tr>
        <tr>
        	<td rowspan="3" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,8)" onMouseOut="this.className='menu';hideTip()">FORMA-PAGAMENTO</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,8.1)" onMouseOut="this.className='submenu';hideTip()">Bandeira:</td>
			<td align="center" class="menu" colspan="2">
			<br />
			<input type="radio" id="0" checked="checked" name="forma_pagamento_bandeira" value="visa" /><img src="Imagens/Visa_2.png" align="middle"/>
            <input type="radio" id="1" name="forma_pagamento_bandeira" value="mastercard" /><img src="Imagens/Mastercard_2.png" align="middle"/>
			<br /><br />
			<input type="radio" id="2" name="forma_pagamento_bandeira" value="elo" /><img src="Imagens/Elo_2.png" align="middle"/>
            <input type="radio" id="3" name="forma_pagamento_bandeira" value="diners" /><img src="Imagens/Diners_2.png" align="middle"/>
			<br /><br />
			<input type="radio" id="4" name="forma_pagamento_bandeira" value="discover" /><img src="Imagens/Discover_2.png" align="middle"/><br /><br /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,20.1)" onMouseOut="this.className='submenu';hideTip()">Produtos:</td><td align="left" class="menu" colspan="2"><input type="radio" name="forma_pagamento_produto" value="1" OnClick="desabilita_parcelado_tid()" checked="checked">1 - Crédito á vista<br />
												<input type="radio" name="forma_pagamento_produto" value="2" OnClick="habilita_parcelado_tid()">2 - Parcelamento Loja<br />
												<input type="radio" name="forma_pagamento_produto" value="3" OnClick="habilita_parcelado_tid()">3 - Parcelamento ADM<br />
            </td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,20.2)" onMouseOut="this.className='submenu';hideTip()">Parcelas:</td><td class="menu" colspan="2"><select name="forma_pagamento_parcelas">
            						<option value="1">1 - Crédito á vista</option>
                                    <option value="2">2 - (02x) parcelas</option>
                                    <option value="3">3 - (03x) parcelas</option>
                                    <option value="4">4 - (04x) parcelas</option>
                                    <option value="5">5 - (05x) parcelas</option>
                                    <option value="6">6 - (06x) parcelas</option>
                                    <option value="7">7 - (07x) parcelas</option>
                                    <option value="8">8 - (08x) parcelas</option>
                                    <option value="9">9 - (09x) parcelas</option>
                                    <option value="10">10 - (10x) parcelas</option>
                                    <option value="11">11 - (11x) parcelas</option>
                                    <option value="12">12 - (12x) parcelas</option></select>
            </td>
		</tr>
        <tr>
         	<td height="50" colspan="4" align="center" class="topo"><input type="submit" value="Confirmar dados" OnClick="return valida6()" id="button"/></td>
        </tr>
	</table>
	</form>
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<%
Else
%>
<body>
	<div id="divCentralizada">
    	<p align="center"><a href="Default.asp" class="linkfundobranco"><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>