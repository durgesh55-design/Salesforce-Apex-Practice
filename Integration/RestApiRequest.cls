HttpRequest req = new HttpRequest();

// Set the endpoint URL for the REST API request. 
// Replace 'your-org' with your Salesforce org's domain and 'v66.0' with the desired API version. 
// The endpoint is set to create a new Account record in Salesforce.

req.setEndpoint(
    'https://your-org.my.salesforce.com/services/data/v66.0/sobjects/Account/'
);

req.setMethod('POST');

req.setHeader(
    'Authorization',
    'Bearer ' + accessToken
);

req.setHeader(
    'Content-Type',
    'application/json'
);

req.setBody(
    '{"Name":"ABC Technologies"}'
);

Http http = new Http();
HttpResponse res = http.send(req);

System.debug(res.getStatusCode());
System.debug(res.getBody());