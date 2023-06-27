@IsTest
global class WhatsappLeadMessageControllerMock implements HttpCalloutMock {
    Integer statusCode;

    public WhatsappLeadMessageControllerMock(Integer statusCode) {
        this.statusCode = statusCode;
    }
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://graph.facebook.com/v17.0/ID_PHONE/messages', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(this.statusCode);
        return res;
    }
}