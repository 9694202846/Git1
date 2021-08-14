public class CarTypeSearch {
    @AuraEnabled
    public static List<CarType__c> getCarTypes(){
        return[Select Id,Name From CarType__c];
    }
    
}