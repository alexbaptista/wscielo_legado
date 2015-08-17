<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement
%>
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
	<table cellspacing="5" align="center" width="700">
    	<tr>
        	<td height="50" align="center" class="topo" colspan="3">ENVIO MANUAL</td>
		</tr>
		<tr>
        	<td height="50" align="center" class="menu">ECOMMERCE</td>
            <td align="center" class="submenugrande" colspan="2"><form action="<%= raiz.childNodes.item(0).childNodes.item(1).text %>" method="post"><input type="text" size="60" name="mensagem" />&nbsp;<input type="submit" value="Enviar" id="button3"/></form></td>
        </tr>
		<tr>
        	<td height="50" align="center" class="menu">QASECOMMERCE</td>
            <td align="center" class="submenugrande" colspan="2"><form action="<%= raiz.childNodes.item(0).childNodes.item(0).text %>" method="post"><input type="text" size="60" name="mensagem" />&nbsp;<input type="submit" value="Enviar" id="button3"/></form></td>
        </tr>
		<tr>
			<td height="50" align="center" class="topo"><input type="button" value="Voltar" OnClick="window.location.href='Default.asp'" id="button"/></td>
        	<td height="50" align="center" class="topo" colspan="2">Nota: Inserir o XML todo em uma única linha</td>
		</tr>
	</table>
</body>
<% Else %>
<body>
	<div id="divCentralizada">
    <p align="center"><a href="Default.asp" ><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>