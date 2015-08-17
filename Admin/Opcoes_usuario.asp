<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="Alex C S Baptista - suporteweb@cielo.com.br" />
	<link rel="stylesheet" type="text/css" href="../Template.css" />
    <link rel="shortcut icon" href="../Imagens/favicon.ico" type="image/x-icon" />
	<title>Simulador WS Cielo</title>
</head>
<% If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then 

usuario = Session("usuario")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.Jet.OLEDB.4.0"
conn.Open Server.MapPath("..\WebServiceCieloAdmin\Banco.mdb")

set rs = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados WHERE Usuario = '" & usuario & "'"
rs.Open SQL, conn

If (rs.EOF) Then

Else
	nome = rs("Nome")
	senha = rs("Senha")	
	tipo = rs("Tipo")
End if
%>
<script type="text/javascript" language="javascript">
<!--
function validasenha(){
	if (document.alterarsenha.senha.value == ""){
		alert("Insira a senha !");
		return false;
	}
	else if(document.alterarsenha.senhanova.value == ""){
		alert("Insira a confirma\u00e7\u00e3o da senha !");
		return false;
	}
	else if(document.alterarsenha.senha.value != document.alterarsenha.senhanova.value){
		alert("As senhas n\u00e3o s\u00e3o iguais !");
		return false;
	}
	return true;
}

function validausuario(){
	if(document.novousuario.newusuario.value == ""){
		alert("Insira um usu\u00e1rio !");
		return false;
	}
	else if(document.novousuario.newnome.value == ""){
		alert("Insira um nome para o usu\u00e1rio !");
		return false;
	}
	else if(document.novousuario.newsenha.value == ""){
		alert("Insira uma senha inicial !");
		return false;
	}
	return true;
}

function confcancel(){
	if(confirm("Deseja excluir a conta ?")){
		return true;
	}
	else{
		return false;
	}
	return false;
}
-->
</script>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Sair.asp">Sair</a></td>
</tr>
</table>
<br />
<%
set bd = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados"
bd.Open SQL, conn
%>
<form name="alterarsenha" action="Alterar_senha_processamento.asp" method="post">
<table align="center" width="576" cellspacing="5">
    <tr>
        <td height="50" colspan="2" align="center" class="topo">Configurações do usuário</td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Usuário</td>
        <td align="center" class="submenu"><%= usuario %></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Nome</td>
        <td align="center" class="submenu"><%= nome %></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Tipo de conta</td>
        <td align="center" class="submenu"><b><%= tipo %></b></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Senha Atual</td>
        <td align="center" class="submenu"><input type="text" value="<%= senha %>" disabled="disabled"/></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Nova senha</td>
        <td align="center" class="submenu"><input type="password" name="senha" maxlength="20"/></td>   	
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Confirmar nova senha</td>
        <td align="center" class="submenu"><input type="password" name="senhanova" maxlength="20"/></td>   	
    </tr>
    <tr>
        <td height="50" align="center" class="topo"><input type="button" value="Voltar" onclick="window.location.href='../Default.asp'" id="button"/></td>
        <td height="50" align="center" class="topo"><input type="submit" value="Confirmar" onclick="return validasenha()"  id="button"/></td>   	
    </tr>
</table>
</form>
<% if tipo = "Administrador" Then %>
<br />
<br />
<table align="center" width="576" cellspacing="5">
    <tr>
        <td height="50" colspan="2" align="center" class="topo">Parâmetros</td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Configurações</td>
        <td align="center" class="submenu"><a href="Config.asp" >Dados de teste (cartão, maquineta e etc)</a></td>
    </tr>
</table>
<br />
<br />
<table align="center" width="576" cellspacing="5">
	<tr>
    	<td height="50" colspan="4" align="center" class="topo">Status dos usuários</td>
    </tr>
<%
While(not bd.EOF)
	If bd("status") = "OK" Then
		Response.Write "<tr><td height='30' align='center' class='menu'>" & bd("usuario") & "</td><td align='center' class='submenu'>" & bd("nome") & "</td><td align='center' class='menu'>" & bd("tipo") & "</td><td align='center' bgcolor='green'><b>" & bd("status") & "</b></td></tr>"
	Else
		Response.Write "<tr><td height='30' align='center' class='menu'>" & bd("usuario") & "</td><td align='center' class='submenu'>" & bd("nome") & "</td><td align='center' class='menu'>" & bd("tipo") & "</td><td align='center' bgcolor='red'><b>" & bd("status") & "</b></td></tr>"
	End if
bd.movenext
Wend
%>
</table>
<br />
<br />
<form name="novousuario" action="Novo_usuario_processamento.asp" method="post">
<table align="center" width="576" cellspacing="5">
    <tr>
        <td height="50" colspan="2" align="center" class="topo">Inclusão de usuário</td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Usuário</td>
        <td align="center" class="submenu"><input type="text" name="newusuario" maxlength="10"/></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Nome</td>
        <td align="center" class="submenu"><input type="text" name="newnome" maxlength="30"/></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Senha inicial</td>
        <td align="center" class="submenu"><input type="text" name="newsenha" value="cielo" maxlength="30"/></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Tipo de conta</td>
        <td align="center" class="submenu"><select name="newtipo"><option value="Padrão">Padrão</option><option value="Administrador">Administrador</option></select></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Status</td>
        <td align="center" class="submenu"><select name="newstatus"><option value="OK">OK</option><option value="Bloqueado">Bloqueado</option></select></td>
    </tr>
    <tr>
        <td height="50" align="center" class="topo" colspan="2"><input type="submit" value="Confirmar" onclick="return validausuario()"  id="button"/></td>   	
    </tr>
</table>
</form>
<%
bd.close

set bd1 = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados"
bd1.Open SQL, conn
%>
<br />
<br />
<form name="alterarusuario" action="Alterar_usuario_processamento.asp" method="post">
<table align="center" width="576" cellspacing="5">
    <tr>
        <td height="50" colspan="2" align="center" class="topo">Alterar/bloquear usuário</td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Usuário</td>
        <td align="center" class="submenu"><select name="altusuario">
        									<%
											While(not bd1.EOF)
                                            	Response.Write "<option value='" & bd1("usuario") & "'>" & bd1("usuario") & " - " & bd1("nome") & "</option>"
                                            bd1.movenext
											Wend
                                            %>
                                            </select></td>
    </tr>
    	<td height="30" align="center" class="menu" width="30%">Tipo de conta</td>
        <td align="center" class="submenu"><select name="alttipo"><option value="Padrão">Padrão</option><option value="Administrador">Administrador</option></select></td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Status</td>
        <td align="center" class="submenu"><select name="altstatus"><option value="OK">OK</option><option value="Bloqueado">Bloqueado</option></select></td>
    </tr>
    <tr>
        <td height="50" align="center" class="topo" colspan="2"><input type="submit" value="Confirmar" id="button"/></td>   	
    </tr>
</table>
</form>
<br  />
<br  />
<%
bd1.close

set bd2 = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados"
bd2.Open SQL, conn
%>
<form name="excluirusuario" action="Exclusao_usuario_processamento.asp" method="post">
<table align="center" width="576" cellspacing="5">
    <tr>
        <td height="50" colspan="2" align="center" class="topo">Exclusão de usuário</td>
    </tr>
    <tr>
    	<td height="30" align="center" class="menu" width="30%">Usuário</td>
        <td align="center" class="submenu"><select name="oldusuario">
        									<%
											While(not bd2.EOF)
                                            	Response.Write "<option value='" & bd2("usuario") & "'>" & bd2("usuario") & " - " &  bd2("nome") & "</option>"
                                            bd2.movenext
											Wend
                                            %>
                                            </select></td>
    </tr>
    <tr>
        <td height="50" align="center" class="topo" colspan="2"><input type="submit" value="Confirmar" id="button" onclick="return confcancel()"/></td>   	
    </tr>
</table>
</form>
<br  />
<% End if %>
</body>
<%
bd2.close
rs.close
conn.close

Set bd = Nothing
Set bd2 = Nothing
Set rs = Nothing
Set conn = Nothing

Else
%>
<body>
	<div id="divCentralizada">
    <p align="center"><a href="../Default.asp" ><img src="../Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<% End if %>
</html>
