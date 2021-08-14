trigger taskcountonaccount  on Task ( before update) {

    set<Id> set_Id = new set<Id>();
   
    List<Account>acc_list = new List<Account>();
    
    if(Trigger.isInsert || Trigger.isUpdate) {
        for(Task T:trigger.new){
            set_Id.add(T.What.Id);
        }

     }
    else if(Trigger.isDelete){
        for(Task T:Trigger.old){
            set_Id.add(T.What.Id);
        }

     }
     
    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert || Trigger.isDelete)){
        acc_list=[SELECT Id, NumberOfEmployees, (SELECT Id FROM Tasks) FROM Account WHERE Id IN :set_Id];

     for(Account acc: acc_list){
        if(acc.Tasks.size()>0)
            acc.NumberOfEmployees = acc.Tasks.size();
        else
            acc.NumberOfEmployees= 0;
     }
        if(!acc_list.isEmpty())
            update acc_list;
        }



}