<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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

Set conn = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.Jet.OLEDB.4.0"
conn.Open Server.MapPath("..\WebServiceCieloAdmin\Banco.mdb")

set rs = Server.CreateObject("ADODB.recordset")
SQL = "SELECT * FROM Dados WHERE Usuario = '" & Request.Form("newusuario") & "'"
rs.Open SQL, conn

If (Rs.EOF) Then

	rs.close
	rs.Open "Dados", conn,3,3
	rs.AddNew

	rs("Usuario") = Request.Form("newusuario")
	rs("Nome") = Request.Form("newnome")
	rs("Senha") = Request.Form("newsenha")
	rs("Tipo") = Request.Form("newtipo")
	rs("Status") = Request.Form("newstatus")

	rs.update
	rs.close
	conn.close
	
	%>
    <body>
	<script language="javascript">
	<!--
	alert(" Login: (\"<%= Request.Form("newusuario") %>\") foi criado com sucesso !"); 
	window.location = "Opcoes_usuario.asp";
	-->
	</script>
	</body>
	<%

Else
	
	%>
	<body>
	<script language="javascript">
	<!--
	alert(" Login existente no banco de dados !"); 
	window.location = "Opcoes_usuario.asp";
	-->
	</script>
	</body>
	<%

End if

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