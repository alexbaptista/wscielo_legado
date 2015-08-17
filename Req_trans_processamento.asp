<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Scripts.js"-->
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
	
	Session("TEMPambiente") = Request.Form("ambiente")
	Session("TEMPbypage") = Request.Form("bypage")
	Session("TEMPnumero") = Request.Form("dados_ec_numero")
	Session("TEMPchave") = Request.Form("dados_ec_chave")
	Session("TEMPvalor") = Request.Form("dados_pedido_valor")

	If Session("TEMPambiente") <> "" and Session("TEMPbypage") <> "" and Session("TEMPnumero") <> "" and Session("TEMPchave") <> "" Then

		'REQUISICAO-TRANSACAO'

		'BY PAGE'
		Bpage = Request.Form("bypage")

		'AMBIENTE'
		CBPambiente = Request.Form("ambiente")

		'DADOS-EC'
		DEnumero = Request.Form("dados_ec_numero")
		DEchave = Request.Form("dados_ec_chave")

		'DADOS-PORTADOR'
		DPnumero = Request.Form("dados_portador_numero")
		DPvalidade = Request.Form("dados_portador_validade")
		DPindicador = Request.Form("dados_portador_indicador")
		DPcvv2 = Request.Form("dados_portador_codigo_seguranca")
		DPnome = Request.Form("dados_portador_nome_portador")

		'DADOS-PEDIDO'
		DPnumero2 = Request.Form("dados_pedido_numero")
		DPvalor = Request.Form("dados_pedido_valor")
		DPmoeda = Request.Form("dados_pedido_moeda")
		DPdatahora = Request.Form("dados_pedido_data_hora")
		DPdescricao = Request.Form("dados_pedido_descricao")
		DPidioma = Request.Form("dados_pedido_idioma")

		'FORMA-PAGAMENTO'
		FPbandeira = Request.Form("forma_pagamento_bandeira")
		FPproduto = Request.Form("forma_pagamento_produto")
		FPparcelas = Request.Form("forma_pagamento_parcelas")

		'URL-RETORNO'
		URLretorno = Request.Form("url_retorno")

		'AUTORIZAR'
		AUautorizar = Request.Form("autorizar")

		'CAPTURAR'
		CPcapturar = Request.Form("capturar")

		'CAMPO-LIVRE'
		CLcampolivre = Request.Form("campo_livre")

		'BIN'
		Bbin = Request.Form("bin")

		'XML TRANSACAO REQUISICAO'
		XML_req_trans_loja = "<?xml version='1.0' encoding='ISO-8859-1'?><requisicao-transacao id='1' versao='1.1.0'><dados-ec><numero>" & DEnumero & "</numero><chave>" & DEchave &"</chave></dados-ec><dados-portador><numero>" & DPnumero &"</numero><validade>" & DPvalidade & "</validade><indicador>" & DPindicador & "</indicador><codigo-seguranca>" & DPcvv2 & "</codigo-seguranca><nome-portador>" & DPnome & "</nome-portador></dados-portador><dados-pedido><numero>" & DPnumero2 & "</numero><valor>" & DPvalor & "</valor><moeda>" & DPmoeda & "</moeda><data-hora>" & DPdatahora & "</data-hora><idioma>" & DPidioma & "</idioma></dados-pedido><forma-pagamento><bandeira>" & FPbandeira & "</bandeira><produto>" & FPproduto & "</produto><parcelas>" & FPparcelas & "</parcelas></forma-pagamento><url-retorno>" & URLretorno & "</url-retorno><autorizar>" & AUautorizar & "</autorizar><capturar>" & CPcapturar & "</capturar><campo-livre>" & CLcampolivre & "</campo-livre><bin>" & Bbin & "</bin></requisicao-transacao>"

		XML_req_trans_cielo = "<?xml version='1.0' encoding='ISO-8859-1'?><requisicao-transacao id='1' versao='1.1.0'><dados-ec><numero>" & DEnumero & "</numero><chave>" & DEchave &"</chave></dados-ec><dados-pedido><numero>" & DPnumero2 & "</numero><valor>" & DPvalor & "</valor><moeda>" & DPmoeda & "</moeda><data-hora>" & DPdatahora & "</data-hora><idioma>" & DPidioma & "</idioma></dados-pedido><forma-pagamento><bandeira>" & FPbandeira & "</bandeira><produto>" & FPproduto & "</produto><parcelas>" & FPparcelas & "</parcelas></forma-pagamento><url-retorno>" & URLretorno & "</url-retorno><autorizar>" & AUautorizar & "</autorizar><capturar>" & CPcapturar & "</capturar><campo-livre>" & CLcampolivre & "</campo-livre></requisicao-transacao>"
%>
	<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table align="center" cellspacing="5" width="576">
		<tr height="50">
			<td rowspan="2" align="center" class="topo" width="30%"><img width="65%" src="Imagens/Xml_icon.png" /></td>
			<td align="center" class="menu" width="30%">BUY PAGE</td>
			<td align="center" class="menu" colspan="2">AMBIENTE</td>
		</tr>
		<tr>
			<td align="center" class="submenu"><%= Bpage %></td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= CBPambiente %>" /></td>
		</tr>
		<%If Bpage = "loja" Then%>
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo">CONFIRMAÇÃO "REQUISICAO-TRANSACAO" ?</td>
		</tr>
    	<tr>
        	<td rowspan="2" align="center" class="menu">DADOS-EC</td>
    		<td class="submenu">Número:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DEnumero %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Chave:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DEchave %>" /></td>
        </tr>
        <tr>
        	<td rowspan="5" align="center" class="menu">DADOS-PORTADOR<br />(buy page Loja)</td>
            <td class="submenu">Número:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPnumero %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Validade:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPvalidade %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Indicador:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPindicador %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">CVV2:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPcvv2 %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Nome do portador:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPnome %>" /></td>
        </tr>
        <tr>
        	<td rowspan="6" align="center" class="menu">DADOS-PEDIDO</td>
            <td class="submenu">Número:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPnumero2 %>" /></td>
        </tr>
        	<td class="submenu">Valor:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPvalor %>" /></td>
        </tr>
        </tr>
        	<td class="submenu">Moeda:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPmoeda %>" /></td>
        </tr>
        </tr>
        	<td class="submenu">Data e Hora:</td>
			<td align="center"><%= DPdatahora %></td>
        </tr>
        <tr>
        	<td class="submenu">Descrição:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPdescricao %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Idioma:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPidioma %>" /></td>
        </tr>
        <tr>
        	<td rowspan="3" align="center" class="menu">FORMA-PAGAMENTO</td>
            <td class="submenu">Bandeira:</td>
			<td align="center"><% If FPbandeira = "visa" Then %><img src="Imagens/Visa_2.png" align="middle"/><% Elseif FPbandeira = "mastercard" Then %><img src="Imagens/Mastercard_2.png" align="middle"/><% Elseif FPbandeira = "elo" Then %><img src="Imagens/Elo_2.png" align="middle"/><% End If %></td>
        </tr>
        <tr>
        	<td class="submenu">Produtos:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= FPproduto %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Parcelas:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= FPparcelas %>" /></td>
		</tr>
         <tr>
         	<td align="center" class="menu">URL-RETORNO</td>
            <td class="submenu">URL:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= URLretorno %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">AUTORIZAR</td>
            <td class="submenu">Autorizar:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= AUautorizar %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">CAPTURAR</td>
            <td class="submenu">Capturar?:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= CPcapturar %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">CAMPO-LIVRE</td>
            <td class="submenu">campo-livre:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= CLcampolivre %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">BIN</td>
            <td class="submenu">bin:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= Bbin %>" /></td>
         </tr>
         <tr height="50">
			<td align="center" class="topo">XML:</td>
			<td align="center" class="topo"><input type="text" readonly="readonly" size="20" value="<%= XML_req_trans_loja %>" /></td>
         	<form name="transacao_requisicao_cielo" action="Req_trans_processamento21.asp" method="post"><input type="hidden" name="ambiente" value="<%= CBPambiente %>" /><input type="hidden" name="mensagem" value="<%= XML_req_trans_loja %>" /><input type="hidden" name="bypage" value="<%= Bpage %>" />
			<td align="center" class="topo"><input type="submit" value="Enviar ?"  id="button"/></td>
			</form>
         </tr>
    </table>
	<br />
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<% Elseif Bpage = "Cielo" Then %>
		<tr>
        	<td height="50" colspan="4" align="center" class="topo">CONFIRMAÇÃO "REQUISICAO-TRANSACAO" ?</td>
		</tr>
    	<tr>
        	<td rowspan="2" align="center" class="menu">DADOS-EC</td>
    		<td class="submenu">Número:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DEnumero %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Chave:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DEchave %>" /></td>
        </tr>
        <tr>
        	<td rowspan="6" align="center" class="menu">DADOS-PEDIDO</td>
            <td class="submenu">Número:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPnumero2 %>" /></td>
        </tr>
		<tr>
        	<td class="submenu">Valor:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPvalor %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Moeda:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPmoeda %>" /></td>
        </tr>
        </tr>
        	<td class="submenu">Data e Hora:</td>
			<td align="center"><%= DPdatahora %></td>
        </tr>
        <tr>
        	<td class="submenu">Descrição:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPdescricao %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Idioma:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= DPidioma %>" /></td>
        </tr>
        <tr>
        	<td rowspan="3" align="center" class="menu">FORMA-PAGAMENTO</td>
            <td class="submenu">Bandeira:</td>
			<td align="center"><% If FPbandeira = "visa" Then %><img src="Imagens/Visa_2.png" align="middle"/><% Elseif FPbandeira = "mastercard" Then %><img src="Imagens/Mastercard_2.png" align="middle"/><% Elseif FPbandeira = "elo" Then %><img src="Imagens/Elo_2.png" align="middle"/><% End If %></td>
        </tr>
        <tr>
        	<td class="submenu">Produtos:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= FPproduto %>" /></td>
        </tr>
        <tr>
        	<td class="submenu">Parcelas:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= FPparcelas %>" /></td>
		</tr>
         <tr>
         	<td align="center" class="menu">URL-RETORNO</td>
            <td class="submenu">URL:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= URLretorno %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">AUTORIZAR</td>
            <td class="submenu">Autorizar:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= AUautorizar %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">CAPTURAR</td>
            <td class="submenu">Capturar?:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= CPcapturar %>" /></td>
         </tr>
         <tr>
         	<td align="center" class="menu">CAMPO-LIVRE</td>
            <td class="submenu">campo-livre:</td>
			<td align="center"><input type="text" size="30" readonly="readonly" value="<%= CLcampolivre %>" /></td>
         </tr>
         <tr height="50">
		 	<td align="center" class="topo">XML:</td>
			<td align="center" class="topo"><input type="text" readonly="readonly" size="20" value="<%= XML_req_trans_cielo %>" /></td>
			<form name="transacao_requisicao_cielo" action="Req_trans_processamento21.asp" method="post" ><input type="hidden" name="mensagem" value="<%= XML_req_trans_cielo %>" /><input type="hidden" name="ambiente" value="<%= CBPambiente %>" /><input type="hidden" name="bypage" value="<%= Bpage %>" />
			<td align="center" class="topo"><input type="submit" value="Enviar ?" id="button"/></td>
		 	</form>
         </tr>
    </table>
	<br />
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<%
	End If
Else
%>
<body>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande" width="30%">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
		<h2 align="center">Ops ! Esta página somente poderá ser acessada, após a escolha dos parâmetros da requisição</h2>
		<h2 align="center"><a href="Req_trans.asp" class="linkfundobranco">Voltar</a></h2>
	</body>
<%
End If
Else
%>
<body>
	<div id="divCentralizada">
    	<p align="center"><a href="Default.asp" class="linkfundobranco"><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
</body>
<%
End If
%>
</html>
