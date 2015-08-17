<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("..\WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement
%>
<!--#include file = "Scripts.js" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
	<link rel="stylesheet" type="text/css" href="../Template.css" />
    <link rel="shortcut icon" href="../Imagens/favicon.ico" type="image/x-icon" />
	<title>Simulador WS Cielo</title>
</head>
<%
If Session("login") = "suporteweb" and Session("password") = "passw0rd" and Session("tipo") = "Administrador" Then
%>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Sair.asp">Sair</a> | <a href="Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
    <form name="config" action="Config_processamento.asp" method="post">
	<table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" align="center" class="topo" colspan="3">Configurações</td>
        </tr>
    	<tr>
        	<td height="30" align="center" class="menu" colspan="3">Ambiente Cielo</td>
        </tr>
    	<tr>
    		<td align="center" class="menu" width="40%">Testes</td><td align="center"><input type="text" size="40" name="CBPtestes" disabled="disabled" value="<%= raiz.childNodes.item(0).childNodes.item(0).childNodes.item(0).text %>" /></td><td align="center" width="20%"><input type="button" value="Desbloq / Alterar" onClick="unlock_1()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Produção</td><td align="center"><input type="text" size="40" name="CBPproducao" disabled="disabled" value="<%= raiz.childNodes.item(0).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_2()" id="button"/></td>
        </tr>
    	<tr>
        	<td height="30" align="center" class="menu" colspan="3">Buy Page Cielo (testes)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Número</td><td align="center"><input type="text" size="40" name="BPCTESTmaquineta" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_3()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Chave</td><td align="center"><input type="text" size="40" name="BPCTESTchave" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).childNodes.item(1).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_4()" id="button"/></td>
        </tr>
    	<tr>
        	<td height="30" align="center" class="menu" colspan="3">Buy Page Cielo (produção)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Número</td><td align="center"><input type="text" size="40" name="BPCPRODmaquineta" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_5()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Chave</td><td align="center"><input type="text" size="40" name="BPCPRODchave" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_6()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Buy Page Loja (testes)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Número</td><td align="center"><input type="text" size="40" name="BPLTESTmaquineta" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_7()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Chave</td><td align="center"><input type="text" size="40" name="BPLTESTchave" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(1).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_8()" id="button"/></td>
        </tr>
    	<tr>
        	<td height="30" align="center" class="menu" colspan="3">Buy Page Loja (produção)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Número</td><td align="center"><input type="text" size="40" name="BPLPRODmaquineta" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_9()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Chave</td><td align="center"><input type="text" size="40" name="BPLPRODchave" disabled="disabled" value="<%= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(1).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_10()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (Visa)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDvisa" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(0).childNodes.item(0).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_11()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDvisa" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(0).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_12()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (MasterCard)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDmaster" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(1).childNodes.item(0).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_13()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDmaster" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(1).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_14()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (Elo)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDelo" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(2).childNodes.item(0).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_15()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDelo" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(2).childNodes.item(1).childNodes.item(0).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_16()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (Diners)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDdiners" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(6).childNodes.item(0).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_20()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDdiners" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(6).childNodes.item(1).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_21()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (Discover)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDdiscover" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(7).childNodes.item(0).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_22()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDdiscover" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(7).childNodes.item(1).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_23()" id="button"/></td>
        </tr>
       <tr>
        	<td height="30" align="center" class="menu" colspan="3">Cartão de testes (Amex)</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Autenticado</td><td align="center"><input type="text" size="40" name="AUTCARDamex" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(8).childNodes.item(0).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_24()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Não Autenticado</td><td align="center"><input type="text" size="40" name="CARDamex" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(8).childNodes.item(1).childNodes.item(0).text%>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_25()" id="button"/></td>
        </tr>
        <tr>
        	<td height="30" align="center" class="menu" colspan="3">Dados teste do portador</td>
        </tr>
    	<tr>
    		<td align="center" class="menu">Nome do portador</td><td align="center"><input type="text" size="40" name="CARDholder" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(3).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_17()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">Validade</td><td align="center"><input type="text" size="40" name="CARDvalidade" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(4).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_18()" id="button"/></td>
        </tr>
        <tr>
        	<td align="center" class="menu">CVV2</td><td align="center"><input type="text" size="40" name="CARDcvv2" disabled="disabled" value="<%= raiz.childNodes.item(2).childNodes.item(5).text %>" /></td><td align="center"><input type="button" value="Desbloq / Alterar" onClick="unlock_19()" id="button"/></td>
        </tr>
    	<tr>
			<td height="50" align="center" class="topo" colspan="2"><input type="submit" value="Confirmar Alterações ?" onClick="return valida8()" id="button2"/></td>
        	<td height="50" align="center" class="topo" colspan="1"><input type="button" value="voltar!" onclick=window.location.href="../Default.asp" id="button3"/></td>
        </tr>
    </table>
    <input type="hidden" name="ID" value="xml" />
    </form>
	<br />
</body>
<%
Else
%>
<body>
	<div id="divCentralizada">
    	<p align="center"><a href="../Default.asp" class="linkfundobranco"><img src="../Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if 
Set MsXml = Nothing
%>
</html>
