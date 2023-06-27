@IsTest
public class WhatsappLeadMessageControllerTest {
    @IsTest
    static void testOne(){
        Test.setMock(HttpCalloutMock.class, new WhatsappLeadMessageControllerMock(200));

        IntegracaoWhatsapp__c integracaoWhatsapp = new IntegracaoWhatsapp__c();
        integracaoWhatsapp.Endpoint__c = 'https://graph.facebook.com/v17.0/ID_PHONE/messages';
        insert integracaoWhatsapp;

        Lead testLead = new Lead();
		testLead.LastName = 'Test Lead';
		testLead.Company = 'Test Lead';
		testLead.Phone = '+5511999999999';
		insert testLead;

        test.startTest();
        ApexPages.StandardController sc = new ApexPages.StandardController(testLead);
        WhatsappLeadMessageController  testLeadWhatsapp = new WhatsappLeadMessageController(sc);
        testLeadWhatsapp.sendMessage();
		test.stopTest();
    }

    @IsTest
    static void testTwo(){
        Test.setMock(HttpCalloutMock.class, new WhatsappLeadMessageControllerMock(400));

        IntegracaoWhatsapp__c integracaoWhatsapp = new IntegracaoWhatsapp__c();
        integracaoWhatsapp.Endpoint__c = 'https://graph.facebook.com/v17.0/ID_PHONE/messages';
        insert integracaoWhatsapp;

        Lead testLead = new Lead();
		testLead.LastName = 'Test Lead';
		testLead.Company = 'Test Lead';
		testLead.Phone = '+5511999999999';
		insert testLead;

        test.startTest();
		
			ApexPages.StandardController sc = new ApexPages.StandardController(testLead);
			WhatsappLeadMessageController  testLeadWhatsapp = new WhatsappLeadMessageController(sc);
			testLeadWhatsapp.sendMessage();
			
		test.stopTest();
    }
}