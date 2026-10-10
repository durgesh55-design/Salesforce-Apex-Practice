trigger CaseRelatedContacta on Case (before insert)
{
    //Write a trigger, do not allow more than 3 Cases to relate with contact per Day. 
	//Note: Every day up to 3 cases can be related to Contact.
	  
    Set<Id>CaseList = New Set<Id>();
    for(Case ca : Trigger.new)
    {
        If(ca.ContactId != null)
        {
            CaseList.add(ca.ContactId);
        }
    }
    List<Case>calist = [Select Id, ContactId FROM Case Where ContactId IN : CaseList and CreatedDate = Today];
        
            for(Case c2 : trigger.new)
    {
        if(calist.size() >= 3)
        {
            c2.addError('Every day up to 3 cases and per day 3 only cases can be related to Contact.');
        }
        
    }
}