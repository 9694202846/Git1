trigger taskcount1 on Task (before insert) {


    set<Id> set_Id = new set<Id>();
   
    List<Package_Detail__c>packlist = new List<Package_Detail__c>();
    
    if(Trigger.isInsert || Trigger.isUpdate) {
        for(Task T:trigger.new){
            set_Id.add(T.What.Id);
        }

     }
    else if(Trigger.isDelete){
        for(Task T:Trigger.old){
            set_Id.add(T.What.Id);
            system.debug(T.WhatId);
        }

     }
     
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert || Trigger.isDelete)){
        packlist=[SELECT Id,Count__c, (SELECT Id FROM Tasks) FROM Package_Detail__c WHERE Id IN :set_Id];
 system.debug(packlist);
     for(Package_Detail__c pack: packlist){
         if(pack.Tasks.size()>0){
            pack.Count__c= pack.Tasks.size();
         system.debug( pack.Count__c);
         }else
            pack.Count__c = 0;
     }
        if(!packlist.isEmpty())
            update packlist;
        }

}