<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
id = Request.QueryString("id")
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
<% If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then %>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table align="center" width="576" cellspacing="5">
		<tr>
		<% If id = "2" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-TRANSACAO</td>
		<% ElseIf id = "3" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-AUTORIZACAO-TID</td>
		<% ElseIf id = "4" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-CAPTURA</td>
		<% ElseIf id = "5" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-CANCELAMENTO</td>
		<% ElseIf id = "6" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-CONSULTA</td>
		<% ElseIf id = "7" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-TID</td>
		<% ElseIf id = "8" Then %>
			<td height="50" align="center" colspan="2" class="topo">DADOS DISPONÍVEIS | REQUISICAO-AUTORIZACAO-PORTADOR</td>
		<% End If %>
		</tr>
		<tr>
			<td align="center" colspan="2" class="menu">
			<iframe width="780" height="350" src="Consulta_xml_processamento_rolagem.asp?id=<%= id %>">
				<p>Seu Browser não suporta iframe</p>
			</iframe>
			</td>
		</tr>
		<tr>
			<td height="50" colspan="2" align="center" class="topo"><input type="button" value="Voltar" OnClick=window.location.href="Consulta_xml.asp" id="button"/></td>
		</tr>
	</table>
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<% Else %>
<body>
	<div id="divCentralizada">
    <p align="center"><a href="Default.asp" ><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>