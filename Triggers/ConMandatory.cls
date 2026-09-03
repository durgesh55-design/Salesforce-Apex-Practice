trigger ConDepartment on Contact (before insert)
{
    //If Contact Department = IT, make Phone mandatory.
    
    For(Contact con : Trigger.new)
    {
        if(con.Department == 'IT')
        {
            con.Phone.addError('If Contact Department = IT, make Phone mandatory.');
        }
    }

}