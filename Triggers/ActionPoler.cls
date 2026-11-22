 public class actionpoller1 {  
    public datetime dateandtime{get;set;}  
    public void datetimemethod()  
    {  
        dateandtime=system.now();  
    }  
}  

<apex:page controller="actionpoller1">  
    <apex:form>  
        <apex:pageBlock id="pb">  
            <apex:actionPoller action="{!datetimemethod}" reRender="pb" interval="5" />  
             time:{!dateandtime}  
                refresh 5 mins  
           </apex:pageBlock>  
  </apex:form>  
</apex:page> 