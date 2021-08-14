public class StandardControllerExtension {
Account acct;
public StandardControllerExtension(ApexPages.standardController std){
acct = (Account)std.getRecord();

}
public List<Opportunity> getChildOpps() {
return [Select Name, Amount, StageName, CloseDate
From Opportunity
Where AccountId = :acct.Id
and (IsWon = true or IsClosed = false)];
}
}