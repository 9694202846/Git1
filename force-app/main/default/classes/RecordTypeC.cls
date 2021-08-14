public class RecordTypeC {
    
    @AuraEnabled
    public static List<RecordType> getListOfRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE SobjectType =\''+'Contact'+'\' ';
        List<RecordType> rtNames = new List<RecordType>();
        Schema.SObjectType  objType = Contact.SObjectType;     
        for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
            System.debug('rt.getName()'+rt.getName());
            rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            System.debug('rtNames'+rtNames);
        } 
        return rtNames; 
    }
    @AuraEnabled
    public string defaultRecordTypeId {get; set;}
    @AuraEnabled
    public Map<Id, String> contactRecordTypes {get; set;}
     
    @AuraEnabled       
    public static SampleAuraController getRecordTypeValues(){
        SampleAuraController obj = new SampleAuraController();
        Map<Id, String> recordtypeMap = new Map<Id, String>();
        //Get all record types of Contact object
        List<Schema.RecordTypeInfo> recordTypeInfoList = Contact.SObjectType.getDescribe().getRecordTypeInfos();
        for(RecordTypeInfo info: recordTypeInfoList) {
            //Check record type is available for current user profile
            if(info.isAvailable()) {
                //Check master record type
                if(info.getName() != 'Master' && info.getName().trim() != ''){
                    recordtypeMap.put(info.getRecordTypeId(), info.getName());
                }
                //Get the default record type for current user profile
                if(info.isDefaultRecordTypeMapping()){
                    obj.defaultRecordTypeId = info.getRecordTypeId();
                }
            }
        }    
        obj.contactRecordTypes = recordtypeMap;
        return obj;
    }
}