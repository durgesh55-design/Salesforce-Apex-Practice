public class UpdatePhoneUsingLoop 
{
    //Update Contact phone numbers for contacts with blank phone numbers using a for loop.

    public static void PhoneUpdateMethod()
    {
        List<Contact> conlist =[SELECT Id,Phone FROM Contact WHERE Phone = Null];
        for(integer i = 0; i < conlist.size(); i++)
        {
            conlist[i].Phone = '901122334'+i;
        }
        Update conlist;
        
        System.debug(conlist);
        
    }
}