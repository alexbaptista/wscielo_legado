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
<body bgcolor="black">
<b>Notas Simulador</b>
<br />
<br />
1 - Todas as requisições são submetidas no formato (encoding do XML) como ISO-8859-1, padrão para América latina, devido aos caracteres especiais.
<br />
<br />
1 – O retorno das requisições retornam “sem” este encoding, porém eu faço o tratamento para que o XML esteja dentro do padrão.
<br />
<br />
<img src="Imagens/Encoding_exemplo.png" />
<br />
<br />
3 – Não efetuo o tratamento do “nós” do XML retorno, justamente por ser um simulador o mesmo tem como obrigação exibir os valores exatamente como retornado do ambiente, no caso a Cielo, com exceção do encoding. 
<br />
<br />
4 -  Não há ações disponíveis para ordenação e exclusão do XML, por justamente se houver qualquer tipo de ação não autorizada no ambiente de produção, tais como um cancelamento ou uma captura, assim podemos identificar o requisitante.
</body>
</html>