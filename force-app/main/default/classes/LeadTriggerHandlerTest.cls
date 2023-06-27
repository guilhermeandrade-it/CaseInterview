@IsTest
public class LeadTriggerHandlerTest {
    @IsTest
    static void testOne(){
        Lead lead = new Lead(LastName = 'LastName', Company = 'Company', PostalCode = '02809000');
        Test.startTest();
        insert lead;
        Test.stopTest();
        System.assertEquals([SELECT PostalCode FROM Lead WHERE Id = :lead.Id].PostalCode, '02809-000', 'CEP não foi validado com sucesso.');
    }

    @IsTest
    static void testTwo(){
        Lead lead = new Lead(LastName = 'LastName', Company = 'Company');
        Test.startTest();
        insert lead;
        lead.PostalCode = '02809-000';
        update lead;
        Test.stopTest();
        System.assertEquals(lead.PostalCode, '02809-000', 'CEP não foi validado com sucesso.');
    }

    @IsTest
    static void testThree(){
        
        Lead lead = new Lead(LastName = 'LastName', Company = 'Company', PostalCode = '028090000');
        Test.startTest();
        try {
            insert lead;
        }
        catch(DmlException e) {
            System.assertEquals('Formato de CEP inválido.', e.getDmlMessage(0), 'Mensagem de erro incorreta.');
        }
        Test.stopTest();
    }
}