trigger Leadconvert on Lead (after insert,after update) {
     List<Account>acclist=new List<Account>();
     For(Lead olead:[SELECT Id,Name FROM Lead WHERE Status='Closed-Converted' AND Id IN:Trigger.new]){
        Account acc=new Account();
       acclist.add(acc);
        
    }
}
    //List<Opportunity>opplist= new List<Opportunity>([SELECT  Name,StageName,CloseDate FROM Opportunity ]);
   // For(Lead olead:[SELECT Id,Name FROM Lead WHERE Status='Closed - Converted' AND Id IN:Trigger.new]){
        //Opportunity opp=new Opportunity();
       //** opp.Name=olead.Name;
        //opp.StageName='Prospecting';
        //opp.Close_Date__c=date.today()+8 ;
        
       // insert opp;
    //}
   // insert opplist;
   
    // insert acclist;
    //List<Contact>conlist=new List<Contact>();
    // For(Lead olead:[SELECT Id,Name FROM Lead WHERE Status='Closed-Converted' AND Id IN:Trigger.new]){
       // Contact con= new Contact();
       //conlist.add(con);
        
   // }
    //insert conlist;**//