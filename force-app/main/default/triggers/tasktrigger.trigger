trigger tasktrigger on Task (before insert) {
    List<Account> acc=new List<Account>();
    for(Task otask:trigger.new){
        if (otask.WhatId != null){
            Opportunity  opp =[ Select id, Suggestion_Category__c, AccountId from Opportunity where id=:otask.WhatId];
            system.debug(opp.AccountId);
            
            otask.Customer__c=opp.Suggestion_Category__c;
  
            
        }
       
     
        
    }
   
     





}