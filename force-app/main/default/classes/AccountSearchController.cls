public with sharing class AccountSearchController {
    public AccountSearchController (ApexPages.StandardController controller) {

    }
    
  // the soql without the order and limit
    private String soql {get;set;}
    private date datevalue{get;set;}
  
  // the collection of contacts to display
    public List<Account>acc{get;set;}

  // the current sort direction. defaults to asc
    public String sortDir {
    get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;}
    set;
    }

  // the current field to sort by. defaults to  name
    public String sortField {
    get{ if (sortField == null) {sortField = 'Name'; } return sortField;}
    set;
    }

  // format the soql for display on the visualforce page
    public String debugSoql {
    get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20'; }
    set;
    }
    

  // init the controller and display some sample data when the page loads
    public AccountSearchController (){
    
    
    soql = 'select Name, AccountNumber,NumberOfEmployees,Type,Description ,SLAExpirationDate__c  from Account where Name !=null';
    runQuery();
    }

  // toggles the sorting of query from asc<-->desc
    public void toggleSort() {
    // simply toggle the direction
    sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
    // run the query again
    runQuery();
    }

  // runs the actual query
    public void runQuery(){

    try {
      acc= Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 20');
    }catch (Exception e) {
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops!'));
    }

    }

  // runs the search with parameters passed via Javascript
    public PageReference runSearch() {
    Id accId= Apexpages.currentPage().getParameters().get('Id');
    String Name= Apexpages.currentPage().getParameters().get('Name');
    String AccountNumber= Apexpages.currentPage().getParameters().get('AccountNumber');
    String Description= Apexpages.currentPage().getParameters().get('Description');
    String SLAExpirationDate = Apexpages.currentPage().getParameters().get('SLAExpirationDate__c  ');
    String Type= Apexpages.currentPage().getParameters().get('Type');
    String objType = String.valueOf(AccountNumber);
  

    soql = 'select Name, AccountNumber,NumberOfEmployees,Type,Description,SLAExpirationDate__c from Account where Name !=null' ;
    if (Name!= null &&!Name.equals(''))
    soql += ' and Name LIKE \''+String.escapeSingleQuotes(Name)+'%\'';  
     
    if (AccountNumber!= null &&!AccountNumber.equals(''))
    soql += ' and AccountNumber LIKE \''+String.escapeSingleQuotes(AccountNumber)+'%\''; 
    if (Type!= null &&!Type.equals(''))
    soql += ' and Type LIKE \''+String.escapeSingleQuotes(Type)+'%\''; 
     
    if (Description!= null &&!Description.equals(''))
    soql += ' and Description LIKE \''+String.escapeSingleQuotes(Description)+'%\'';
    
    if (SLAExpirationDate!= null &&!SLAExpirationDate.equals(''))
    soql += ' and SLAExpirationDate__c  LIKE \''+String.escapeSingleQuotes(SLAExpirationDate )+'%\'';
    
    // run the query again
    runQuery();

    return null;
    }

  // use apex describe to build the picklist values
    public List<String> Type{
    get {
        if (Type== null) {

    Type= new List<String>();
    Schema.DescribeFieldResult field = Account.Type .getDescribe();

        for (Schema.PicklistEntry f : field.getPicklistValues())
          Type.add(f.getLabel());

        }
        return Type;          
    }
    set;
  }

}