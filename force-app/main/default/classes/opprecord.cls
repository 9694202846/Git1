@istest
public class opprecord {
    Static testmethod void createrecord(){
        
       Opportunity opp=new Opportunity();
        opp.Name='payal';
        opp.Close_Date__c=Date.today();
        opp.CloseDate=date.today();
        opp.StageName='Prospecting';
        insert opp;
        
        Package__c pack=new Package__c();
        pack.Name='night pack';
        pack.Opportunity__c=opp.Id;
        insert pack;
        
    }

}