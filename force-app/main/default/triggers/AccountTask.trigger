trigger AccountTask on Account (before Delete) {
  List<Task> tasklist=new List<Task>();
    For(Account acc:[SELECT Id,Name FROM ACCOUNT WHERE Match_Billing_Address__c=True AND ID IN:Trigger.new]){
       Task otask=new Task();
       
       
          
            tasklist.add(new Task(Subject = acc.Name,
                                  WhatId = acc.Id));
       
            
        }
    insert tasklist;
        
        
        
        
    
        

}