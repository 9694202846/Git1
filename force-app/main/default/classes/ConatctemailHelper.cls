public class ConatctemailHelper{
 
public static void emailHelper(List<Contact> contactList){
Set<String> emailValueSet = New Set<String>();
List<Contact> conList = [select id,name,payal09__Company__c,email from contact where payal09__Company__c !=null];
   for(contact con : conList){
  emailValueSet.add(con.payal09__Company__c);
  }
  for(contact con : conList){
        if(!emailValueSet.contains(con.email)){
           con.adderror('gdffdgfdg');
        }
    }


}
}