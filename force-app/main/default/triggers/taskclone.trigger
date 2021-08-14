trigger taskclone on Account (before update) {
   List<Task> listtask = new List<Task>();
   for(Account acc:trigger.new){
       
       List<Task> otask =[Select Id, Subject,Status from Task where WhatId =:acc.Id];
       system.debug(otask);
       if(acc.Match_Billing_Address__c ==true){
           for(Task mtask : otask){
               mtask.Status='Completed';
               
               update otask;
           }
           
       }
       else{
           for(Task mtask : otask){
           mtask.Status='Not Started';
           
           }
       }
       
   }

}