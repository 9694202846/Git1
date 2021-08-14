trigger acccontrigger on Account (before insert, before update) {
  
 
   
   //This queries all Contacts related to the incoming Account records in a single SOQL query   without fetching Account data.
   List<Contact> Cons = [select id, salutation, description,
   firstname, lastname, email from Contact where AccountId IN :Trigger.newMap.keySet()];
 
   for(Contact c: Cons){
 
      c.Description=c.salutation + ' ' + c.firstName + ' ' + c.lastname;
      c.payal09__NRI__c =True;

 
   }
    
   update Cons;
}