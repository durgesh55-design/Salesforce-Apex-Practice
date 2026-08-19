@RestResource(urlMapping ='/ContactUniqueName/*')
global class RestAPIs {
    
//In this class we are creating the REST API for Contact Object with the help of HTTP Methods like GET, POST, PATCH, PUT and DELETE.

    @httpGet global static List<Contact> ExportData()
    {
        RestRequest GetHTTPRequest = RestContext.request;
        String getUri = GetHTTPRequest.requestUri;
        Integer getId = getUri.Lastindexof('/')+1;
        String RecordId = getUri.Substring(getId);
        
        List<Contact> conlist = [SELECT Id , LastName , FirstName , Phone , Email From Contact Where Id = :RecordId];
        return conlist;
    }
    
    @httpPost global static void InsertRecord(String Cn, String Ce )
    {
        Contact con = new Contact();
        con.LastName=Cn;
        con.Email=Ce;
        insert con;
    }
    
    @httpPatch global static void UpdateRecord(String Cm , String Cp)
    {
        RestRequest GetExecuteRequest = RestContext.Request;
        String GetURI = GetExecuteRequest.RequestUri;
        Integer GetId = getURI.Lastindexof('/')+1;
        String RecordId = GetURI.Substring(GetId);
        
        List<Contact> conlist = [SELECT Id , LastName , FirstName , Phone , Email From Contact Where Id = :RecordId];
        
        for(Contact con : conlist)
        {
            con.Email=Cm;
            con.Phone=Cp;
        }
        Update conlist;
        
    }
    
    @httpPut global static void UpsertRecord(String Cm , String Cp)
    {
        RestRequest GetExecuteRequest = RestContext.Request;
        String GetURI = GetExecuteRequest.RequestUri;
        Integer GetId = getURI.Lastindexof('/')+1;
        String RecordId = GetURI.Substring(GetId);
        
        List<Contact> conlist = [SELECT Id , LastName , FirstName , Phone , Email From Contact Where Id = :RecordId];
        
        for(Contact con : conlist)
        {
            con.Email=Cm;
            con.Phone=Cp;
        }
        Update conlist;
    }
    
    @httpDelete global static void DeleteRecord()
    {
        RestRequest GetExecuteRequest = RestContext.request;
        String GetURI = GetExecuteRequest.requesturi;
        integer GetId = GetURI.Lastindexof('/')+1; 
        String RecordId = GetURI.Substring(GetId);
        
        List<Contact> conlist = [SELECT Id , LastName , FirstName , Phone , Email From Contact Where Id = :RecordId];
        Delete conlist;
    }
}