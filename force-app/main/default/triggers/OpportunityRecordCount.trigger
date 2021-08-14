trigger OpportunityRecordCount on Opportunity__c (before insert) {
  for(Opportunity__c opp : trigger.new){
        Record_Count__c record=new Record_Count__c();
        record.Object_Name__c = 'Opportunity';
        record.Created_By__c = userinfo.getName();
        insert record;
    }
}