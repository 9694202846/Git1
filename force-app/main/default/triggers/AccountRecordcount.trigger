trigger AccountRecordcount on Account (before insert) {
    for(Account a:trigger.new){
        Record_Count__c record = new Record_Count__c();
        record.Object_Name__c = 'Account'; 
        record.Name='Account';
       record.Created_By__c = userinfo.getName();
        insert record;
    }

}