public with sharing class WhatsappLeadMessageController {
    public Lead lead { get; private set; }

    public WhatsappLeadMessageController(ApexPages.StandardController stdController) {
        lead = [SELECT Id, Name, Phone FROM Lead 
                   WHERE Id = :stdController.getId()];
    }


    public void sendMessage() {
        try {
            Boolean success = IntegracaoWhatsapp.sendMessage(this.lead.Name, this.lead.Phone);
            if(success) {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Mensagem enviada com sucesso'));
            }
            else {
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Ocorreu um erro ao enviar mensagem, contate o administrador do sistema.'));
            }
        }
        catch(Exception ex) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,ex.getMessage()));

        }
    }
}