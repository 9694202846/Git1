public class StandardControllerExtension1 {
Account acct;

public StandardControllerExtension1(ApexPages.standardController std){
acct = (Account)std.getRecord();
}
}