public class BeerController {
    @AuraEnabled 
    public static List<payal09__Beer__c> SearchBeer(){
        
        List<payal09__Beer__c> sobjectList = [Select id,Name from payal09__Beer__c Limit 10];
        return sobjectList;
        
    }
    
}