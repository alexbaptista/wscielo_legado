<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
RANDOMIZE
max = 1000
min = 1
aleatory = min+CInt(RND()*(max-min))

Function FormataData(Data)
   If Data <> "" Then FormataData = DatePart("yyyy", Data) & "-" & Right("0" & DatePart("m", Data),2) & "-" & Right("0" & DatePart("d", Data),2)
End Function

If Request.ServerVariables("HTTPS") = "on" Then
	URL_RETORNO = "https://" & Request.ServerVariables("SERVER_NAME") & "/Req_trans_retorno.asp"
Else
	URL_RETORNO = "http://" & Request.ServerVariables("SERVER_NAME") & "/Req_trans_retorno.asp"
End If

Set MsXml = Server.CreateObject("Msxml2.DOMDocument.3.0")
MsXml.async = False
MsXml.load Server.MapPath("WebServiceCieloAdmin\Config.xml")
Set raiz = MsXml.documentElement

'CONFIG.AMBIENTE'

'AMBIENTE CBP'
CBPtestes  = raiz.childNodes.item(0).childNodes.item(0).text
CBPproducao = raiz.childNodes.item(0).childNodes.item(1).text

'BUY PAGE CIELO TESTES'
BPCTESTmaquineta = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).childNodes.item(0).text
BPCTESTchave = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).childNodes.item(1).text

'BUY PAGE CIELO PRODUCAO'
BPCPRODmaquineta = raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(0).text
BPCPRODchave = raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).text

'BUY PAGE LOJA TESTES'
BPLTESTmaquineta = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(0).text
BPLTESTchave = raiz.childNodes.item(1).childNodes.item(0).childNodes.item(0).childNodes.item(1).childNodes.item(1).text

'BUY PAGE LOJA PRODUCAO'
BPLPRODmaquineta= raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(0).text
BPLPRODchave = raiz.childNodes.item(1).childNodes.item(1).childNodes.item(0).childNodes.item(1).childNodes.item(1).text

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

'VALIDADE E CVV2 E PORTADOR'
CARDvalidade = raiz.childNodes.item(2).childNodes.item(4).text
CARDcvv2 = raiz.childNodes.item(2).childNodes.item(5).text
CARDholder = raiz.childNodes.item(2).childNodes.item(3).text

Set MsXml = Nothing
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
<body>
<%
If Session("login") = "suporteweb" and Session("password") = "passw0rd" Then
%>
<table width="100%" cellspacing="5">
<tr>
	<td align="center" width="30%" class="submenugrande">Simulador Web Service Cielo</td><td align="right"><%= Session("nome")%><br />ID: <%= Session("usuario")%> | <a href="Admin/Sair.asp">Sair</a> | <a href="Admin/Opcoes_usuario.asp">Opções</a></td>
</tr>
</table>
	<br />
	<table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo">CONFIGURAÇÃO DO AMBIENTE (AFILIAÇÕES CIELO)</td>
		</tr>
		<tr>
			<td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,0)" onMouseOut="this.className='menu';hideTip()">Buy Page "Cielo"</td>
			<td align="center" class="submenu"><input type="button" value="Usar Testes" onClick="Ambiente_BPC_TESTE()" id="button"/></td>
            <td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,1)" onMouseOut="this.className='menu';hideTip()">Buy Page "Loja"</td>
            <td align="center" class="submenu"><input type="button" value="Usar Testes" onClick="Ambiente_BPL_TESTE()" id="button"/></td>
		</tr>
		<tr>
			<td align="center" class="submenu"><input type="button" value="Usar Produção" onClick="Ambiente_BPC_PRODUCAO()" id="button"/></td>
			<td align="center" class="submenu"><input type="button" value="Usar Produção" onClick="Ambiente_BPL_PRODUCAO()" id="button"/></td>
        </tr>
        <tr>
			<td height="50" colspan="4" align="center" class="menu">CONFIGURAÇÃO CARTÕES DE TESTE</td>
		</tr> 
		<tr>
			<td rowspan="2" align="center"><img src="Imagens/Visa.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDvisa()" id="button"></td>
			<td rowspan="2" align="center"><img src="Imagens/Mastercard.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDmaster()" id="button"></td>
		</tr>
		<tr>
			<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDvisa()" id="button"></td>
            <td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDmaster()" id="button"></td>
		</tr>
		<tr>
			<td rowspan="2" align="center"><img src="Imagens/Elo.png" /></td>
			<td align="center" class="submenu"><input type="button" value="Autenticado" OnClick="preenche_cartao_AUTCARDelo()" id="button"></td>
		</tr>
		<tr>
        	<td align="center" class="submenu"><input type="button" value="Não Autenticado" OnClick="preenche_cartao_CARDelo()" id="button"></td>
		</tr>
	<form name="requisicao_transacao" action="Req_trans_processamento.asp" method="post">
		<tr>
			<td height="50" colspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,2)" onMouseOut="this.className='menu';hideTip()">CONFIGURAÇÃO "BUY PAGE"</td>
			<td height="50" colspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,3)" onMouseOut="this.className='menu';hideTip()">CONFIGURAÇÃO "AMBIENTE"</td>
		</tr>
		<tr>
			<td colspan="2" class="submenu"><input type="radio" id="0" name="bypage" value="loja" OnClick="habilita_dados_portador()" checked="checked">Loja - (Leitura do cartão na loja)</td>
			<td align="center" colspan="2" rowspan="2" class="submenu"><% If Session("TEMPambiente") = CBPtestes Then %>
																		<select name="ambiente">
																		<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
																		<option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
																		</select>
																		<% Else %>
																		<select name="ambiente">
																		<option value="<%= CBPproducao %>">ECOMMERCE - (PRODUÇÃO)</option>
																		<option value="<%= CBPtestes %>">QASECOMMERCE - (TESTES)</option>
																		</select><% End if %></td>
		</tr>
		<tr>
			<td colspan="2" class="submenu"><input type="radio" id="1" name="bypage" value="Cielo" OnClick="desabilita_dados_portador()">Cielo - (leitura do cartão na Cielo)</td>
		</tr>
		<tr>
			<td colspan="3" height="50" align="center" class="topo"><input type="reset" value="Limpar formulário" OnClick="limpar_formulario()"  id="button"></td>
            <td colspan="1" height="50" align="center" class="topo"><input type="button" value="Voltar" onclick=window.location.href="Default.asp"  id="button"/></td>
		</tr>
	</table>
	<br />
	<br />
    <table align="center" width="576" cellspacing="5">
    	<tr>
        	<td height="50" colspan="4" align="center" class="topo" onMouseOver="this.className='menu_light';doTooltip(event,4)" onMouseOut="this.className='topo';hideTip()">REQUISICAO-TRANSACAO</td>
      </tr>
    	<tr>
        	<td rowspan="2" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,5)" onMouseOut="this.className='menu';hideTip()">DADOS-EC</td>
    		<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_numero" size="10" maxlength="20" value="<%= Session("TEMPnumero") %>" /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,5.2)" onMouseOut="this.className='submenu';hideTip()">Chave:</td><td class="menu" colspan="2"><input type="text" name="dados_ec_chave" size="30" maxlength="100" value="<%= Session("TEMPchave") %>"/></td>
        </tr>
        <tr>
        	<td rowspan="5" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,6)" onMouseOut="this.className='menu';hideTip()" id="dados_cartao">DADOS-PORTADOR<br />(buy page Loja)</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.1)" onMouseOut="this.className='submenu';hideTip()">Número:</td><td class="menu" colspan="2" id="dados_cartao1"><input id="dados_cartao11" type="text" name="dados_portador_numero" onChange="bin_cartao()" size="16" maxlength="16" /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.2)" onMouseOut="this.className='submenu';hideTip()">Validade:</td><td class="menu" colspan="2" id="dados_cartao2"><input id="dados_cartao21" type="text" name="dados_portador_validade" size="6" maxlength="6" /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.3)" onMouseOut="this.className='submenu';hideTip()">Indicador</td><td class="menu" colspan="2" id="dados_cartao3"><select id="dados_cartao31" name="dados_portador_indicador">
        		<option value="0">0 - Não informado</option>
        		<option value="1">1 - Informado</option>
        		<option value="2">2 - Ilegível</option>
        		<option value="9">9 - Inexistente</option></select>
            </td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.4)" onMouseOut="this.className='submenu';hideTip()">CVV2</td><td class="menu" colspan="2" id="dados_cartao4"><input id="dados_cartao41" type="text" name="dados_portador_codigo_seguranca" size="3" maxlength="3" /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,6.5)" onMouseOut="this.className='submenu';hideTip()">Nome do portador:</td><td class="menu" colspan="2" id="dados_cartao5"><input type="text" id="dados_cartao51" name="dados_portador_nome_portador" size="20" maxlength="50" /></td>
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
            <td class="submenugrande" onMouseOver="this.className='menu_light';doTooltip(event,8.1)" onMouseOut="this.className='submenugrande';hideTip()">Bandeira:</td><td align="center" class="menu" colspan="2"><br /><input type="radio" id="0" checked="checked" name="forma_pagamento_bandeira" value="visa" /><img src="Imagens/Visa_2.png" align="middle"/>
																<input type="radio" id="1" name="forma_pagamento_bandeira" value="mastercard" /><img src="Imagens/Mastercard_2.png" align="middle"/>
																<br /><br /><input type="radio" id="2" name="forma_pagamento_bandeira" value="elo" /><img src="Imagens/Elo_2.png" align="middle"/><br /><br /></td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,8.2)" onMouseOut="this.className='submenu';hideTip()">Produtos:</td><td align="left" class="menu" colspan="2"><input type="radio" name="forma_pagamento_produto" value="1" OnClick="desabilita_parcelado()" checked="checked">1 - Crédito á vista<br />
												<input type="radio" name="forma_pagamento_produto" value="2" OnClick="habilita_parcelado()">2 - Parcelamento Loja<br />
												<input type="radio" name="forma_pagamento_produto" value="3" OnClick="habilita_parcelado()">3 - Parcelamento ADM<br />
												<input type="radio" name="forma_pagamento_produto" value="A" OnClick="desabilita_parcelado()">A - Débito<br />
            </td>
        </tr>
        <tr>
        	<td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,8.3)" onMouseOut="this.className='submenu';hideTip()">Parcelas:</td><td class="menu" colspan="2"><select name="forma_pagamento_parcelas">
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
         	<td rowspan="1" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,9)" onMouseOut="this.className='menu';hideTip()">URL-RETORNO</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,9.1)" onMouseOut="this.className='submenu';hideTip()">URL:</td><td class="menu" colspan="2"><input type="text" name="url_retorno" value="<%= URL_RETORNO %>" size="30" maxlength="1024" /></td>
         </tr>
         <tr>
         	<td rowspan="1" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,10)" onMouseOut="this.className='menu';hideTip()">AUTORIZAR</td>
            <td class="submenugrande" onMouseOver="this.className='menu_light';doTooltip(event,10.1)" onMouseOut="this.className='submenugrande';hideTip()">Autorizar:</td><td class="menu" colspan="2"><input type="radio" name="autorizar" value="0" checked="checked"/>0 - Não Autorizar<br />
            					   <input type="radio" name="autorizar" value="1" />1 - Autorizar <br />somente se autenticada<br />
                                   <input type="radio" name="autorizar" value="2" />2 - Autorizar autenticada<br />e não autenticada<br />
                                   <input type="radio" name="autorizar" value="3" />3 - Autorizar sem passar<br />pelo processo de autenticação<br />(somente para crédito)</td>
         </tr>
         <tr>
         	<td rowspan="1" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,11)" onMouseOut="this.className='menu';hideTip()">CAPTURAR</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,11.1)" onMouseOut="this.className='submenu';hideTip()">Capturar?:</td><td class="menu" colspan="2"><select name="capturar">
            						<option value="false">false - Não capturar</option>
                                    <option value="true">true - capturar</option></select>
            </td>
         </tr>
         <tr>
         	<td rowspan="1" align="center" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,12)" onMouseOut="this.className='menu';hideTip()">CAMPO-LIVRE</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,12.1)" onMouseOut="this.className='submenu';hideTip()">campo-livre:</td><td class="menu" colspan="2"><input type="text" name="campo_livre" value="teste suporteweb" size="20" maxlength="128" /></td>
         </tr>
         <tr>
         	<td rowspan="1" align="center" class="menu" class="menu" onMouseOver="this.className='menu_light';doTooltip(event,13)" onMouseOut="this.className='menu';hideTip()">BIN</td>
            <td class="submenu" onMouseOver="this.className='menu_light';doTooltip(event,13.1)" onMouseOut="this.className='submenu';hideTip()">bin:</td><td class="menu" colspan="2"><input type="text" readonly="readonly" name="bin" size="6" maxlength="6" /></td>
         </tr>
         <tr>
         	<td height="50" colspan="4" align="center" class="topo"><input type="submit" value="Confirmar dados" OnClick="return valida()"  id="button"/></td>
         </tr>
    </table>
	<br />
	</form>
<%
Else
%>
	<div id="divCentralizada">
    	<p align="center"><a href="Default.asp" class="linkfundobranco"><img src="Imagens/Negado.png" name="Acesso negado !" title="Acesso Negado !" /></a></p>
    </div>
<%
End if
%>
</body>
<div id="tipDiv" style="position:absolute; visibility:hidden; z-index:100"></div>
</html>
