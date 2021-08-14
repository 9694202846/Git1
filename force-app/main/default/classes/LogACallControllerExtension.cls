public with sharing class LogACallControllerExtension {

    public Task task;
    ApexPages.Standardcontroller controller;

    public LogACallControllerExtension(ApexPages.StandardController controller) {
    User u = [select firstname,Id ,LastName from user where id=:userinfo.getuserid()];    
            this.task = (Task)controller.getRecord();     
           
          
            this.task.status = 'Completed';
            this.task.Subject ='Call'; 
            this.task.OwnerId =u.Id;
            this.task.ActivityDate= date.today();
            this.controller = controller;

         
    }
   
    
    
    
   
}