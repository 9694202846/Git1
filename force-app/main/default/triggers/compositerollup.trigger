trigger compositerollup on Campsite_Reservation__c (after insert,after delete,after update,after undelete) {
    List<id> complist=new List<id>();
    if(Trigger.Isinsert ||Trigger.Isundelete){
        for(Campsite_Reservation__c comp:Trigger.new){
            
            complist.add(comp.Campsite__r.Id);
                }
    }
    
    if(Trigger.IsDelete){
        for(Campsite_Reservation__c comp:Trigger.old){
            complist.add(comp.Campsite__r.Id);
        }
        
    }
    if(Trigger.Isupdate){
         for(Campsite_Reservation__c comp:Trigger.old){
            complist.add(comp.Id);
        }
        
        }
    List<Campsite__c>camplist= new List<Campsite__c>();
    for(Campsite__c campp:[SELECT Count_CR__c ,(SELECT id  FROM Campsite_Reservation__r ) FROM Campsite__c WHERE id =:complist]){
       camplist.add(campp);
        campp.Count_CR__c= campp.Campsite_Reservation__r.size();
        camplist.add(campp);
    }
    try{
        update camplist;
    }Catch(Exception e){
        System.debug('Exception :'+e.getMessage());
    }
    
    

}