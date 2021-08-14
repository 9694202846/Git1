global class BatchApexExample implements Database.Batchable<sObject> {
//String query = 'SELECT contactId, Contact.AccountId, CampaignId, Campaign.OwnerId FROM CampaignMember 
//WHERE ContactId != null AND Contact.AccountId != null AND Contact.Account.Account_responsible_through_a_campaign__c = null';
 global Database.QueryLocator start(Database.BatchableContext bc) {
return Database.getQueryLocator(


'SELECT contactId, Contact.AccountId, CampaignId, ' +
            'Campaign.OwnerId FROM CampaignMember ' +
            
            'WHERE ContactId != null AND Contact.AccountId != null AND Contact.Account.Account_responsible_through_a_campaign__c = null');
}
global void execute(Database.BatchableContext BC, List<CampaignMember> scope) {

List<Account> accounts = new List<Account>();

Set<Id> accountIds = new Set<Id>();
for(CampaignMember s : scope){
system.debug('accId'+s.Contact.AccountId);

if(!accountIds.contains(s.Contact.AccountId)){
Account a = new Account();
a.Id = s.Contact.AccountId;
a.Account_responsible_through_a_campaign__c = s.Campaign.OwnerId;
accounts.add(a);
system.debug('accounts'+accounts);
accountIds.add(s.Contact.AccountId);
}
}
if(accounts.size() > 0){
update accounts;

}
}


global void finish(Database.BatchableContext BC) {
// execute any post-processing operations like sending email
}
}