public with sharing class WrapperIntStringDisplayClass {

    // Creating lists for the object Testing__c and DataLoadTest__c.
    List<Testing__c > lsttest = new List<Testing__c >();
    List<DataLoadTest__c> lstdlt = new List<DataLoadTest__c>();

    // Creating List for Wrapper class
    public List<wrapper> lstw = new List<wrapper>();

    // Get method calling from PageBlockTable and return the list of wrapper to Table
    public List<wrapper> getLstwrapperIntString() {

        lsttest = [select name,city__c from Testing__c];
        lstdlt = [select country__c,phone__c from DataLoadTest__c];
        
        for(Integer i=0;i<lstdlt.size();i++){
            lstw.add(new wrapper(lsttest[i].name,lsttest[i].city__c,lstdlt[i].country__c,lstdlt[i].phone__c));
        }
        return lstw;

    }

    // Wrapper Class Construction

    public class wrapper{

        public String Tname{get;set;}
        public String Tcity{get;set;}
        public String Dcountry{get;set;}
        public String Dphone{get;set;}
        
        // Wrapper class constructor

        public wrapper(String Tname,String Tcity,String Dcountry,String Dphone){
            this.Tname=Tname;
            this.Tcity=Tcity;
            this.Dcountry=Dcountry;
            this.Dphone=Dphone;
        }

    }

}