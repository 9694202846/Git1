trigger taskopp on Task (after insert,after update) {
   

   

    Map<Id, Opportunity> accountsToBeUpdated = new Map<Id, Opportunity>();
    
    for( Task t : trigger.new )
    {
        if( trigger.isInsert
            || ( trigger.isUpdate
                && ( trigger.oldMap.get( t.Id ).ActivityDate != t.ActivityDate
                    || trigger.oldMap.get( t.Id ).Description != t.Description )
                )
            )
        {
            if( t.WhatId != null && String.valueOf( t.WhatId ).startsWith( '006' ))
            {
                Opportunity acc = new Opportunity( Id = t.WhatId );
                
                acc.payal09__comments__c = t.Description;
                
                accountsToBeUpdated.put( acc.Id, acc );
            }
        }
    }
    
    if( accountsToBeUpdated.values().size() > 0 )
        update accountsToBeUpdated.values();
}