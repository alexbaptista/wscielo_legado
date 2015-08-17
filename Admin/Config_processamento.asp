<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("..\WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement

CBPtestes	=  Request.Form("CBPtestes")
CBPproducao	=  Request.Form("CBPproducao")

BPCTESTmaquineta	= Request.Form("BPCTESTmaquineta")
BPCTESTchave		= Request.Form("BPCTESTchave")

BPCPRODmaquineta	= Request.Form("BPCPRODmaquineta")
BPCPRODchave		= Request.Form("BPCPRODchave")

BPLTESTmaquineta	= Request.Form("BPLTESTmaquineta")
BPLTESTchave		= Request.Form("BPLTESTchave")

BPLPRODmaquineta	= Request.Form("BPLPRODmaquineta")
BPLPRODchave		= Request.Form("BPLPRODchave")

AUTCARDvisa			= Request.Form("AUTCARDvisa")
CARDvisa			= Request.Form("CARDvisa")

AUTCARDmaster		= Request.Form("AUTCARDmaster")
CARDmaster			= Request.Form("CARDmaster")

AUTCARDelo			= Request.Form("AUTCARDelo")
CARDelo				= Request.Form("CARDelo")

AUTCARDdiners		= Request.Form("AUTCARDdiners")
CARDdiners				= Request.Form("CARDdiners")

AUTCARDdiscover			= Request.Form("AUTCARDdiscover")
CARDdiscover				= Request.Form("CARDdiscover")

AUTCARDamex			= Request.Form("AUTCARDamex")
CARDamex				= Request.Form("CARDamex")

CARDholder			= Request.Form("CARDholder")
CARDvalidade		= Request.Form("CARDvalidade")
CARDcvv2			= Request.Form("CARDcvv2")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
    <link rel="shortcut icon" href="../Imagens/favicon.ico" type="image/x-icon" />
	<title>Simulador WS Cielo</title>
</head>
<%
If Session("login") = "suporteweb" and Session("password") = "passw0rd" and Session("tipo") = "Administrador" Then

	If Request.Form("ID") = "" Then
	%>
	<body>
		<h2 align="center">Ops ! Esta página é usada somente para processamento da configuração !</h2>
		<h2 align="center"><a href="Config.asp" class="linkfundobranco">Voltar</a></h2>
	</body>
	<%
	Else
	
	xml_config = "<?xml version='1.0' encoding='utf-8'?><configuracao><ambiente><testes>" & CBPtestes & "</testes><producao>" & CBPproducao & "</producao></ambiente><afiliacao><testes><buypage><cielo><numero>" & BPCTESTmaquineta & "</numero><chave>" & BPCTESTchave & "</chave></cielo><loja><numero>" & BPLTESTmaquineta & "</numero><chave>" & BPLTESTchave & "</chave></loja></buypage></testes><producao><buypage><cielo><numero>" & BPCPRODmaquineta & "</numero><chave>" & BPCPRODchave & "</chave></cielo><loja><numero>" & BPLPRODmaquineta & "</numero><chave>" & BPLPRODchave & "</chave></loja></buypage></producao></afiliacao><cartao><visa><autenticado><numero>" & AUTCARDvisa & "</numero></autenticado><nao_autenticado><numero>" & CARDvisa & "</numero></nao_autenticado></visa><mastercard><autenticado><numero>" & AUTCARDmaster & "</numero></autenticado><nao_autenticado><numero>" & CARDmaster & "</numero></nao_autenticado></mastercard><elo><autenticado><numero>" & AUTCARDelo & "</numero></autenticado><nao_autenticado><numero>" & CARDelo & "</numero></nao_autenticado></elo><nome_portador>" & CARDholder & "</nome_portador><validade>" & CARDvalidade & "</validade><cvv2>" & CARDcvv2 & "</cvv2><diners><autenticado><numero>" & AUTCARDdiners & "</numero></autenticado><nao_autenticado><numero>" & CARDdiners & "</numero></nao_autenticado></diners><discover><autenticado><numero>" & AUTCARDdiscover & "</numero></autenticado><nao_autenticado><numero>" & CARDdiscover & "</numero></nao_autenticado></discover><amex><autenticado><numero>" & AUTCARDamex & "</numero></autenticado><nao_autenticado><numero>" & CARDamex & "</numero></nao_autenticado></amex></cartao></configuracao>"
	
	Dim fs,d
	Set fs = CreateObject("Scripting.FileSystemObject")
	Set d = fs.CreateTextFile(Server.MapPath("..\WebServiceCieloAdmin\Config.xml"),true)
	d.write(xml_config)
	d.close
	%>
    <body>
    <script language="javascript">
	<!--
	alert('Dados alterados com sucesso !');
	window.location = "Config.asp";
	-->
	</script>
    </body>
    <%
	End If
Else
%>
<body>
	<div id="divCentralizada">
    	<p align="center"><a href="../Default.asp" class="linkfundobranco"><img src="../Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<%
End if 
Set MsXml = Nothing
%>
</html>
