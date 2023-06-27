public without sharing class IntegracaoWhatsapp {
    public class IntegracaoWhatsappException extends  Exception{}

    public static Boolean sendMessage(String name, String phone){
        IntegracaoWhatsapp__c dadosIntegracao = IntegracaoWhatsapp__c.getOrgDefaults();
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        MessageRequest messageRequest = new MessageRequest();
        messageRequest.messaging_product = 'whatsapp';
        messageRequest.recipient_type = 'individual';
        messageRequest.to = phone; // '+5511982815965'
        messageRequest.type = 'text';
        messageRequest.text = new MessageRequestText();
        messageRequest.text.preview_url = false;
        messageRequest.text.body = 'Olá ' + name + 'tudo bem? Informamos que já estamos analisando seu cadastro para se tornar um de nossos clientes. Em breve retornaremos o contato.';
        
        req.setEndpoint(dadosIntegracao.Endpoint__c);
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json;charset=UTF-8');
        req.setTimeout(100000);
        req.setBody(JSON.serialize(messageRequest));

        try {
            HTTPResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                return true;        
            }
            else {
                throw new IntegracaoWhatsappException('Message: ' + res.getBody());
            }
        } catch (Exception ex) {
            throw new IntegracaoWhatsappException('Message: ' + ex.getMessage() + ' - StackTrace: ' + ex.getStackTraceString());
        }
    }

    public class MessageRequest{
        public String messaging_product;
        public String recipient_type;
        public String to;
        public String type;
        public MessageRequestText text;
    }

    public class MessageRequestText{
        public Boolean preview_url;
        public String body;
    }
}