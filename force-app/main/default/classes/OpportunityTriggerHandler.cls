public class OpportunityTriggerHandler {
    public static void BloqueiaIntegracao(List<Opportunity> Opp) {
        // Antigo apenas para referencia
        /*List<OpportunityContactRole> Oppcontacts = New List<OpportunityContactRole>();
        for(Opportunity OppA : Opp){
            Oppcontacts = [SELECT id,contact.email,contact.fistname,contact.lastname from OpportunityContactRole where Opportunityid =: OppA.id AND Role =: 'Responsável Financeiro'];
            if(Oppcontacts.size()=0){
            oppA.addError( 'É necessario ter o papel financeiro alinhado na oportunidade.');
            }
        }*/

        Map<Id, List<OpportunityContactRole>> mapOppContacts = new Map<Id, List<OpportunityContactRole>>();
        
        for(OpportunityContactRole ocr : [SELECT Id, Opportunityid from OpportunityContactRole where Opportunityid IN: Opp AND Role =: 'Responsável Financeiro']) {
            if (mapOppContacts.containsKey(ocr.OpportunityId)) {
                mapOppContacts.get(ocr.OpportunityId).add(ocr);
            } else {
                mapOppContacts.put(ocr.OpportunityId, new List<OpportunityContactRole>{ocr});
            }
        }

        for(Opportunity oppA : Opp) {
            if(mapOppContacts.containsKey(oppA.Id) && mapOppContacts.get(oppA.Id).size() == 0){
                oppA.addError( 'É necessario ter o papel financeiro alinhado na oportunidade.');
            }
        }


        // Resposta Etapa 3: Para a situação acima, qual o problema que ele traz? como podemos contornar o caso?
        // o problema é a execução da query dentro do FOR, podendo facilmente atingir os limites da plataforma de 100 operações de forma sincrona
        // A melhor forma de resolver é utilizando variáveis de coleções, como Map, Set ou List, nesse caso utilizei o Map pois precisava agrupar
        // os registros por oportunidade
    }
}