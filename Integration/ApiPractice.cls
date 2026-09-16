@RestResource(urlMapping = '/AccountUniqueName/*')

//This is Practice API There are two API using Post and Get.

global class RestApiPractice 
{
	@HttpPost global static void InsertData(string Na , string Pa)
    {
        Account acc = new Account();
        acc.Name=Na;
        acc.Phone=Pa;
        
        insert acc;
    }
    
    @HttpGet Global Static List<Account> ExportData()
    {
        RestRequest getExecuteRequest = RestContext.request;
        String GetUri = getExecuteRequest.requesturi;
        Integer GetId = GetUri.LastIndexOf('/');
        String RecordId = GetUri.Substring(getId);
        
       List<Account> conlist = [SELECT Id ,Name From Account Where Id =: RecordId];
        return conlist;
    }
}