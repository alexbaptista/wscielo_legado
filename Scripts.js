<script language="javascript">
<!--

var dom = (document.getElementById) ? true : false;
var ns5 = ((navigator.userAgent.indexOf("Gecko")>-1) && dom) ? true: false;
var ie5 = ((navigator.userAgent.indexOf("MSIE")>-1) && dom) ? true : false;
var ns4 = (document.layers && !dom) ? true : false;
var ie4 = (document.all && !dom) ? true : false;
var nodyn = (!ns5 && !ns4 && !ie4 && !ie5) ? true : false;

var origWidth, origHeight;
if (ns4) {
	origWidth = window.innerWidth; origHeight = window.innerHeight;
	window.onresize = function() { if (window.innerWidth != origWidth || window.innerHeight != origHeight) history.go(0); }
}

if (nodyn) { event = "nope" }
var tipFollowMouse	= true;	
var tipWidth		= 160;
var offX		 	= 12;	
var offY		 	= 12; 
var tipFontFamily 	= "Verdana, arial, helvetica, sans-serif";
var tipFontSize		= "10pt";
var tipFontColor		= "#000080";
var tipBgColor		= "#000080"; 
var origBgColor 		= tipBgColor; 
var tipBorderColor 	= "#000080";
var tipBorderWidth 	= 4;
var tipBorderStyle 	= "ridge";
var tipPadding	 	= 4;

var messages = new Array();

"Requisicao-transação-configuração"
messages[0] = new Array('Imagens/textos/info.jpg','<b>Buy Page Cielo</b>: op\u00e7\u00e3o que anula o n\u00f3 \"dados-portador", fazendo com que os dados do cart\u00e3o do portador, sejam inseridos no ambiente Cielo.',"#FFFFFF");
messages[1] = new Array('Imagens/textos/info.jpg','<b>Buy Page Loja</b>: dados do cart\u00e3o s\u00e3o inseridos no ambiente do estabelecimento e depois encaminhados ao ambiente Cielo.',"#FFFFFF");
messages[2] = new Array('Imagens/textos/info.jpg','<b>Config. Buy Page</b>:<br /><br />loja = cart\u00e3o no ambiente da loja.<br /><br />cielo = cart\u00e3o no ambiente Cielo.',"#FFFFFF");
messages[3] = new Array('Imagens/textos/info.jpg','<b>Config. do ambiente</b>:<br /><br />QASECOMMERCE<br />Testes.<br /><br />ECOMMERCE<br />Produ\u00e7\u00e3o.',"#FFFFFF");

"Requisicao-transação"
messages[4] = new Array('Imagens/textos/requisicao_transacao.jpg','N\u00f3 utilizado para cria\u00e7\u00e3o da transa\u00e7\u00e3o, primeiro passo para autentica\u00e7\u00e3o (3D Secure)',"#FFFFFF");
messages[5] = new Array('Imagens/textos/dados_ec.jpg','N\u00f3 com dados das credenciais',"#FFFFFF");
messages[5.1] = new Array('Imagens/textos/info.jpg','<b>numero: </b>N\u00famero de afilia\u00e7\u00e3o da loja com a Cielo',"#FFFFFF");
messages[5.2] = new Array('Imagens/textos/info.jpg','<b>chave: </b>Chave de acesso da loja atribu\u00edda pela Cielo.',"#FFFFFF");
messages[6] = new Array('Imagens/textos/dados_portador.jpg','N\u00f3 com dados do cart\u00e3o.',"#FFFFFF");
messages[6.1] = new Array('Imagens/textos/info.jpg','<b>numero: </b>N\u00famero do cart\u00e3o.',"#FFFFFF");
messages[6.2] = new Array('Imagens/textos/info.jpg','<b>validade: </b>Validade do cart\u00e3o no formato aaaamm. Exemplos: 201212 (dez 2012).',"#FFFFFF");
messages[6.3] = new Array('Imagens/textos/info.jpg','<b>indicador: </b>Obrigat\u00f3rio. Indicador do c\u00f3digo de seguran\u00e7a:<br />0 (n\u00e3o informado)<br />1 (informado)<br />2 (ileg\u00edvel)<br />9 (inexistente)',"#FFFFFF");
messages[6.4] = new Array('Imagens/textos/info.jpg','<b>cvv2: </b>Obrigat\u00f3rio se indicador = 1.',"#FFFFFF");
messages[6.5] = new Array('Imagens/textos/info.jpg','<b>nome portador: </b>Opcional. Nome impresso no cart\u00e3o.',"#FFFFFF");
messages[7] = new Array('Imagens/textos/dados_pedido.jpg','N\u00f3 com dados do pedido.',"#FFFFFF");
messages[7.1] = new Array('Imagens/textos/info.jpg','<b>numero: </b>N\u00famero do pedido da loja.',"#FFFFFF");
messages[7.2] = new Array('Imagens/textos/info.jpg','<b>valor: </b>Valor do pedido.',"#FFFFFF");
messages[7.3] = new Array('Imagens/textos/info.jpg','<b>moeda: </b>C\u00f3digo num\u00e9rico da moeda na ISO 4217. Para o Real, o c\u00f3digo \u00e9 986.',"#FFFFFF");
messages[7.4] = new Array('Imagens/textos/info.jpg','<b>data-hora: </b>Data hora do pedido.<br /><br />Formato:<br />mm-ddTHH24:mm:ss',"#FFFFFF");
messages[7.5] = new Array('Imagens/textos/info.jpg','<b>descricao: </b>Descri\u00e7\u00e3o do pedido.',"#FFFFFF");

messages[7.6] = new Array('Imagens/textos/info.jpg','<b>idioma: </b>Idioma do pedido:<br /><br />PT (portugu\u00eas)<br />EN (ingl\u00eas)<br />ES (espanhol)<br /><br />Com base nessa informa\u00e7\u00e3o \u00e9 definida a l\u00edngua a ser utilizada nas telas da Cielo. Caso n\u00e3o preenchido, assume-se PT.',"#FFFFFF");
messages[7.7] = new Array('Imagens/textos/info.jpg','<b>soft-descriptor</b> Novo campo que possibilita \u00e0 Loja enviar uma frase customizada por transa\u00e7\u00e3o que ser\u00e1 impressa na fatura do portador<br /><br />(N\u00e3o funciona com a bandeira AMEX).',"#FFFFFF");
messages[8] = new Array('Imagens/textos/forma_pagamento.jpg','N\u00f3 com a forma de pagamento.',"#FFFFFF");
messages[8.1] = new Array('Imagens/textos/info.jpg','<b>Bandeira: </b>Visa, MasterCard ou Elo',"#FFFFFF");
messages[8.2] = new Array('Imagens/textos/info.jpg','<b>Produto: </b>C\u00f3digo do produto:<br />1 (Cr\u00e9dito \u00e0 Vista)<br />2 (Parcelado loja)<br />3 (Parcelado administradora)<br />A (D\u00e9bito)',"#FFFFFF");
messages[8.3] = new Array('Imagens/textos/info.jpg','<b>Parcelas: </b>N\u00famero de parcelas. Para cr\u00e9dito \u00e0 vista ou d\u00e9bito, utilizar 1.',"#FFFFFF");
messages[9] = new Array('Imagens/textos/url_retorno.jpg','URL da p\u00e1gina de retorno.',"#FFFFFF");
messages[9.1] = new Array('Imagens/textos/info.jpg','<b>Bandeira: </b>',"#FFFFFF");
messages[10] = new Array('Imagens/textos/autorizar.jpg','Indicador de autoriza\u00e7\u00e3o autom\u00e1tica.',"#FFFFFF");
messages[10.1] = new Array('Imagens/textos/info.jpg','<b>autorizar: </b>Indicador de autoriza\u00e7\u00e3o autom\u00e1tica.',"#FFFFFF");
messages[11] = new Array('Imagens/textos/capturar.jpg','Define se a transa\u00e7\u00e3o ser\u00e1 automaticamente capturada caso seja autorizada.',"#FFFFFF");
messages[11.1] = new Array('Imagens/textos/info.jpg','<b>capturar: </b><br />[true]sim ou [false]n\u00e3o',"#FFFFFF");
messages[12] = new Array('Imagens/textos/campo_livre.jpg','Campo livre.',"#FFFFFF");
messages[12.1] = new Array('Imagens/textos/info.jpg','<b>campo-livre: </b>Campo livre.',"#FFFFFF");
messages[13] = new Array('Imagens/textos/bin.jpg','Seis primeiros n\u00fameros do cart\u00e3o.',"#FFFFFF");
messages[13.1] = new Array('Imagens/textos/info.jpg','<b>bin: </b>Seis primeiros n\u00fameros do cart\u00e3o.',"#FFFFFF");

"requisicao-autorizacao-tid"
messages[14] = new Array('Imagens/textos/requisicao_autorizacao_tid.jpg','N\u00f3 respons\u00e1vel pela execu\u00e7\u00e3o da autoriza\u00e7\u00e3o posterior a \"requisicao-transacao\".',"#FFFFFF");
messages[15] = new Array('Imagens/textos/tid.jpg','N\u00f3 com o identificador da transa\u00e7\u00e3o.',"#FFFFFF");
messages[15.1] = new Array('Imagens/textos/info.jpg','<b>TID: </b>Identificador da transa\u00e7\u00e3o.',"#FFFFFF");

"requisicao-captura"
messages[16] = new Array('Imagens/textos/requisicao_captura.jpg','N\u00f3 respons\u00e1vel pela execu\u00e7\u00e3o da captura posterior a autoriza\u00e7\u00e3o.',"#FFFFFF");
messages[17] = new Array('Imagens/textos/info.jpg','N\u00f3 opcionais para a captura.',"#FFFFFF");
messages[17.1] = new Array('Imagens/textos/info.jpg','<b>Valor: </b>Valor da captura. Caso n\u00e3o fornecido, o valor atribu\u00eddo \u00e9 o valor da autoriza\u00e7\u00e3o.',"#FFFFFF");
messages[17.2] = new Array('Imagens/textos/info.jpg','<b>Anexo: </b>Informa\u00e7\u00e3o adicional para detalhamento da captura.',"#FFFFFF");

"requisicao-cancelamento"
messages[18] = new Array('Imagens/textos/requisicao_cancelamento.jpg','N\u00f3 respons\u00e1vel pela execu\u00e7\u00e3o do cancelamento',"#FFFFFF");

"requisicao-consulta"
messages[19] = new Array('Imagens/textos/requisicao_consulta.jpg','N\u00f3 respons\u00e1vel pela execu\u00e7\u00e3o da consulta',"#FFFFFF");

"requisicao-tid"
messages[20] = new Array('Imagens/textos/requisicao_tid.jpg','N\u00f3 respons\u00e1vel pela cria\u00e7\u00e3o de um TID, para autoriza\u00e7\u00e3o posterior.',"#FFFFFF");
messages[20.1] = new Array('Imagens/textos/info.jpg','<b>Produto: </b>C\u00f3digo do produto:<br />1 (Cr\u00e9dito \u00e0 Vista)<br />2 (Parcelado loja)<br />3 (Parcelado administradora)',"#FFFFFF");
messages[20.2] = new Array('Imagens/textos/info.jpg','<b>Parcelas: </b>N\u00famero de parcelas. Para cr\u00e9dito \u00e0 vista, utilizar 1.',"#FFFFFF");

"requisicao-autorizacao-portador"
messages[21] = new Array('Imagens/textos/requisicao_autorizacao_portador.jpg','N\u00f3 respons\u00e1vel pela execu\u00e7\u00e3o da autoriza\u00e7\u00e3o pelo TID criado.',"#FFFFFF");
messages[22] = new Array('Imagens/textos/dados_cartao.jpg','N\u00f3 com dados do cart\u00e3o.',"#FFFFFF");

"requisicao-consulta-chsec"
messages[23] = new Array('Imagens/textos/info.jpg','N\u00f3 respons\u00e1vel pela consulta da transa\u00e7\u00e3o pelo n\u00famero do pedido',"#FFFFFF");
messages[23.1] = new Array('Imagens/textos/info.jpg','consulta da transa\u00e7\u00e3o pelo n\u00famero do pedido (v = 1.2.0)',"#FFFFFF");




if (document.images) {
	var theImgs = new Array();
	for (var i=0; i<messages.length; i++) {
  	theImgs[i] = new Image();
		theImgs[i].src = messages[i][0];
  }
}

var startStr = '<table id="wtable" width="' + tipWidth + '"><tr><td align="center" width="100%"><img src="';
var midStr = '" border="0"></td></tr><tr><td valign="top">';
var endStr = '</td></tr></table>';

var tooltip, tipcss;
function initTip() {
	if (nodyn) return;
	tooltip = (ns4)? document.tipDiv.document: (ie4)? document.all['tipDiv']: (ie5||ns5)? document.getElementById('tipDiv'): null;
	tipcss = (ns4)? document.tipDiv: tooltip.style;
	if (ie4||ie5||ns5) {	
		tipcss.width = tipWidth+"px";
		tipcss.fontFamily = tipFontFamily;
		tipcss.fontSize = tipFontSize;
		tipcss.color = tipFontColor;
		tipcss.backgroundColor = tipBgColor;
		tipcss.borderColor = tipBorderColor;
		tipcss.borderWidth = tipBorderWidth+"px";
		tipcss.padding = tipPadding+"px";
		tipcss.borderStyle = tipBorderStyle;
	}
	if (tooltip&&tipFollowMouse) {
		if (ns4) document.captureEvents(Event.MOUSEMOVE);
		document.onmousemove = trackMouse;
	}
}

window.onload = initTip;

var t1,t2;
var tipOn = false;
function doTooltip(evt,num) {

	if (!tooltip) return;
	if (t1) clearTimeout(t1);	if (t2) clearTimeout(t2);
	tipOn = true;
	if (messages[num][2])	var curBgColor = messages[num][2];
	else curBgColor = tipBgColor;
	if (messages[num][3])	var curFontColor = messages[num][3];
	else curFontColor = tipFontColor;
	if (ns4) {
		var tip = '<table id="wtable" bgcolor="' + tipBorderColor + '" width="' + tipWidth + '" cellspacing="0" cellpadding="' + tipBorderWidth + '" border="0"><tr><td><table bgcolor="' + curBgColor + '" width="100%" cellspacing="0" cellpadding="' + tipPadding + '" border="0"><tr><td>'+ startStr + messages[num][0] + midStr + '<span style="font-family:' + tipFontFamily + '; font-size:' + tipFontSize + '; color:' + curFontColor + ';">' + messages[num][1] + '</span>' + endStr + '</td></tr></table></td></tr></table>';
		tooltip.write(tip);
		tooltip.close();
	} else if (ie4||ie5||ns5) {
		var tip = startStr + messages[num][0] + midStr + '<span style="font-family:' + tipFontFamily + '; font-size:' + tipFontSize + '; color:' + curFontColor + ';">' + messages[num][1] + '</span>' + endStr;
		tipcss.backgroundColor = curBgColor;
	 	tooltip.innerHTML = tip;
	}
	if (!tipFollowMouse) positionTip(evt);
	else t1=setTimeout("tipcss.visibility='visible'",100);
}

var mouseX, mouseY;
function trackMouse(evt) {
	mouseX = (ns4||ns5)? evt.pageX: window.event.clientX + document.body.scrollLeft;
	mouseY = (ns4||ns5)? evt.pageY: window.event.clientY + document.body.scrollTop;
	if (tipOn) positionTip(evt);
}

function positionTip(evt) {
	if (!tipFollowMouse) {
		mouseX = (ns4||ns5)? evt.pageX: window.event.clientX + document.body.scrollLeft;
		mouseY = (ns4||ns5)? evt.pageY: window.event.clientY + document.body.scrollTop;
	}
	var tpWd = (ns4)? tooltip.width: (ie4||ie5)? tooltip.clientWidth: tooltip.offsetWidth;
	var tpHt = (ns4)? tooltip.height: (ie4||ie5)? tooltip.clientHeight: tooltip.offsetHeight;
	var winWd = (ns4||ns5)? window.innerWidth-20+window.pageXOffset: document.body.clientWidth+document.body.scrollLeft;
	var winHt = (ns4||ns5)? window.innerHeight-20+window.pageYOffset: document.body.clientHeight+document.body.scrollTop;
	if ((mouseX+offX+tpWd)>winWd) 
		tipcss.left = (ns4)? mouseX-(tpWd+offX): mouseX-(tpWd+offX)+"px";
	else tipcss.left = (ns4)? mouseX+offX: mouseX+offX+"px";
	if ((mouseY+offY+tpHt)>winHt) 
		tipcss.top = (ns4)? winHt-(tpHt+offY): winHt-(tpHt+offY)+"px";
	else tipcss.top = (ns4)? mouseY+offY: mouseY+offY+"px";
	if (!tipFollowMouse) t1=setTimeout("tipcss.visibility='visible'",100);
}

function hideTip() {
	if (!tooltip) return;
	t2=setTimeout("tipcss.visibility='hidden'",100);
	tipOn = false;
}

var win = null;

function NovaJanela(pagina,nome,w,h,scroll){
	LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
	TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
	settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
	win = window.open(pagina,nome,settings);
}

function valida(){
	if(document.requisicao_transacao.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_transacao.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_numero.value.length < 1){
		alert("Insira o n\u00famero do pedido !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_pedido_valor.value) == true){
		alert("O valor do pedido deve ser num\u00e9rico (ex: R$ 1,00 = 100) !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_valor.value.length < 1){
		alert("Inclua o valor do pedido !");
		return false;
	}
	else if(document.requisicao_transacao.url_retorno.value.length < 1){
		alert("Insira o valor da URL de retorno !");
		return false;
	}
	else if(document.requisicao_transacao.bypage[0].checked == true){
		if(document.requisicao_transacao.dados_portador_numero.value.length < 16){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard ou Elo deve conter no m\u00ednimo 16 d\u00edgitos !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_numero.value) == true){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard ou Elo deve ser num\u00e9rico !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_validade.value.length < 6){
			alert("A validade deve conter no m\u00ednimo 6 d\u00edgitos Ex:ANOMES(201009) !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_validade.value) == true){
			alert("A validade do cart\u00e3o deve ser num\u00e9rica !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_indicador.value == 1){
			if(document.requisicao_transacao.dados_portador_codigo_seguranca.value.length < 3){
				alert("A validade (CVV2) deve conter no m\u00ednimo 3 d\u00edgitos !");
				return false;
			}
			else if(isNaN(document.requisicao_transacao.dados_portador_codigo_seguranca.value) == true){
				alert("A validade deve ser num\u00e9rica !");
				return false;
			}
			return true;
		}
		return true;
	}
	return true;
}

function valida1(){
	if(document.requisicao_transacao.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_transacao.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_numero.value.length < 1){
		alert("Insira o n\u00famero do pedido !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_pedido_valor.value) == true){
		alert("O valor do pedido deve ser num\u00e9rico (ex: R$ 1,00 = 100) !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_valor.value.length < 1){
		alert("Inclua o valor do pedido !");
		return false;
	}
	else if(document.requisicao_transacao.url_retorno.value.length < 1){
		alert("Insira o valor da URL de retorno !");
		return false;
	}
	else if(document.requisicao_transacao.bypage[0].checked == true){
		if(document.requisicao_transacao.forma_pagamento_bandeira[3].checked == true && document.requisicao_transacao.dados_portador_numero.value.length < 14){
			alert("O n\u00famero do cart\u00e3o Diners deve conter no m\u00ednimo 14 d\u00edgitos !");
			return false;
		}
		else if(document.requisicao_transacao.forma_pagamento_bandeira[3].checked == false && document.requisicao_transacao.dados_portador_numero.value.length < 16){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard, Elo ou Discover deve conter no m\u00ednimo 16 d\u00edgitos !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_numero.value) == true){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard, Elo, Diners ou Discover deve ser num\u00e9rico !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_validade.value.length < 6){
			alert("A validade deve conter no m\u00ednimo 6 d\u00edgitos Ex:ANOMES(201009) !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_validade.value) == true){
			alert("A validade do cart\u00e3o deve ser num\u00e9rica !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_indicador.value == 1){
			if(document.requisicao_transacao.dados_portador_codigo_seguranca.value.length < 3){
				alert("A validade (CVV2) deve conter no m\u00ednimo 3 d\u00edgitos !");
				return false;
			}
			else if(isNaN(document.requisicao_transacao.dados_portador_codigo_seguranca.value) == true){
				alert("A validade deve ser num\u00e9rica !");
				return false;
			}
			return true;
		}
		return true;
	}
	return true;
}

function valida11(){
	if(document.requisicao_transacao.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_transacao.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_numero.value.length < 1){
		alert("Insira o n\u00famero do pedido !");
		return false;
	}
	else if(isNaN(document.requisicao_transacao.dados_pedido_valor.value) == true){
		alert("O valor do pedido deve ser num\u00e9rico (ex: R$ 1,00 = 100) !");
		return false;
	}
	else if(document.requisicao_transacao.dados_pedido_valor.value.length < 1){
		alert("Inclua o valor do pedido !");
		return false;
	}
	else if(document.requisicao_transacao.url_retorno.value.length < 1){
		alert("Insira o valor da URL de retorno !");
		return false;
	}
	else if(document.requisicao_transacao.bypage[0].checked == true){
		if(document.requisicao_transacao.forma_pagamento_bandeira[3].checked == true && document.requisicao_transacao.dados_portador_numero.value.length < 14){
			alert("O n\u00famero do cart\u00e3o Diners deve conter no m\u00ednimo 14 d\u00edgitos !");
			return false;
		}
		else if(document.requisicao_transacao.forma_pagamento_bandeira[5].checked == true && document.requisicao_transacao.dados_portador_numero.value.length < 15){
			alert("O n\u00famero do cart\u00e3o Amex deve conter no m\u00ednimo 15 d\u00edgitos !");
			return false;
		}
		else if(document.requisicao_transacao.forma_pagamento_bandeira[3].checked == false && document.requisicao_transacao.forma_pagamento_bandeira[5].checked == false && document.requisicao_transacao.dados_portador_numero.value.length < 16){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard, Elo ou Discover deve conter no m\u00ednimo 16 d\u00edgitos !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_numero.value) == true){
			alert("O n\u00famero do cart\u00e3o Visa, MasterCard, Elo, Diners, Discover ou Amex deve ser num\u00e9rico !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_validade.value.length < 6){
			alert("A validade deve conter no m\u00ednimo 6 d\u00edgitos Ex:ANOMES(201009) !");
			return false;
		}
		else if(isNaN(document.requisicao_transacao.dados_portador_validade.value) == true){
			alert("A validade do cart\u00e3o deve ser num\u00e9rica !");
			return false;
		}
		else if(document.requisicao_transacao.dados_portador_indicador.value == 1){
			if(document.requisicao_transacao.dados_portador_codigo_seguranca.value.length < 3){
				alert("A validade (CVV2) deve conter no m\u00ednimo 3 d\u00edgitos ");
				return false;
			}
			else if(document.requisicao_transacao.forma_pagamento_bandeira[5].checked == true && document.requisicao_transacao.dados_portador_codigo_seguranca.value.length < 4){
				alert("A validade (CVV2) para bandeira \"Amex\" deve conter no m\u00ednimo 4 d\u00edgitos");
				return false;
			}
			else if(isNaN(document.requisicao_transacao.dados_portador_codigo_seguranca.value) == true){
				alert("A validade deve ser num\u00e9rica !");
				return false;
			}
			return true;
		}
		return true;
	}
	return true;
}


function valida2(){
	if(document.requisicao_autorizacao_tid.tid.value == ""){
		alert("Insira o TID !")
		return false;
	}
	else if(document.requisicao_autorizacao_tid.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_tid.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_autorizacao_tid.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
}

function valida3(){
	if(document.requisicao_captura.tid.value == ""){
		alert("Insira o TID !")
		return false;
	}
	else if(document.requisicao_captura.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_captura.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_captura.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(isNaN(document.requisicao_captura.dados_ec_valor.value) == true){
		alert("O valor de captura deve ser num\u00e9rico !");
		return false;
	}
}

function valida4(){
	if(document.requisicao_cancelamento.tid.value == ""){
		alert("Insira o TID !")
		return false;
	}
	else if(document.requisicao_cancelamento.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_cancelamento.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_cancelamento.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
}

function valida41(){
	if(document.requisicao_cancelamento.tid.value == ""){
		alert("Insira o TID !")
		return false;
	}
	else if(document.requisicao_cancelamento.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_cancelamento.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_cancelamento.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_cancelamento.valor.value == ""){
		alert("Insira o valor do cancelamento (total ou parcial) !");
		return false;
	}
	else if(isNaN(document.requisicao_cancelamento.valor.value) == true){
		alert("O valor do cancelamento deve ser num\u00e9rico !");
		return false;
	}
}

function valida5(){
	if(document.requisicao_consulta.tid.value == ""){
		alert("Insira o TID !")
		return false;
	}
	else if(document.requisicao_consulta.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_consulta.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_consulta.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
}

function valida51(){
	if(document.requisicao_consulta.numeropedido.value == ""){
		alert("Insira o N\u00famero do pedido !")
		return false;
	}
	else if(document.requisicao_consulta.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_consulta.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_consulta.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
}

function valida6(){
	if(document.requisicao_tid.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_tid.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_tid.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
}

function valida7(){
	if(document.requisicao_autorizacao_portador.tid.value == ""){
		alert("Insira o TID criado !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_pedido_numero.value.length < 1){
		alert("Insira o n\u00famero do pedido !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_pedido_valor.value) == true){
		alert("O valor do pedido deve ser num\u00e9rico (ex: R$ 1,00 = 100) !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_pedido_valor.value.length < 1){
		alert("Inclua o valor do pedido !");
		return false;
	}
	if(document.requisicao_autorizacao_portador.dados_cartao_numero.value.length < 16){
		alert("O n\u00famero do cart\u00e3o Visa, Elo ou MasterCard deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_numero.value) == true){
		alert("O n\u00famero do cart\u00e3o Visa, Elo ou MasterCard deve ser num\u00e9rico !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_cartao_validade.value.length < 6){
		alert("A validade deve conter no m\u00ednimo 6 d\u00edgitos Ex:ANOMES(201009) !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_validade.value) == true){
		alert("A validade do cart\u00e3o deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_cartao_indicador.value == 1){
		if(document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value.length < 3){
				alert("A validade (CVV2) deve conter no m\u00ednimo 3 d\u00edgitos !");
				return false;
		}
		else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value) == true){
				alert("A validade deve ser num\u00e9rica !");
				return false;
		}
		return true;
	}
	return true;
}

function valida71(){
	if(document.requisicao_autorizacao_portador.tid.value == ""){
		alert("Insira o TID criado !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_ec_numero.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o Cielo deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_ec_numero.value) == true){
		alert("A afilia\u00e7\u00e3o Cielo deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_ec_chave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_pedido_numero.value.length < 1){
		alert("Insira o n\u00famero do pedido !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_pedido_valor.value) == true){
		alert("O valor do pedido deve ser num\u00e9rico (ex: R$ 1,00 = 100) !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_pedido_valor.value.length < 1){
		alert("Inclua o valor do pedido !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.forma_pagamento_bandeira[3].checked == true && document.requisicao_autorizacao_portador.dados_cartao_numero.value.length < 14){
		alert("O n\u00famero do cart\u00e3o Diners deve conter no m\u00ednimo 14 d\u00edgitos !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.forma_pagamento_bandeira[3].checked == false && document.requisicao_autorizacao_portador.dados_cartao_numero.value.length < 16){
		alert("O n\u00famero do cart\u00e3o Visa, MasterCard, Elo ou Discover deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_numero.value) == true){
		alert("O n\u00famero do cart\u00e3o Visa, Elo, Diners ou MasterCard deve ser num\u00e9rico !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_cartao_validade.value.length < 6){
		alert("A validade deve conter no m\u00ednimo 6 d\u00edgitos Ex:ANOMES(201009) !");
		return false;
	}
	else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_validade.value) == true){
		alert("A validade do cart\u00e3o deve ser num\u00e9rica !");
		return false;
	}
	else if(document.requisicao_autorizacao_portador.dados_cartao_indicador.value == 1){
		if(document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value.length < 3){
				alert("A validade (CVV2) deve conter no m\u00ednimo 3 d\u00edgitos !");
				return false;
		}
		else if(isNaN(document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value) == true){
				alert("A validade deve ser num\u00e9rica !");
				return false;
		}
		return true;
	}
	return true;
}

function bypage_loja(){
	habilita_dados_portador();
	document.requisicao_transacao.bypage[0].checked = true;
}

function bypage_cielo(){
	desabilita_dados_portador();
	document.requisicao_transacao.bypage[1].checked = true;
}

function desabilita_dados_portador(){
	document.requisicao_transacao.dados_portador_numero.disabled = "disabled";
	document.requisicao_transacao.dados_portador_validade.disabled = "disabled";
	document.requisicao_transacao.dados_portador_indicador.disabled = "disabled";
	document.requisicao_transacao.dados_portador_codigo_seguranca.disabled = "disabled";
	document.requisicao_transacao.dados_portador_nome_portador.disabled = "disabled";
	document.requisicao_transacao.bin.disabled = "disabled";
	document.getElementById("dados_cartao1").className = "menu_light";
	document.getElementById("dados_cartao2").className = "menu_light";
	document.getElementById("dados_cartao3").className = "menu_light";
	document.getElementById("dados_cartao4").className = "menu_light";
	document.getElementById("dados_cartao5").className = "menu_light";
}

function habilita_dados_portador(){
	document.requisicao_transacao.dados_portador_numero.disabled = "";
	document.requisicao_transacao.dados_portador_validade.disabled = "";
	document.requisicao_transacao.dados_portador_indicador.disabled = "";
	document.requisicao_transacao.dados_portador_codigo_seguranca.disabled = "";
	document.requisicao_transacao.dados_portador_nome_portador.disabled = "";
	document.requisicao_transacao.bin.disabled = "";
	document.getElementById("dados_cartao1").className = "menu";
	document.getElementById("dados_cartao2").className = "menu";
	document.getElementById("dados_cartao3").className = "menu";
	document.getElementById("dados_cartao4").className = "menu";
	document.getElementById("dados_cartao5").className = "menu";
}

function desabilita_parcelado(){
	document.requisicao_transacao.forma_pagamento_parcelas.value = 1;
}

function habilita_parcelado(){
	document.requisicao_transacao.forma_pagamento_parcelas.value = 2;
}

function desabilita_parcelado_tid(){
	document.requisicao_tid.forma_pagamento_parcelas.value = 1;
}

function habilita_parcelado_tid(){
	document.requisicao_tid.forma_pagamento_parcelas.value = 2;
}

function desabilita_parcelado_aut(){
	document.requisicao_autorizacao_portador.forma_pagamento_parcelas.value = 1;
}

function habilita_parcelado_aut(){
	document.requisicao_autorizacao_portador.forma_pagamento_parcelas.value = 2;
}


function Ambiente_BPL_TESTE(){
	document.requisicao_transacao.dados_ec_numero.value = "<%= BPLTESTmaquineta %>";
	document.requisicao_transacao.dados_ec_chave.value = "<%= BPLTESTchave %>";
	document.requisicao_transacao.ambiente.value = "<%= CBPtestes %>";
	bypage_loja();
}

function Ambiente_BPL_PRODUCAO(){
	document.requisicao_transacao.dados_ec_numero.value = "<%= BPLPRODmaquineta %>";
	document.requisicao_transacao.dados_ec_chave.value = "<%= BPLPRODchave %>";
	document.requisicao_transacao.ambiente.value = "<%= CBPproducao %>";
	bypage_loja();
}

function Ambiente_BPL_TESTE_TID(){
	document.requisicao_tid.dados_ec_numero.value = "<%= BPLTESTmaquineta %>";
	document.requisicao_tid.dados_ec_chave.value = "<%= BPLTESTchave %>";
	document.requisicao_tid.ambiente.value = "<%= CBPtestes %>";
}

function Ambiente_BPL_PRODUCAO_TID(){
	document.requisicao_tid.dados_ec_numero.value = "<%= BPLPRODmaquineta %>";
	document.requisicao_tid.dados_ec_chave.value = "<%= BPLPRODchave %>";
	document.requisicao_tid.ambiente.value = "<%= CBPproducao %>";
}

function Ambiente_BPC_TESTE(){
	document.requisicao_transacao.dados_ec_numero.value = "<%= BPCTESTmaquineta %>";
	document.requisicao_transacao.dados_ec_chave.value = "<%= BPCTESTchave %>";
	document.requisicao_transacao.ambiente.value = "<%= CBPtestes %>";
	bypage_cielo();
}

function Ambiente_BPC_PRODUCAO(){
	document.requisicao_transacao.dados_ec_numero.value = "<%= BPCPRODmaquineta %>";
	document.requisicao_transacao.dados_ec_chave.value = "<%= BPCPRODchave %>";
	document.requisicao_transacao.ambiente.value = "<%= CBPproducao %>";
	bypage_cielo();
}

function bin_cartao(){
	document.requisicao_transacao.bin.value = document.requisicao_transacao.dados_portador_numero.value.substring(0,6);
}

function preenche_cartao_AUTCARDvisa(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[0].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDvisa %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDvisa,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDvisa(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[0].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDvisa %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDvisa,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDmaster(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[1].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDmaster %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDmaster,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDmaster(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[1].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDmaster %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDmaster,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDelo(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[2].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDelo %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDelo,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDelo(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[2].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDelo %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDelo,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDdiners(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[3].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDdiners %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDdiners,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDdiners(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[3].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDdiners %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDdiners,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDdiscover(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[4].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDdiscover %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDdiscover,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDdiscover(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[4].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDdiscover %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDdiscover,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDamex(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[5].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= AUTCARDamex %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(AUTCARDamex,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_CARDamex(){
	if (document.requisicao_transacao.bypage[0].checked == true){
		bypage_loja();
		document.requisicao_transacao.forma_pagamento_bandeira[5].checked = "checked";
		document.requisicao_transacao.dados_portador_numero.value = "<%= CARDamex %>";
		document.requisicao_transacao.dados_portador_validade.value = "<%= CARDvalidade %>";
		document.requisicao_transacao.dados_portador_indicador.value = "1";
		document.requisicao_transacao.dados_portador_codigo_seguranca.value = "<%= CARDcvv2 %>";
		document.requisicao_transacao.dados_portador_nome_portador.value = "<%= CARDholder %>";
		document.requisicao_transacao.bin.value = "<%= Mid(CARDamex,1,6) %>";
	}else{
		alert("BY PAGE CIELO HABILITADO: envio do cart\u00e3o n\u00e3o permitido !");
	}
}

function preenche_cartao_AUTCARDvisa_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[0].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDvisa %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDvisa_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[0].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDvisa %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_AUTCARDmaster_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[1].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDmaster %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDmaster_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[1].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDmaster %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_AUTCARDelo_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[2].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDelo %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDelo_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[2].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDelo %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_AUTCARDdiners_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[3].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDdiners %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDdiners_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[3].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDdiners %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_AUTCARDdiscover_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[4].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDdiscover %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDdiscover_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[4].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDdiscover %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_AUTCARDamex_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[5].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= AUTCARDamex %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function preenche_cartao_CARDamex_2(){
	document.requisicao_autorizacao_portador.forma_pagamento_bandeira[5].checked = "checked";
	document.requisicao_autorizacao_portador.dados_cartao_numero.value = "<%= CARDamex %>";
	document.requisicao_autorizacao_portador.dados_cartao_validade.value = "<%= CARDvalidade %>";
	document.requisicao_autorizacao_portador.dados_cartao_indicador.value = "1";
	document.requisicao_autorizacao_portador.dados_cartao_codigo_seguranca.value = "<%= CARDcvv2 %>";
	document.requisicao_autorizacao_portador.dados_cartao_nome_portador.value = "<%= CARDholder %>";
}

function alerta_cancelamento(){
	alert("CANCELAMENTO: Esta funcionalidade deve ser utilizada somente para testes !");
}

function limpar_formulario(){
	habilita_dados_portador();
	habilita_parcelado();
}

function limpar_formulario2(){
	document.requisicao_autorizacao_tid.tid.value = ""
	document.requisicao_autorizacao_tid.dados_ec_numero.value = ""
	document.requisicao_autorizacao_tid.dados_ec_chave.value = ""
}

function limpar_formulario3(){
	document.requisicao_captura.tid.value = ""
	document.requisicao_captura.dados_ec_numero.value = ""
	document.requisicao_captura.dados_ec_chave.value = ""
	document.requisicao_captura.dados_ec_valor.value = ""
	document.requisicao_captura.dados_ec_anexo.value = ""
}

function limpar_formulario4(){
	document.requisicao_cancelamento.tid.value = ""
	document.requisicao_cancelamento.dados_ec_numero.value = ""
	document.requisicao_cancelamento.dados_ec_chave.value = ""
}

function limpar_formulario5(){
	document.requisicao_consulta.tid.value = ""
	document.requisicao_consulta.dados_ec_numero.value = ""
	document.requisicao_consulta.dados_ec_chave.value = ""
}

function limpar_formulario6(){
	document.requisicao_tid.dados_ec_numero.value = ""
	document.requisicao_tid.dados_ec_chave.value = ""
}
-->
</script>
