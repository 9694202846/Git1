public class SearchBeerController {
    @AuraEnabled 
    public static List<payal09__Beer__c> SearchBeer(string SearchKeyWord){
        string likeparam ='%'  +SearchKeyWord+'%';
        string Query= '';
        if(SearchKeyWord != null){
            Query= 'select id,Name,payal09__Price__c,payal09__Tags__c from payal09__Beer__c where Name Like:likeparam LIMIT 10';
        }else{
            Query= 'select id,Name,payal09__Price__c,payal09__Tags__c from payal09__Beer__c  LIMIT 10';
            
        }
        
        system.debug(Query);
        List<SObject> sobjectList = database.query(Query);
        return sobjectList;
        
    }
    
}