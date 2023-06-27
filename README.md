# Etapa 1

Criei a visualforce WhatsappLeadMessage que faz a chamada para a api do WhatsApp, infelizmente não consegui fazer uma chamada teste na api por problemas com minha conta do Meta (Responsável pela API)
Para colocar a visualforce poderia utilizar um botão personalizado que faria a conversão do lead e depois redirecionaria para a visualforce de envio de mensagem, porém como não interpretei como sendo o objetivo da etapa não efetuei isso
Como não consegui efetuar a chamada da API fiz uma classe de teste porém ela poderia estar mais completa com System.Asserts e ajuste nos retornos da classe controller, mas novamente interpretei que não era o objetivo da etapa

Classes: IntegracaoWhatsapp, WhatsappLeadMessageController, WhatsappLeadMessageControllerMock, WhatsappLeadMessageControllerTest
Visualforce: WhatsappLeadMessage

# Etapa 2

Criei a Trigger usando uma classe Trigger Handler para realização dessa etapa, utilizei regex para validação do formato e substring para adicionar o hífen caso necessário

Classes: LeadTriggerHandler, LeadTriggerHandlerTest
Trigger: LeadTrigger


# Etapa 3

Para a situação acima, qual o problema que ele traz? como podemos contornar o caso?
Resposta: O problema é a execução da query dentro do FOR, podendo facilmente atingir os limites da plataforma de 100 operações de forma síncrona
 A melhor forma de resolver é utilizando variáveis de coleções, como Map, Set ou List, nesse caso utilizei o Map pois precisava agrupar os registros por oportunidade

 Criei uma classe para alteração do código
 
Classe: OpportunityTriggerHandler
