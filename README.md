Emulador WebService Cielo

== Sobre

Trata-se de emulador de transações de e-commerce integrado com o Web Service da operadora Cielo

== Requisitos

- Internet Information Services 6.0 ou superior
- Microsoft.Jet.OLEDB.4.0
- Msxml2.ServerXMLHTTP.3.0 ou superior
- Msxml2.DOMDocument.4.0 (http://www.microsoft.com/en-us/download/details.aspx?id=15697)

== Configurações

- Caso IIS 7.5 ou superior, habilitar pool da aplicação para trabalhar com 32 bits
- Aplicar permissão de escrita/leitura para o IUSR_user no diretório "XML" e "WebServiceCieloAdmin"
- Habilitar "Caminhos Pai" (IIS > ASP > Habilitar Caminhos Pai = True)
