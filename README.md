# WebRequest-MQL5

A WebRequest-MQL5 é uma biblioteca em MQL5 que oferece uma interface simples e eficaz para comunicação com servidores web utilizando o protocolo HTTP. Com esta biblioteca, os desenvolvedores podem facilmente realizar solicitações HTTP GET, POST, PUT, DELETE e outras, além de poderem enviar e receber dados de forma segura e eficiente. 

Tornando a integração de aplicativos de negociação algorítmica com serviços web externos fácil. Com uma interface intuitiva e documentação abrangente, a WebRequest-MQL5 simplifica o processo de comunicação com servidores web, proporcionando aos desenvolvedores MQL5 uma poderosa ferramenta para acesso remoto a dados e serviços web.

A biblioteca e compostar por uma arquitetura que permite realizar mocks de cada classe, assim tornando possivel a realização de testes unitários, sem depender de respostas dos pedidos HTTP.

## 🔧 Funcionalidades

- Envio de solicitações HTTP GET, POST, PUT, DELETE e outros métodos.
- Suporte ao formato JSON para envio e recebimento de dados
- Suporte para comunicação segura através de HTTPS.
- Documentação completa e exemplos de uso.

## 📖 Guia de Instalação

1. Abra a pasta de Dados do seu terminal Metatrader5
2. Navegue até `MQL5/Includes`
1. Clone o projeto dentro da pasta `/Includes` do seu Terminal Metatrader5
``` shell
git clone https://github.com/github-joao-pedro/WebRequest-MQL5.git
```


## 👨🏻‍💻 Exemplo de Uso

Aqui está um exemplo simples de como utilizar a biblioteca para fazer uma solicitação HTTP GET para a API Binance
``` c++
#include <WebRequest-MQL5/Http/HttpClient.mqh>

void OnStart()
  {
   //--- Cria objetos de solicitação/pedido/resposta
   CHttpClient client;
   CHttpRequest request;
   CHttpResponse response;

   //--- Define método utilizado e URL
   request.Request(HTTP_METHOD_GET,"https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT");
   
   //--- Verifica se requisição foi feita com successo
   if(client.Send(request,response))
     {
      //--- Imprime resultados
      Print("REQUEST  | ",request.Method().HttpMethodsDescription()," - ",request.Url().Serialize());
      Print("RESPONSE | ",response.Body().Serialize());
     }
  }
```


```
REQUEST  | GET - https://api.binance.com:443/api/v3/avgPrice?symbol=BTCUSDT
RESPONSE | {"mins":5,"price":"45358.93311660","closeTime":1707438768533}
```

## 🔗 Dependências
Este projeto depende da seguinte biblioteca:

- [CJAVal](https://www.mql5.com/en/code/13663) - Serialização e Desserialização JSON (MQL nativo

## 📄 Documentação
A documentação completa das funções na biblioteca em breve estará disponível


## 🤝 Contribuindo

Contribuições são bem-vindas!

Sinta-se à vontade para abrir um problema ou enviar uma solicitação de pull request com melhorias ou correções.

## 📝Licença

A biblioteca WebRequest-MQL5 é lançada sob a licença do MIT. Consulte [LICENSE](./LICENSE) para obter detalhes.





