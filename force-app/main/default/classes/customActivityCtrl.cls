/* 
 * Source : SfdcMonkey.com
 * Date : 9/01/2020
 * API : 47.0
*/

public class customActivityCtrl {
    @AuraEnabled 
    public static List<task> fetchTask(){
        return [SELECT Id,Subject,Description,ActivityDate,Who.Name,WhoId,Priority
                FROM Task 
                LIMIT 20];
        
        //system.debug(fetchTask+'fetchTask');
    }
    //return fetchTask;
}