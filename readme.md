# Code Challenge - Swift

## Descrição:

A Liga dos Surfistas Prateados precisa de ajuda para saber as condições atmosféricas das praias onde acontecem seus eventos de Surf, e, para isso, convocou a Finxi para construir um aplicativo de apresentação destas condições aos participantes das competições!
Sua missão é construir um MVP de consulta das condições atmosféricas a partir do nome de uma cidade – usando para isso a API pública RapidAPI Open Weather Map.

## Requisitos do MVP

Aplicativo criado usando a linguagem nativa Swift – iOS – para consulta das condições atmosféricas. Consumir a API pública para obtenção dos dados.

- Tela com um campo texto para informar apenas o nome da cidade – e.g. Florianópolis;
- Botão consultar condições atmosféricas;
- Considerar validações e apresentação de mensagens adequadas em caso de falha de validação;
- Consumir API e carregar dados;
- Apresentar os seguintes dados de condição atmosférica: Latitude e Longitude da cidade informada – Temperatura atual, máxima e mínima – Velocidade e direção do vento – Pressão e humidade relativa do ar;
- Apresentar no sistema métrico;
- Permitir compartilhamento com o WhatsApp – OPCIONAL.

## Observações

Design pattern usado foi o MVC.

Dentro do Model foi criado um WeatherManager que é reutilizavel para outros projetos, usado delegate methods. Outra extension que foi utilizada é CoreLocation, onde o app usa a localização atual do usuário para poder determinar a localização.
