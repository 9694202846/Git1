trigger AccountAddressTrigger on Account (before insert,before update) {
    for(Account aa:trigger.new){
        if(aa.BillingPostalCode !=Null
           && aa.Match_Billing_Address__c==true ){
               aa.ShippingPostalCode=aa.BillingPostalCode;
       
           }
                
               
               
           }
        
        
        
        
        
    }