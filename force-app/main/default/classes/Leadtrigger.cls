@isTest
public class Leadtrigger {
    Static testmethod void  createtask(){
        Lead olead =new Lead();
        olead.LastName='Test';
        olead.Company='Hytech';
        olead.Status ='Open- Not Contacted';
        insert olead;
        
        Task newtask=new Task();
        newtask.Subject= olead.Name;
        newtask.Status='Not Started';
        newtask.WhoId=olead.id;
        newtask.OwnerId='00528000000hzcD';
        
    insert newtask;
        }

}