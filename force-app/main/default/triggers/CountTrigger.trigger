trigger CountTrigger on Package_Detail__c (before update) {

   List<Id> idList =  new List<Id>();
   Integer taskCount = 0 ;
   Integer eventCount = 0 ;
  
   for(Package_Detail__c le : trigger.new){
   idList.add(le.id);    
   }
   
   List<aggregateResult> tskresults = [select count(id) from Task where whatid in:idList and Status!='Completed'];
   system.debug(tskresults);
   for (AggregateResult ar : tskresults )  {
  
   taskCount = (Integer)ar.get('expr0');
}
   
   List<aggregateResult> eventresults = [select count(id) from Event where whatId in:idList ];
   system.debug(eventresults);
   for (AggregateResult ar : eventresults )  {
  
   eventCount = (Integer)ar.get('expr0');
  
}
    for(Package_Detail__c le : trigger.new){
   le.Count__c =  taskCount +  eventCount;
        system.debug(le.Count__c);
        // field on which Task count and event count needs to be updated
   }
   
}