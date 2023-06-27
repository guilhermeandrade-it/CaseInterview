public class LeadTriggerHandler {
    public static void onBeforeInsert(List<Lead> newLeads) {
        for(Lead lead : newLeads) {
            if(String.isNotBlank(Lead.PostalCode)) {
                if(validaCEP(Lead.PostalCode)) {
                    lead.PostalCode = lead.PostalCode.contains('-') ? lead.PostalCode : lead.PostalCode.substring(0, 5) + '-' + lead.PostalCode.substring(5);
                } else {
                    lead.addError('Formato de CEP inválido.');
                }
            }
        }
    }

    public static void onBeforeUpdate(Map<Id, Lead> updatedLeads, Map<Id, Lead> oldLeads) {        
        for(Lead lead : updatedLeads.values()) {
            if(String.isNotBlank(Lead.PostalCode)) {

                if(validaCEP(Lead.PostalCode)) {
                    lead.PostalCode = lead.PostalCode.contains('-') ? lead.PostalCode : lead.PostalCode.substring(0, 5) + '-' + lead.PostalCode.substring(5);
                } else {
                    lead.addError('Formato de CEP inválido.');
                }
            }
        }
    }

    private static Boolean validaCEP(String postalCode) {
        Pattern pattern = Pattern.compile('\\d{5}-?\\d{3}');
        Matcher matcher = pattern.matcher(postalCode);
        return matcher.matches();
    }
}