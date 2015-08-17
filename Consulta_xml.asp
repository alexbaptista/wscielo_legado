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
<% If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then %>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" align="center" class="topo">Tipo de Log</td>
        </tr>
    	<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=2'">Requisicao-transacao</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=3'">Requisicao-autorizacao-tid</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=4'">Requisicao-captura</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=5'">Requisicao-cancelamento</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=6'">Requisicao-consulta</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=7'">Requisicao-tid</a></td>
        </tr>
		<tr>
			<td height="50" align="center" class="submenugrande" onMouseOver="this.className='menu_light'" onMouseOut="this.className='submenugrande'" OnClick="window.location.href='Consulta_xml_processamento.asp?id=8'">Requisicao-autorizacao-portador</a></td>
		</tr>
		<tr>
			<td height="50" align="center" class="topo"><input type="button" value="Voltar" OnClick=window.location.href="Default.asp" id="button"/></td>
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