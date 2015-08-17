<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Function FormataData(Data)
	If Data <> "" Then FormataData = Right("0" & DatePart("d", Data),2) & "." & Right("0" & DatePart("m", Data),2) & "." & DatePart("yyyy", Data)
End Function

ambiente = Request.Form("ambiente")
tid = Request.Form("tid")
numero = Request.Form("dados_ec_numero")
chave = Request.Form("dados_ec_chave")

DPnumero = Request.Form("dados_cartao_numero")
DPvalidade = Request.Form("dados_cartao_validade")
DPindicador = Request.Form("dados_cartao_indicador")
DPcvv2 = Request.Form("dados_cartao_codigo_seguranca")
DPnome = Request.Form("dados_cartao_nome_portador")

DPnumero2 = Request.Form("dados_pedido_numero")
DPvalor = Request.Form("dados_pedido_valor")
Session("TEMPvalor") = DPvalor
DPmoeda = Request.Form("dados_pedido_moeda")
DPdatahora = Request.Form("dados_pedido_data_hora")
DPdescricao = Request.Form("dados_pedido_descricao")
DPidioma = Request.Form("dados_pedido_idioma")

FPbandeira = Request.Form("forma_pagamento_bandeira")
FPproduto = Request.Form("forma_pagamento_produto")
FPparcelas = Request.Form("forma_pagamento_parcelas")

CPcapturar = Request.Form("capturar_automaticamente")

CLcampolivre = Request.Form("campo_livre")

mensagem = "<?xml version='1.0' encoding='ISO-8859-1'?><requisicao-autorizacao-portador id='7' versao='1.1.0'><tid>" & tid & "</tid><dados-ec><numero>" & numero & "</numero><chave>" & chave & "</chave></dados-ec><dados-cartao><numero>" & DPnumero & "</numero><validade>" & DPvalidade & "</validade><indicador>" & DPindicador & "</indicador><codigo-seguranca>" & DPcvv2 & "</codigo-seguranca><nome-portador>" & DPnome & "</nome-portador></dados-cartao><dados-pedido><numero>" & DPnumero2 & "</numero><valor>" & DPvalor & "</valor><moeda>" & DPmoeda & "</moeda><data-hora>" & DPdatahora & "</data-hora><descricao>" & DPdescricao & "</descricao><idioma>" & DPidioma & "</idioma></dados-pedido><forma-pagamento><bandeira>" & FPbandeira & "</bandeira><produto>" & FPproduto & "</produto><parcelas>" & FPparcelas & "</parcelas></forma-pagamento><capturar-automaticamente>" & CPcapturar & "</capturar-automaticamente><campo-livre>" & CLcampolivre & "</campo-livre></requisicao-autorizacao-portador>"
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
<%
If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then
If ambiente = "" and tid = "" and numero = "" and chave = "" Then
%>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<h2 align="center">Ops ! Esta página somente poderá ser acessada, após o processamento da autorização direta portador!</h2>
	<h2 align="center"><a href="Req_tid.asp" class="linkfundobranco">Voltar</a></h2>
</body>
<%
Else

	Dim objSrvHTTP,PostData
	Set objSrvHTTP = Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
	PostData="mensagem=" & mensagem			
	
	objSrvHTTP.SetOption 2, 13056
	objSrvHTTP.SetTimeouts 15000, 250000, 250000, 250000
	objSrvHTTP.open "POST", ambiente, false
	objSrvHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
	objSrvHTTP.send trim(PostData)
	sStatus = objSrvHTTP.status

	function gravaXml(dado,titulo)
		Dim fs,d
		Set fs = CreateObject("Scripting.FileSystemObject")
		Set d = fs.CreateTextFile(Server.MapPath("Xml\Requisicao-autorizacao-portador-retorno\" & Session("usuario") &  "-" & titulo  & ".xml"),true)
		d.write(Left(dado,19))
		d.write(" encoding='ISO-8859-1'")
		d.write(Mid(dado,20,Len(dado)-1))
		d.close
	end function
	
	If sStatus = "200" Then
	
		Set MsXml = Server.CreateObject("Msxml2.DOMDocument.4.0")
		MsXml.async = False
		xXml = objSrvHTTP.responseXML.xml
		MsXml.loadXML(xXml)
		Set raiz = MsXml.documentElement

		If raiz.NodeName = "erro" Then
			HoraErro = "H" & Left(time,2) & "." & Mid(time,4,2) & "." & Mid(time,7,2)
			DataErro = FormataData(date)
			NameXMLerro = "Erro-" &  raiz.childNodes.item(0).childNodes.item(0).text & "-" & numero & "-" & DataErro & "-" & HoraErro
			call gravaXml(xXml,NameXMLerro)
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
				<td height="50" colspan="3" align="center" class="topo">RETORNO AUTORIZAÇÃO PORTADOR | ERRO</td>
			</tr>
			<tr height="50">
				<td align="center" class="menu" width="30%">Detalhes:</td>
				<td align="center" class="submenugrande" colspan="2"><a href="Download.asp?arquivo=Xml/Requisicao-autorizacao-portador-retorno/<%= Session("usuario") %>-<%= NameXMLerro %>.xml">Download XML</a></td>
			</tr>
			<tr height="50">
				<td align="center" class="menu">Código:</td>
				<td align="center" class="submenugrande" colspan="2"><%= raiz.childNodes.item(0).childNodes.item(0).text%></td>
			</tr>
			<tr height="50">
				<td align="center" class="menu">Mensagem:</td>
				<td align="center" class="submenugrande" colspan="2"><%= raiz.childNodes.item(1).childNodes.item(0).text%></td>
			</tr>
			<tr>
				<td height="50" align="center" colspan="3" class="topo"><input type="button" value="Voltar e fazer uma nova requisição ?" OnClick=window.location.href="Default.asp" id="button2"/></td>
			</tr>
		</table>
        </body>
		<%
		Else
			
			Session("TEMPtid") = raiz.childNodes.item(0).childNodes.item(0).text		
			call gravaXml(xXml,raiz.childNodes.item(0).childNodes.item(0).text)
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
				<td height="50" colspan="3" align="center" class="topo">RETORNO AUTORIZAÇÃO PORTADOR</td>
			</tr>
			<tr>
				<td align="center" class="menu" width="30%">Detalhes:</td>
				<td align="center" class="submenu" colspan="2"><a href="Download.asp?arquivo=Xml/Requisicao-autorizacao-portador-retorno/<%= Session("usuario") %>-<%= tid %>.xml" >Download XML</a></td>
			</tr>
			<tr>
				<td align="center" colspan="3" class="menu"><textarea cols="80" rows="18" readonly="readonly"><%= xXml %></textarea></td>
			<tr>
				<td height="50" align="center" class="topo"><input type="button" value="Voltar" OnClick=window.location.href="Default.asp" id="button"/></td>
				<td height="50" align="center" class="topo" width="50%"><input type="button" value="Captura" OnClick=window.location.href="Req_captura.asp" id="button"/></td>
				<td height="50" align="center" class="topo" width="50%"><input type="button" value="Cancelamento" OnClick=window.location.href="Req_cancel.asp" id="button"/></td>
			</tr>
		</table>
        </body>
		<%
		End if
	
		Set MsXml = Nothing
	
	Else%>
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
End if
Else
%>
<body>
	<div id="divCentralizada">
    <p align="center"><a href="Default.asp" ><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>