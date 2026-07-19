trigger contactUpdatePhone on Account (After Update,After insert) {
    
//Update the contact phone number whenever an account phone number is updated.

    for(Account accNew : trigger.new){
        
        Account accOld = trigger.oldMap.get(accNew.id);
        
        if(accOld.Phone != accNew.Phone){
            
            List<Contact> conlist = [SELECT Id, Name FROM Contact WHERE accountId =: accNew.id];
            
            for( Contact con : conlist){
                
                con.Phone=accNew.Phone;
            }
            Update conlist;
            
            
        }
    }
}