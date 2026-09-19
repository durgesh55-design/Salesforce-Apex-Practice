trigger AccountRating on Account (before insert) 
{
    //If Account Rating = Hot, automatically set Ownership = Public.
    
	for(Account acc : Trigger.new)
    {
        if(acc.Rating == 'Hot')
        {
          acc.Ownership = 'Public';
        }
    }
}