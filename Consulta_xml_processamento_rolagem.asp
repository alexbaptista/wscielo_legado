<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="stylesheet" type="text/css" href="Template.css" />
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
<body id="bodypesquisa">
<table align="center" width="100%">
<%
If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then

id = Request.QueryString("id")

If id = "2" Then
	caminho = Server.MapPath("Xml\Requisicao-transacao-retorno")
	tipo = "Requisicao-transacao-retorno"
ElseIf id = "3" Then
	caminho = Server.MapPath("Xml\Requisicao-autorizacao-tid-retorno")
	tipo = "Requisicao-autorizacao-tid-retorno"
ElseIf id = "4" Then
	caminho = Server.MapPath("Xml\Requisicao-captura-retorno")
	tipo = "Requisicao-captura-retorno"
ElseIf id = "5" Then
	caminho = Server.MapPath("Xml\Requisicao-cancelamento-retorno")
	tipo = "Requisicao-cancelamento-retorno"
ElseIf id = "6" Then
	caminho = Server.MapPath("Xml\Requisicao-consulta-retorno")
	tipo = "Requisicao-consulta-retorno"
ElseIf id = "7" Then
	caminho = Server.MapPath("Xml\Requisicao-tid-retorno")
	tipo = "Requisicao-tid-retorno"
ElseIf id = "8" Then
	caminho = Server.MapPath("Xml\Requisicao-autorizacao-portador-retorno")
	tipo = "Requisicao-autorizacao-portador-retorno"
End If

set FSO = Server.CreateObject("Scripting.FileSystemObject")
Set pasta = FSO.GetFolder(caminho)
set Rs = Server.CreateObject("ADODB.RecordSet")
Rs.Fields.Append "tid", 200, 255
Rs.Fields.Append "data", 7
Rs.Open

for each file in pasta.Files
	Rs.AddNew
	Rs.Fields("tid").Value = file.Name
	Rs.Fields("data").Value = file.DateLastModified
next

Rs.Sort = "data desc"
Rs.MoveFirst

While Not Rs.EoF
%>
<tr>
	<td align="left" colspan="2" class="submenugrande"><a href="Download.asp?arquivo=Xml/<%= tipo %>/<%= Rs.Fields("tid").Value %>" onmouseover="this.className='linkfundobranco'" onmouseout="this.className='normal'"><%= Rs.Fields("tid").Value %></a></td>
	<td align="center" colspan="2" class="menu">Data/Hora: <%= Rs.Fields("data").Value %></td>
</tr>
<%
Rs.MoveNext
Wend

Rs.Close
Set Rs = Nothing
Set pasta = Nothing
Set FSO = Nothing
%>
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