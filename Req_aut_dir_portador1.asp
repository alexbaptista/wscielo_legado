<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
RANDOMIZE
max = 1000
min = 1
aleatory = min+CInt(RND()*(max-min))

Function FormataData(Data)
	If Data <> "" Then FormataData = DatePart("yyyy", Data) & "-" & Right("0" & DatePart("m", Data),2) & "-" & Right("0" & DatePart("d", Data),2)
End Function

Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement

'CARTOES DE TESTE'

'VISA'
AUTCARDvisa = raiz.childNodes.item(2).childNodes.item(0).childNodes.item(0).childNodes.item(0).text
CARDvisa = raiz.childNodes.item(2).childNodes.item(0).childNodes.item(1).childNodes.item(0).text

'MASTERCARD'
AUTCARDmaster = raiz.childNodes.item(2).childNodes.item(1).childNodes.item(0).childNodes.item(0).text
CARDmaster = raiz.childNodes.item(2).childNodes.item(1).childNodes.item(1).childNodes.item(0).text

'ELO'
AUTCARDelo = raiz.childNodes.item(2).childNodes.item(2).childNodes.item(0).childNodes.item(0).text
CARDelo = raiz.childNodes.item(2).childNodes.item(2).childNodes.item(1).childNodes.item(0).text

'DINERS'
AUTCARDdiners = raiz.childNodes.item(2).childNodes.item(6).childNodes.item(0).childNodes.item(0).text
CARDdiners = raiz.childNodes.item(2).childNodes.item(6).childNodes.item(1).childNodes.item(0).text

'DISCOVER'
AUTCARDdiscover = raiz.childNodes.item(2).childNodes.item(7).childNodes.item(0).childNodes.item(0).text
CARDdiscover = raiz.childNodes.item(2).childNodes.item(7).childNodes.item(1).childNodes.item(0).text

'VALIDADE E CVV2 E PORTADOR'
CARDvalidade = raiz.childNodes.item(2).childNodes.item(4).text
CARDcvv2 = raiz.childNodes.item(2).childNodes.item(5).text
CARDholder = raiz.childNodes.item(2).childNodes.item(3).text

'CONFIG.AMBIENTE'

'AMBIENTE CBP'
CBPtestes  = raiz.childNodes.item(0).childNodes.item(0).text
CBPproducao = raiz.childNodes.item(0).childNodes.item(1).text

Session("TEMPambiente") = Session("TEMPTIDambiente")
Session("TEMPnumero") = Session("TEMPTIDnumero")
Session("TEMPchave") = Session("TEMPTIDchave")
%>
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
	If Session("TEMPTIDtid") = "" Then
%>
<body>
	<h2 align="center">Ops ! Esta página somente poderá ser acessada, após o processamento da requisição do TID</h2>
	<h2 align="center"><a href="Req_tid1.asp" class="linkfundobranco">Voltar</a></h2>
</body>
<%
Else
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
			<td height="50" colspan="4" align="center" class="topo">CONFIGURAÇÃO CARTÕES DE TESTE</td>
		</tr> 
			<tr>
			<td rowspan="2" align="center"><img src="Imagens/Visa.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDvisa_2()" id="button"></td>
			<td rowspan="2" align="center"><img src="Imagens/Mastercard.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDmaster_2()" id="button"></td>
		</tr>
		<tr>
			<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDvisa_2()" id="button"></td>
            <td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDmaster_2()" id="button"></td>
		</tr>
		<tr>
			<td rowspan="2" align="center"><img src="Imagens/Elo.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDelo_2()" id="button"></td>
			<td rowspan="2" align="center"><img src="Imagens/Diners.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDdiners_2()" id="button"></td>
		</tr>
		<tr>
        	<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDelo_2()" id="button"></td>
			<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDdiners_2()" id="button"></td>
		</tr>
			<td rowspan="2" align="center"><img src="Imagens/Discover.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDdiscover_2()" id="button"></td>
		</tr>
		<tr>
			<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDdiscover_2()" id="button"></td>
		</tr>
		<form name="requisicao_autorizacao_portador" action="Req_aut_dir_portador_processamento1.asp" method="post">
		<tr>
			<td align="center" height="50" class="menu" colspan="2" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='menu';hideTip()">AMBIENTE</td>
			<td align="center" height="50" class="submenu" colspan="2"><% If Session("TEMPambiente") = CBPtestes Then %>
            											<select name="ambiente">
														<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
														<option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
														</select>
                                                       <% Else %>
            											<select name="ambiente">
                                                        <option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
														<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
														</select>                                                                                                        
                                                       <% End if %>
														</td>
		</tr>
		<tr>
			<td colspan="4" height="50" align="center" class="topo"><input type="button" value="Voltar" onclick=window.location.href="Default.asp" id="button"/></td>
		</tr>
	</table>
	<br />
	<br />
		<table cellspacing="5" align="center" width="576">
			<tr>
				<td height="50" colspan="4" align="center" class="topo" onMouseOver="this.className='menu_light';doTooltip(event,21)" onMouseOut="this.className='topo';hideTip()">REQUISICAO-AUTORIZAÇÃO-PORTADOR</td>
			</tr>
			<tr>
				<td align="center" class="menu" width="30%" onMouseOver="this.className='menu_light';doTooltip(event,15)" onMouseOut="this.className='menu';hideTip()">TID</td>
				<td class="submenu" width="30%" onMouseOver="this.className='menu_light';doTooltip(event,15.1)" onMouseOut="this.className='submenu';hideTip()">TID:</td><td class="menu" colspan="2"><input type="text" name="tid" value="<%= Session("TEMPTIDtid") %>" size="20" maxlength="40"/></td>
			</tr>
			<tr>
				<td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='menu';hideTip()">DADOS-EC</td>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_numero" value="<%= Session("TEMPTIDnumero") %>" size="10" maxlength="20"/></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.2)" onMouseOut="this.className='submenu';hideTip()">Chave:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_chave" value="<%= Session("TEMPTIDchave") %>" size="30" maxlength="100"/></td>
			</tr>
			<tr>
				<td rowspan="5" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,22)" onMouseOut="this.className='menu';hideTip()">DADOS-CARTAO</td>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_cartao_numero" size="16" maxlength="16" /></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.2)" onMouseOut="this.className='submenu';hideTip()">Validade:</td><td class="menu" colspan="2"><input type="text" name="dados_cartao_validade" size="6" maxlength="6" /></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.3)" onMouseOut="this.className='submenu';hideTip()">Indicador:)</td><td class="menu" colspan="2"><select name="dados_cartao_indicador">
					<option value="0">0 - Não informado</option>
					<option value="1">1 - Informado</option>
					<option value="2">2 - Ilegível</option>
					<option value="9">9 - Inexistente</option></select>
				</td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.4)" onMouseOut="this.className='submenu';hideTip()">CVV2:</td><td class="menu" colspan="2"><input type="text" name="dados_cartao_codigo_seguranca" size="3" maxlength="3" /></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.5)" onMouseOut="this.className='submenu';hideTip()">Nome do portador:</td><td class="menu" colspan="2"><input type="text" name="dados_cartao_nome_portador" size="20" maxlength="50" /></td>
			</tr>
			<tr>
				<td rowspan="6" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,7)" onMouseOut="this.className='menu';hideTip()">DADOS-PEDIDO</td>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_pedido_numero" value="<%= aleatory %>" size="5" maxlength="20" /></td>
			</tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.2)" onMouseOut="this.className='submenu';hideTip()">Valor:</td><td class="menu" colspan="2"><input type="text" name="dados_pedido_valor" value="100" size="8" maxlength="12" /></td>
			</tr>
			</tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.3)" onMouseOut="this.className='submenu';hideTip()">Moeda:</td><td class="menu" colspan="2"><select name="dados_pedido_moeda">
									<option value="986">986 - Real</option>
									<option value="840">840 - Dólar</option>
									<option value="978">978 - Euro</option></select>
				</td>
			</tr>
			</tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.4)" onMouseOut="this.className='submenu';hideTip()">Data e Hora:</td><td class="menu" colspan="2"><input type="text" readonly="readonly" value="<%= FormataData(Date) & "T" & time()%>" name="dados_pedido_data_hora" size="19" maxlength="19" /></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.5)" onMouseOut="this.className='submenu';hideTip()">Descrição:</td><td class="menu" colspan="2"><input type="text" name="dados_pedido_descricao" value="MacBook Pro 17 || Para: Suporte Web || QTDE: 20" size="25" maxlength="1024" /></td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,7.6)" onMouseOut="this.className='submenu';hideTip()">Idioma:</td><td class="menu" colspan="2"><select name="dados_pedido_idioma">
									<option value="PT">PT - Português</option>
									<option value="EN">EN - Inglês</option>
									<option value="ES">ES - Espanhol</option></select>
				</td>
			</tr>
			<tr>
				<td rowspan="3" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,8)" onMouseOut="this.className='menu';hideTip()">FORMA-PAGAMENTO</td>
					<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,8.1)" onMouseOut="this.className='submenu';hideTip()">Bandeira:</td>
					<td align="center" class="menu" colspan="2">
					<br />
					<input type="radio" id="0" checked="checked" name="forma_pagamento_bandeira" value="visa" /><img src="Imagens/Visa_2.png" align="middle"/>
					<input type="radio" id="1" name="forma_pagamento_bandeira" value="mastercard" /><img src="Imagens/Mastercard_2.png" align="middle"/>
					<br /><br />
					<input type="radio" id="2" name="forma_pagamento_bandeira" value="elo" /><img src="Imagens/Elo_2.png" align="middle"/>
					<input type="radio" id="3" name="forma_pagamento_bandeira" value="diners" /><img src="Imagens/Diners_2.png" align="middle"/>
					<br /><br />
					<input type="radio" id="4" name="forma_pagamento_bandeira" value="discover" /><img src="Imagens/Discover_2.png" align="middle"/><br /><br />
				</td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,20.1)" onMouseOut="this.className='submenu';hideTip()">Produtos:</td><td align="left" class="menu" colspan="2"><input type="radio" name="forma_pagamento_produto" value="1" OnClick="desabilita_parcelado_aut()" checked="checked">1 - Crédito á vista<br />
													<input type="radio" name="forma_pagamento_produto" value="2" OnClick="habilita_parcelado_aut()">2 - Parcelamento Loja<br />
													<input type="radio" name="forma_pagamento_produto" value="3" OnClick="habilita_parcelado_aut()">3 - Parcelamento ADM<br />
													
				</td>
			</tr>
			<tr>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,20.2)" onMouseOut="this.className='submenu';hideTip()">Parcelas:</td><td class="menu" colspan="2"><select name="forma_pagamento_parcelas">
										<option value="1">1 - Crédito á vista ou débito</option>
										<option value="2">2 - (02x) parcelas</option>
										<option value="3">3 - (03x) parcelas</option>
										<option value="4">4 - (04x) parcelas</option>
										<option value="5">5 - (05x) parcelas</option>
										<option value="6">6 - (06x) parcelas</option>
										<option value="7">7 - (07x) parcelas</option>
										<option value="8">8 - (08x) parcelas</option>
										<option value="9">9 - (09x) parcelas</option>
										<option value="10">10 - (10x) parcelas</option>
										<option value="11">11 - (11x) parcelas</option>
										<option value="12">12 - (12x) parcelas</option></select>
				</td>
			</tr>
			 <tr>
				<td align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,11)" onMouseOut="this.className='menu';hideTip()">CAPTURAR</td>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,11.1)" onMouseOut="this.className='submenu';hideTip()">Capturar?:</td><td class="menu" colspan="2"><select name="capturar_automaticamente">
										<option value="false">false - Não capturar</option>
										<option value="true">true - capturar</option></select>
				</td>
			 </tr>
			 <tr>
				<td align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,12)" onMouseOut="this.className='menu';hideTip()">CAMPO-LIVRE</td>
				<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,12.1)" onMouseOut="this.className='submenu';hideTip()">campo-livre:</td><td class="menu" colspan="2"><input type="text" name="campo_livre" value="teste suporteweb" size="20" maxlength="128" /></td>
			 </tr>
			 <tr>
				<td height="50" colspan="4" align="center" class="topo" colspan="2"><input type="submit" value="Confirmar dados" OnClick="return valida71()" id="button"/></td>
			 </tr>
		</table>
	</form>
	<br />
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
<%
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