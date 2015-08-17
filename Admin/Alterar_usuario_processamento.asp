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
SQL = "SELECT * FROM Dados WHERE Usuario = '" & Request.Form("altusuario") & "'"
rs.Open SQL, conn

If (Rs.EOF) Then

	%>
	<body>
	<script language="javascript">
	<!--
	alert(" Login n\u00e3o existente no banco de dados !"); 
	window.location = "Opcoes_usuario.asp";
	-->
	</script>
	</body>
	<%

Else

	SQL = "UPDATE Dados SET Tipo = '" & Request.Form("alttipo") & "', Status = '" & Request.Form("altstatus") & "' WHERE Usuario = '" & Request.Form("altusuario") & "'"
	conn.Execute(SQL)
	conn.close
	
	%>
    <body>
    <script language="javascript">
    <!--
    alert("Login: (\"<%= Request.Form("altusuario") %>\"), teve seus atributos alterados !"); 
    window.location = "Opcoes_usuario.asp";
    -->
    </script>
    </body>
	<%
	
End if

rs.close
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