 // if Contact Country is Select then State is Manodatory.
 
public class ContactTriggerHandler {
    
    public static void BeforeInsertBeforeUpdate(List<Contact>NewList)
    {
        for(Contact con : NewList) 
        {
            if(con.MailingCountry != Null && con.MailingState == Null)
            {
                con.MailingState.addError('Select State');
            }
        }
    }
}