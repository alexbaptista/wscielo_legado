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
	<form name="requisicao_cancelamento" action="Req_cancel_processamento.asp" method="post">
	<table cellspacing="5" align="center" width="576">
    	<tr>
        	<td height="50" colspan="3" align="center" class="topo">CONFIGURAÇÃO DO AMBIENTE</td>
		</tr>
		<tr>
			<td align="center" width="30%" height="50" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='menu';hideTip()">AMBIENTE</td>
			<td align="center" height="50" class="submenu" colspan="2"><% If Session("TEMPambiente") = CBPtestes Then %>
            											<select name="ambiente">
														<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
														<option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
														</select>
                                                       <% Else %>
            											<select name="ambiente">
                                                        <option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
														<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
														</select>                                                                                                        
                                                       <% End if %>
														</td>
		</tr>
		<tr>
			<td height="50" align="center" class="topo"><input type="button" value="Voltar" onclick=window.location.href="Default.asp" id="button"/></td>
			<td height="50" align="center" class="topo" colspan="2"><input type="button" value="Limpar formulário" OnClick="limpar_formulario4()" id="button"/></td>
		</tr>
	</table>
	<br />
	<br />
	<table cellspacing="5" align="center" width="576">
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo" onMouseOver="this.className='menu_light';doTooltip(event,18)" onMouseOut="this.className='topo';hideTip()">REQUISIÇÃO-CANCELAMENTO</td>
		</tr>
		<tr>
        	<td width="30%" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,15)" onMouseOut="this.className='menu';hideTip()">TID</td>
    		<td width="30%" class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,15.1)" onMouseOut="this.className='submenu';hideTip()">TID:</td><td class="menu" colspan="2"><input type="text" name="tid" value="<%= Session("TEMPtid")%>" size="20" maxlength="40"/></td>
        </tr>
    	<tr>
        	<td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='menu';hideTip()">DADOS-EC</td>
    		<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_numero" value="<%= Session("TEMPnumero")%>" size="10" maxlength="20"/></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.2)" onMouseOut="this.className='submenu';hideTip()">Chave:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_chave" value="<%= Session("TEMPchave")%>" size="20" maxlength="100"/></td>
        </tr>
        <tr>
         	<td height="50" colspan="4" align="center" class="topo"><input type="submit" value="Confirmar dados" OnClick="return valida4()" id="button"/></td>
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
    <p align="center"><a href="Default.asp" ><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>