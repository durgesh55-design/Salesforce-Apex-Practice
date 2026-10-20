public class ContactEmailPrevent 
{
    //Prevent duplicate Contacts based on Email.
    
    public static void BeforeInsert(List<Contact>NewList)
    {
        List<Contact> conlist = [SELECT Id,Email FROM Contact WHERE Email != Null];
        
        For(Contact con : NewList)
        {
            for(Contact con2 : conlist)
            {
                if(con.Email == con2.Email && con.Email != Null)
                {
                    con.Email.addError('Same Email is not allowed!');
                }
            }
        }
    }

}