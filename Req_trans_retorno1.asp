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
If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then
	If Session("TEMPnumero") = "" or Session("TEMPchave") = "" or Session("TEMPtid") = "" or Session("TEMPbypage") = "" or Session("TEMPambiente") = "" Then
%>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<h2 align="center">Ops ! Esta página somente poderá ser acessada, após o processamento da requisição</h2>
	<h2 align="center"><a href="Default.asp" class="linkfundobranco">Voltar</a></h2>
</body>
<%
Else
	mensagem = "<?xml version='1.0' encoding='ISO-8859-1'?><requisicao-consulta id='5' versao='1.2.0'><tid>" & Session("TEMPtid") & "</tid><dados-ec><numero>" & Session("TEMPnumero") & "</numero><chave>" & Session("TEMPchave") & "</chave></dados-ec></requisicao-consulta>"
	
	Dim objSrvHTTP,PostData
	Set objSrvHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP.3.0")
	PostData="mensagem=" & mensagem	

	objSrvHTTP.SetOption 2, 13056
	objSrvHTTP.SetTimeouts 15000, 250000, 250000, 250000
	objSrvHTTP.open "POST", Session("TEMPambiente"), false
	objSrvHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
	objSrvHTTP.send trim(PostData)
	sStatus = objSrvHTTP.status
	
	function gravaXML(dado,titulo)
		Dim fs,d
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set d = fs.CreateTextFile(Server.MapPath("Xml\Requisicao-transacao-retorno\" & Session("usuario") &  "-" & titulo  & ".xml"),true)
		d.write(Left(dado,19))
		d.write(" encoding='ISO-8859-1'")
		d.write(Mid(dado,20,Len(dado)-1))
		d.close
	end function
	
	If sStatus = "200" Then

		Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
		MsXml.async = False
		xXml = objSrvHTTP.responseXML.xml
		MsXml.loadXML(xXml)
		Set raiz = MsXml.documentElement
		call gravaXML(xXML,raiz.childNodes.item(0).childNodes.item(0).text)
		%>
        <body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
		<table align="center" width="576" cellspacing="5">
			<tr>
				<td height="50" colspan="4" align="center" class="topo">RETORNO DA TRANSAÇÃO</td>
			</tr>
			<tr>
				<td align="center" class="menu" width="30%">Detalhes:</td>
				<td align="center" class="submenu" colspan="3"><a href="Download.asp?arquivo=Xml/Requisicao-transacao-retorno/<%=Session("usuario")%>-<%=Session("TEMPtid")%>.xml">Download XML</a></td>
			</tr>
			<tr>
				<td align="center" colspan="4" class="menu"><textarea cols="80" rows="18" readonly="readonly"><%= xXml %></textarea></td>
			<tr>
				<td height="50" align="center" class="topo"><input type="button" value="Voltar" OnClick=window.location.href="Default.asp"  id="button"/></td>
				<td height="50" align="center" class="topo" width="33%"><input type="button" value="Autorização-TID" OnClick=window.location.href="Req_aut_tid.asp"  id="button"/></td>
				<td height="50" align="center" class="topo" width="33%"><input type="button" value="Captura" OnClick=window.location.href="Req_captura.asp"  id="button"/></td>
				<td height="50" align="center" class="topo" width="33%"><input type="button" value="Cancelamento" OnClick=window.location.href="Req_cancel.asp"  id="button"/></td>
			</tr>
		</table>
        </body>
		<%
		Set MsXml = Nothing
	Else
	%>
	<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
		<h2 align="center">Ops ! Acho que falhou com a Cielo !</h2>
	</body>
	<%
	
	End if
	
	Set objSrvHTTP = Nothing
End If
Else
%>
<body>
	<div id="divCentralizada">
    <p align="center"><a href="Default.asp" ><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>
