public class ListViewClass {
    @AuraEnabled
    public static List<ListView> listViewMethod(string ObjectName){
    return [SELECT DeveloperName,Name, SObjectType FROM ListView where SObjectType=:ObjectName];
        
    }
}