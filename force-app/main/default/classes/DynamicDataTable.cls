public class DynamicDataTable {
  @AuraEnabled 
    public static CoulmnAndDataWrapper getFieldSet(String sObjectName, List<String>listOfFields, String linkOnField, boolean isRelatedList, String relatedField, 
                                                   boolean isFieldSet, String fieldSetName, string recordId, string whereClause) { 
        CoulmnAndDataWrapper cdw = new CoulmnAndDataWrapper(); 
        List<Columns> columns = new List<Columns>(); 
        String fieldsToFetch = ''; 
        Set<String> linkOnFieldSet = new Set<String>();
        Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe();
        Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(sObjectName);
       	if(linkOnField != null) {
            linkOnFieldSet.addAll(linkOnField.split(','));
        }
        if(isFieldSet){
            Schema.FieldSet fieldSetObj = SObjectTypeObj.getDescribe().FieldSets.getMap().get(fieldSetName);
            List<Schema.FieldSetMember> fieldSetMemberList =  fieldSetObj.getFields();
            for(Schema.FieldSetMember fieldSetMemberObj : fieldSetMemberList){
                String fieldName= fieldSetMemberObj.getFieldPath();
                String parentName = fieldName;
                if(linkOnFieldSet.size() > 0 && linkOnFieldSet.contains(fieldName)){
                    if(fieldName.contains('__c')){
                        parentName = fieldName.replace('__c', '__r.Name');
                    }
                    if( fieldName.indexOf('Id') == fieldName.length()-2) {
                        parentName = fieldName.substring(0, fieldName.length()-2)+'.Name';
                    }
                    columns.add(new Columns(fieldName,'linkName','url', true, fieldName,parentName)); 
                }else{
                    columns.add(new Columns(fieldSetMemberObj.getLabel(), fieldName, String.valueOf(fieldSetMemberObj.getType()).toLowerCase(), true,fieldName, parentName)); 
                }
                if(fieldsToFetch != ''){ 
                    fieldsToFetch += ','; 
                } fieldsToFetch += fieldSetMemberObj.getFieldPath(); 
                if(parentName != fieldName ) {
                    fieldsToFetch += ','+parentName;
                }
            }
        }else{
            Map<String, Schema.SobjectField> fmap = SObjectTypeObj.getDescribe().fields.getMap();
            
            for(String f : listOfFields ){
                f = f.trim();
                String parentName = f;
                if(linkOnFieldSet.size() > 0 && linkOnFieldSet.contains(f)){ 
                    if(f.contains('__c')){
                        parentName = f.replace('__c', '__r.Name');
                    }
                    if( f.indexOf('Id') == f.length()-2) {
                        parentName = f.substring(0, f.length()-2)+'.Name';
                    }
                    columns.add(new Columns(fmap.get(f).getDescribe().getLabel(),'linkName','url', true, f,parentName)); 
                } else{ 
                    columns.add(new Columns(fmap.get(f).getDescribe().getLabel(), f, String.valueOf(fmap.get(f).getDescribe().getType()).toLowerCase(), true, f,parentName)); 
                } 
                if(fieldsToFetch != ''){ 
                    fieldsToFetch += ','; 
                } fieldsToFetch += f; 
                if(parentName != f ) {
                    fieldsToFetch += ','+parentName;
                }
            }
        }
        
        List<sObject> listData = new List<sObject>();
        if(isRelatedList){
            if(whereClause != null && whereClause != ''){
                listData = Database.query('Select Id, ' + fieldsToFetch + ' From ' + sObjectName + ' where '+whereClause+' AND '+ relatedField + ' = :recordId '); 
            }else{
                listData = Database.query('Select Id, ' + fieldsToFetch + ' From ' + sObjectName + ' where '+ relatedField + ' = :recordId '); 
            }
        }else{
            if(whereClause != null && whereClause != ''){
                listData = Database.query('Select Id, ' + fieldsToFetch + ' From ' + sObjectName + ' where '+whereClause);
            }else{
                listData = Database.query('Select Id, ' + fieldsToFetch + ' From ' + sObjectName );
            }
        }
        cdw.columns = columns; 
        cdw.listData = listData; 
        return cdw; 
    }
    
    public class Columns{ 
        @AuraEnabled public String label; 
        @AuraEnabled public String fieldName; 
        @AuraEnabled public String type; 
        @AuraEnabled public boolean sortable; 
        @AuraEnabled public String parentFieldName; 
        @AuraEnabled public String parentFieldLabel; 
        public Columns(String label, String fieldName, String type, boolean sortable, String parentFieldName, String parentFieldLabel){ 
            this.label = label; 
            this.fieldName = fieldName; 
            this.type = type; 
            this.sortable = sortable;
            this.parentFieldName = parentFieldName;
            this.parentFieldLabel = parentFieldLabel;
        } 
    }
    
    public class CoulmnAndDataWrapper{ 
        @AuraEnabled public List<Columns> columns; 
        @AuraEnabled public List<sObject> listData; 
    } 
    
  
}