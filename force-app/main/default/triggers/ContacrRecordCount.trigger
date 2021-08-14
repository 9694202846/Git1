trigger ContacrRecordCount on Contact (before insert) {
    for (Contact c : trigger.new) {
    Record_Count__c record = new Record_Count__c();
    record.Object_Name__c = 'Contact';
    record.Created_By__c= userinfo.getName();
    insert record;
    }

}