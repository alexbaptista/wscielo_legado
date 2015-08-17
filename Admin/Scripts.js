<script language="javascript">
<!--

function valida8(){
	if(document.config.CBPtestes.value.length == "" || document.config.CBPproducao.value.length == ""){
		alert("Insira a URL do ambiente !");
		return false;
	}
	else if(document.config.BPCTESTmaquineta.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Cielo - testes\" deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.BPCTESTmaquineta.value) == true){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Cielo - testes\" deve ser num\u00e9rica !");
		return false;
	}
	else if(document.config.BPCPRODmaquineta.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Cielo - produ\u00e7\u00e3o\" deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.BPCPRODmaquineta.value) == true){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Cielo - produ\u00e7\u00e3o\" deve ser num\u00e9rica !");
		return false;
	}
	else if(document.config.BPLTESTmaquineta.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Loja - testes\" deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.BPLTESTmaquineta.value) == true){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Loja - testes\" deve ser num\u00e9rica !");
		return false;
	}
	else if(document.config.BPLPRODmaquineta.value.length < 10){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Loja - produ\u00e7\u00e3o\" deve conter no m\u00ednimo 10 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.BPLPRODmaquineta.value) == true){
		alert("O n\u00famero de afilia\u00e7\u00e3o \"Buy Page Loja - produ\u00e7\u00e3o\" deve ser num\u00e9rica !");
		return false;
	}
	else if(document.config.BPCTESTchave.value == "" || document.config.BPCPRODchave.value == "" || document.config.BPLTESTchave.value == "" || document.config.BPLPRODchave.value == ""){
		alert("Insira a chave !");
		return false;
	}
	else if(document.config.AUTCARDvisa.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Visa\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDvisa.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Visa\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDvisa.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Visa\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDvisa.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Visa\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.AUTCARDmaster.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado MasterCard\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDmaster.value) == true){
		alert("O n\u00famero do cart\u00e3o teste\"Autenticado MasterCard\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDmaster.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado MasterCard\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDmaster.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado MasterCard\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.AUTCARDelo.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Elo\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDelo.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Elo\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDelo.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Elo\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDelo.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Elo\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.AUTCARDdiners.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Diners\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDdiners.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Diners\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDdiners.value.length < 14){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Diners\" deve conter no m\u00ednimo 14 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDdiners.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Diners\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.AUTCARDdiscover.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Discover\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDdiscover.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Discover\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDdiscover.value.length < 16){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Discover\" deve conter no m\u00ednimo 16 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDdiscover.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Discover\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.AUTCARDamex.value.length < 15){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Amex\" deve conter no m\u00ednimo 15 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.AUTCARDamex.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"Autenticado Amex\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDamex.value.length < 15){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Amex\" deve conter no m\u00ednimo 15 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDamex.value) == true){
		alert("O n\u00famero do cart\u00e3o teste \"N\u00e3o Autenticado Amex\" deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDholder.value.length == ""){
		alert("Insira o nome do portador teste !");
		return false;
	}
	else if(document.config.CARDvalidade.value.length < 6){
		alert("Insira a validade teste (AAAAMM) !");
		return false;
	}
	else if(isNaN(document.config.CARDvalidade.value) == true){
		alert("A validade teste deve ser num\u00e9rico !");
		return false;
	}
	else if(document.config.CARDcvv2.value.length < 3){
		alert("O cvv2 teste n\u00e3o pode ser menor do que 3 d\u00edgitos !");
		return false;
	}
	else if(isNaN(document.config.CARDcvv2.value) == true){
		alert("O cvv2 teste deve ser num\u00e9rico !");
		return false;
	}
	document.config.CBPtestes.disabled = "";
	document.config.CBPproducao.disabled = "";
	document.config.BPCTESTmaquineta.disabled = "";
	document.config.BPCTESTchave.disabled = "";
	document.config.BPCPRODmaquineta.disabled = "";
	document.config.BPCPRODchave.disabled = "";
	document.config.BPLTESTmaquineta.disabled = "";
	document.config.BPLTESTchave.disabled = "";
	document.config.BPLPRODmaquineta.disabled = "";
	document.config.BPLPRODchave.disabled = "";
	document.config.AUTCARDvisa.disabled = "";
	document.config.CARDvisa.disabled = "";
	document.config.AUTCARDmaster.disabled = "";
	document.config.CARDmaster.disabled = "";
	document.config.AUTCARDelo.disabled = "";
	document.config.CARDelo.disabled = "";
	document.config.AUTCARDdiners.disabled = "";
	document.config.CARDdiners.disabled = "";
	document.config.AUTCARDdiscover.disabled = "";
	document.config.CARDdiscover.disabled = "";
	document.config.AUTCARDamex.disabled = "";
	document.config.CARDamex.disabled = "";
	document.config.CARDholder.disabled = "";
	document.config.CARDvalidade.disabled = "";
	document.config.CARDcvv2.disabled = "";
	return true;
}

function unlock_1(){
	if(document.config.CBPtestes.disabled == true){
		document.config.CBPtestes.disabled = false;
	}
	else{
		document.config.CBPtestes.disabled = true;
	}
}

function unlock_2(){
	if(document.config.CBPproducao.disabled == true){
		document.config.CBPproducao.disabled = false;
	}
	else{
		document.config.CBPproducao.disabled = true;
	}
}

function unlock_3(){
	if(document.config.BPCTESTmaquineta.disabled == true){
		document.config.BPCTESTmaquineta.disabled = false;
	}
	else{
		document.config.BPCTESTmaquineta.disabled = true;
	}
}

function unlock_4(){
	if(document.config.BPCTESTchave.disabled == true){
		document.config.BPCTESTchave.disabled = false;
	}
	else{
		document.config.BPCTESTchave.disabled = true;
	}
}

function unlock_5(){
	if(document.config.BPCPRODmaquineta.disabled == true){
		document.config.BPCPRODmaquineta.disabled = false;
	}
	else{
		document.config.BPCPRODmaquineta.disabled = true;
	}
}

function unlock_6(){
	if(document.config.BPCPRODchave.disabled == true){
		document.config.BPCPRODchave.disabled = false;
	}
	else{
		document.config.BPCPRODchave.disabled = true;
	}
}

function unlock_7(){
	if(document.config.BPLTESTmaquineta.disabled == true){
		document.config.BPLTESTmaquineta.disabled = false;
	}
	else{
		document.config.BPLTESTmaquineta.disabled = true;
	}
}

function unlock_8(){
	if(document.config.BPLTESTchave.disabled == true){
		document.config.BPLTESTchave.disabled = false;
	}
	else{
		document.config.BPLTESTchave.disabled = true;
	}
}

function unlock_9(){
	if(document.config.BPLPRODmaquineta.disabled == true){
		document.config.BPLPRODmaquineta.disabled = false;
	}
	else{
		document.config.BPLPRODmaquineta.disabled = true;
	}
}

function unlock_10(){
	if(document.config.BPLPRODchave.disabled == true){
		document.config.BPLPRODchave.disabled = false;
	}
	else{
		document.config.BPLPRODchave.disabled = true;
	}
}

function unlock_11(){
	if(document.config.AUTCARDvisa.disabled == true){
		document.config.AUTCARDvisa.disabled = false;
	}
	else{
		document.config.AUTCARDvisa.disabled = true;
	}
}

function unlock_12(){
	if(document.config.CARDvisa.disabled == true){
		document.config.CARDvisa.disabled = false;
	}
	else{
		document.config.CARDvisa.disabled = true;
	}
}

function unlock_13(){
	if(document.config.AUTCARDmaster.disabled == true){
		document.config.AUTCARDmaster.disabled = false;
	}
	else{
		document.config.AUTCARDmaster.disabled = true;
	}
}

function unlock_14(){
	if(document.config.CARDmaster.disabled == true){
		document.config.CARDmaster.disabled = false;
	}
	else{
		document.config.CARDmaster.disabled = true;
	}
}

function unlock_15(){
	if(document.config.AUTCARDelo.disabled == true){
		document.config.AUTCARDelo.disabled = false;
	}
	else{
		document.config.AUTCARDelo.disabled = true;
	}
}

function unlock_16(){
	if(document.config.CARDelo.disabled == true){
		document.config.CARDelo.disabled = false;
	}
	else{
		document.config.CARDelo.disabled = true;
	}
}

function unlock_20(){
	if(document.config.AUTCARDdiners.disabled == true){
		document.config.AUTCARDdiners.disabled = false;
	}
	else{
		document.config.AUTCARDdiners.disabled = true;
	}
}

function unlock_21(){
	if(document.config.CARDdiners.disabled == true){
		document.config.CARDdiners.disabled = false;
	}
	else{
		document.config.CARDdiners.disabled = true;
	}
}

function unlock_22(){
	if(document.config.AUTCARDdiscover.disabled == true){
		document.config.AUTCARDdiscover.disabled = false;
	}
	else{
		document.config.AUTCARDdiscover.disabled = true;
	}
}

function unlock_23(){
	if(document.config.CARDdiscover.disabled == true){
		document.config.CARDdiscover.disabled = false;
	}
	else{
		document.config.CARDdiscover.disabled = true;
	}
}

function unlock_24(){
	if(document.config.AUTCARDamex.disabled == true){
		document.config.AUTCARDamex.disabled = false;
	}
	else{
		document.config.AUTCARDamex.disabled = true;
	}
}

function unlock_25(){
	if(document.config.CARDamex.disabled == true){
		document.config.CARDamex.disabled = false;
	}
	else{
		document.config.CARDamex.disabled = true;
	}
}

function unlock_17(){
	if(document.config.CARDholder.disabled == true){
		document.config.CARDholder.disabled = false;
	}
	else{
		document.config.CARDholder.disabled = true;
	}
}

function unlock_18(){
	if(document.config.CARDvalidade.disabled == true){
		document.config.CARDvalidade.disabled = false;
	}
	else{
		document.config.CARDvalidade.disabled = true;
	}
}

function unlock_19(){
	if(document.config.CARDcvv2.disabled == true){
		document.config.CARDcvv2.disabled = false;
	}
	else{
		document.config.CARDcvv2.disabled = true;
	}
}
-->
</script>
