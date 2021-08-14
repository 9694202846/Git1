public class ContactInsertClass {
@AuraEnabled
public static contact insertContact(string parentAccountId,string firstName1,string lastName1)
{
    system.debug('Test');
    contact con=new contact();
    con.firstName=firstName1;
    con.lastName=lastName1;
    con.accountid=parentAccountId;
    insert con;
    return con;
 
}

}