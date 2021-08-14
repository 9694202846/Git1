trigger creatingMenuDetails on Opportunity__c (before insert,after update) {
     list<Menu_Detail__c> MD=new list<Menu_Detail__c>();
    for(Opportunity__c op:trigger.new)
    {
        list<Menu_Detail__c> MD1=[select id,Food__c,Amount_Per_Head__c,Activity_Name__c,Description__c,Objective_Category__c,Props_Min_No_Of_Persons__c,name,Opportunity__c from Menu_Detail__c where Opportunity__c=:op.id ];
        list<Package__c> pd=[select id,Activity_Name__c,Food__c,Amount_with_service_Tax__c,Stay__c,name,Amount__c from Package__c where Package_Detail__c=:op.Package_Detail__c  ];
        list<Package__c> pd1=[select id,Activity_Name__c,Food__c,Amount_with_service_Tax__c,Stay__c,name,Amount__c from package__c where Id=:op.Package_Detail__c];
       if(MD1.size()==0)
        {
            for(integer i=0;i<pd1.size();i++)
            {
                Menu_Detail__c om=new Menu_Detail__c();
               om.name=pd1[i].name;
               om.Activity_Name__c=pd1[i].Activity_Name__c;
              om.Amount_Per_Head__c=pd1[i].Amount_With_Service_Tax__c;
              //  om.Stay__c=pd1[i].Stay__c;
                om.Food__c=pd1[i].Food__c;
                MD.add(om);
            }
        }
    }
insert MD;
}