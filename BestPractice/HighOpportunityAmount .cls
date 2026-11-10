public class HighOpportunityAmount
{
	//How would you retrieve the five Opportunities with the highest Amount?
	public static void Method()
    {
        List<Opportunity>Result = [SELECT Id ,Amount , Name , StageName FROM Opportunity ORDER BY Amount DESC LIMIT 5];
        
        for(Opportunity opp : Result)
        {
            System.debug('Opportunity Name: ' + opp.Name);
            System.debug('Amount' + opp.Amount);
            System.debug('StageName' + opp.StageName);
        }
            
    }
}