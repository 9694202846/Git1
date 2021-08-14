trigger opprecord on Opportunity (after insert) {
    if(trigger.IsInsert){
    List<Package__c> packlist=new List<Package__c>();
    for(Opportunity opp:Trigger.new){
        
            Package__c pack=new Package__c();
            pack.Stay__c='Tent Stay';
        pack.Opportunity__c=opp.Id;
       
                
                
                
                
                packlist.add(pack);
            
            
            
            
            
            
            
            
        }
        insert packlist;
        
        
        
        
    }
    }