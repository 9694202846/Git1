trigger taskcount111 on Lead (before update) {

   List<Id> idList =  new List<Id>();
   Integer taskCount = 0 ;
   Integer eventCount = 0 ;
  
   for(lead le : trigger.new){
   idList.add(le.id);    
   }
   
   List<aggregateResult> tskresults = [select count(id) from Task where whoid in:idList and Status!='Completed'];
   system.debug(tskresults);
   for (AggregateResult ar : tskresults )  {
  
   taskCount = (Integer)ar.get('expr0');
}
   
   List<aggregateResult> eventresults = [select count(id) from Event where whoid in:idList ];
   system.debug(eventresults);
   for (AggregateResult ar : eventresults )  {
  
   eventCount = (Integer)ar.get('expr0');
  
}
    for(lead le : trigger.new){
   le.NumberofLocations__c =  taskCount +  eventCount;
        system.debug(le.NumberofLocations__c);
        // field on which Task count and event count needs to be updated
   }
   
}