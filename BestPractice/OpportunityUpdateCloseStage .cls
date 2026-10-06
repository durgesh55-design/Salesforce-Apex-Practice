public class OpportunityUpdateCloseStage 
{
    //When an opportunity is updated to Closed Lost and Description (field) is not 
	//populated then throw validation error that ‘Description’ on opportunity. 
	
	public void BeforeUpdate(List<Opportunity>NewList)
    {
        for(Opportunity opp : NewList)
        {
            if(opp.StageName == 'Closed Lost' && opp.Description == Null)
            {
				opp.Description.addError('If stage is Closed Lost then Write down Description');
            }
        }
    }
}