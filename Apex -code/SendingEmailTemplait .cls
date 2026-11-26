//19.sending email template to outbound message  
  
public class emailprogramme3 {  
    public void emailmethod()  
    {  
        messaging.SingleEmailMessage m1=new messaging.SingleEmailMessage();  
        emailtemplate et=[select id from emailtemplate where name='doctor' ];  
        m1.setTemplateId(et.Id);  
        contact c=[select id,lastname,phone from contact where phone='999'];  
        m1.setTargetObjectId(c.id);  
        Inputout__c D=[select id,Doctor_Name__c from Inputout__c limit 1];  
        m1.setWhatId(D.Id);  
        messaging.Email[] m2=new messaging.Email[]{m1};  
            messaging.sendEmail(m2);  
          
          
    }  
  
} 