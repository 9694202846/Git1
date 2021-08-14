trigger Leadtrigger on Lead (after insert ,after update) {
    if(trigger.Isinsert){
    
    List<Task> newtask= new List<Task>();
    
    
          for (Lead  olead : [SELECT Id, Name From Lead WHERE Name!=null AND Id IN :Trigger.new]){
               newtask.add(new Task(Subject = olead.Name,
                                  WhoId = olead.Id));
       
        
        
            
      }
    insert newtask;
    }
  

}