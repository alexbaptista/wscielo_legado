<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Function FormataData(Data)
	If Data <> "" Then FormataData = Right("0" & DatePart("d", Data),2) & "." & Right("0" & DatePart("m", Data),2) & "." & DatePart("yyyy", Data)
End Function

If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then

ambiente = Request.Form("ambiente")
mensagem = Request.Form("mensagem")
bypage = Request.Form("bypage")

If ambiente <> "" and mensagem <> "" and bypage <> "" Then
	
	Dim objSrvHTTP,PostData
	Set objSrvHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
	PostData="mensagem=" & mensagem			

	objSrvHTTP.SetOption 2, 13056
	objSrvHTTP.SetTimeouts 15000, 250000, 250000, 250000
	objSrvHTTP.open "POST", ambiente, false
	objSrvHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
	objSrvHTTP.setOption(SXH_OPTION_SELECT_CLIENT_SSL_CERT) = "WebServiceCieloAdmin\Ssl\VeriSignClass3PublicPrimaryCertificationAuthority-G5.crt" 
	objSrvHTTP.send trim(PostData)
	sStatus = objSrvHTTP.status

	function gravaXml(dado,titulo)
		Dim fs,d
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set d = fs.CreateTextFile(Server.MapPath("Xml\Requisicao-transacao-retorno\" & Session("usuario") &  "-" & titulo  & ".xml"),true)
		d.write(Left(dado,19))
		d.write(" encoding='ISO-8859-1'")
		d.write(Mid(dado,20,Len(dado)-1))
		d.close
	end function

	If sStatus = "200" Then
		
		Set MsXml = Server.CreateObject("Msxml2.DOMDocument.4.0")
		Set objresposta = Server.CreateObject("Msxml2.DOMDocument.4.0")
		Set  varUrlAuth = Server.CreateObject("Msxml2.DOMDocument.4.0")
		MsXml.async = False
		objresposta.async = False
		varUrlAuth.async = False
		xXml = objSrvHTTP.responseXML.xml
		MsXml.loadXML(xXml)
		Set raiz = MsXml.documentElement
		
		If raiz.NodeName = "erro" Then
		
			HoraErro = "H" & Left(time,2) & "." & Mid(time,4,2) & "." & Mid(time,7,2)
			DataErro = FormataData(date)
			NameXMLerro = "Erro-" &  raiz.childNodes.item(0).childNodes.item(0).text & "-" & Session("TEMPnumero") & "-" & DataErro & "-" & HoraErro
			call gravaXml(xXml,NameXMLerro)
			
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
        <body>
			<table width="100%" cellspacing="5">
			<tr>
				<td align="center" width="30%" class="submenugrande">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
			</tr>
			</table>
			<br />
			<table align="center" width="576" cellspacing="5">
				<tr>
					<td height="50" colspan="3" align="center" class="topo">RETORNO DA REQUISIÇÃO | ERRO</td>
				</tr>
				<tr>
					<td align="center" width="30%" height="50" class="menu">Detalhes:</td>
					<td align="center" class="submenugrande" colspan="2"><a href="Download.asp?arquivo=Xml\Requisicao-transacao-retorno\<%= Session("usuario")%>-<%= NameXMLerro %>.xml">Download XML</a></td>
				</tr>
				<tr>
					<td align="center" class="menu" height="50">Código:</td>
					<td align="center" class="submenugrande" colspan="2"><%= raiz.childNodes.item(0).childNodes.item(0).text%></td>
				</tr>
				<tr>
					<td align="center" class="menu" height="50">Mensagem:</td>
					<td align="center" class="submenugrande" colspan="2"><%= raiz.childNodes.item(1).childNodes.item(0).text%></td>
				</tr>
				<tr>
					<td height="50" align="center" colspan="3" class="topo"><input type="button" value="Voltar e fazer uma nova requisição ?" OnClick=window.location.href="Default.asp"  id="button2"/></td>
				</tr>
			</table>
        </body>
        </html>
<%
		Else	
			
			Session("TEMPtid") = raiz.childNodes.item(0).childNodes.item(0).text
				
			Set objresposta = raiz.getElementsByTagName("*")
			
			For i = 0 to (objresposta.length-1)		
				If objresposta.item(i).NodeName = "url-autenticacao" Then
					varUrlAuth = objresposta.item(i).text
					varUrlAuthExiste = "sim"
				End If
			Next
			
			If varUrlAuthExiste = "sim" Then			
%>
         <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
 			<link rel="shortcut icon" href="Imagens/favicon.ico" type="image/x-icon" />
			<title>Simulador WS Cielo</title>
		</head>
		<body OnLoad=window.location.href="<%= varUrlAuth %>">
        <center>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="500" height="500">
		  <param name="movie" value="Imagens/Processando.swf" />
		  <param name="quality" value="high" />
		  <param name="wmode" value="opaque" />
		  <embed src="Imagens/Processando.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="500" height="500"></embed>
	    </object>
        </center>
		</body>
        </html>
<%   Else %>
         <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
 			<link rel="shortcut icon" href="Imagens/favicon.ico" type="image/x-icon" />
			<title>Simulador WS Cielo</title>
		</head>
		<body OnLoad=window.location.href="Req_trans_retorno2.asp">
        <center>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="500" height="500">
		  <param name="movie" value="Imagens/Processando.swf" />
		  <param name="quality" value="high" />
		  <param name="wmode" value="opaque" />
		  <embed src="Imagens/Processando.swf" quality="high" wmode="opaque" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="500" height="500"></embed>
	    </object>
        </center>
		</body>
        </html>
<%    End if
		
		End if
		
		Set varUrlAuth = Nothing
		Set objresposta = Nothing
		Set MsXml = Nothing
			
	Else
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
	<body>
		<table width="100%" cellspacing="5">
		<tr>
			<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
		</tr>
		</table>
		<br />
		<h2 align="center">Ops ! Acho que falhou com a Cielo !</h2>
	</body>
    </html>
<%
	End if
	Set objSrvHTTP = Nothing
Else
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
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<h2 align="center">Ops ! Esta página é usada somente para envio da requisição !</h2>
	<h2 align="center"><a href="Default.asp" class="linkfundobranco">Voltar</a></h2>
</body>
</html>
<%
End if
Else
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
<body>
	<div id="divCentralizada">
    	<p align="center"><a href="Default.asp" class="linkfundobranco"><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
</html>
<% End if %>
