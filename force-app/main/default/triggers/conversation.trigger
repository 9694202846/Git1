trigger conversation on Lead (after update) {
   
 
    if(trigger.new.size() > 1 ) 
            return;
   
    if (trigger.old[0].isConverted == false && trigger.new[0].isConverted == true) {
         
        // if a new contact was created
        if (Trigger.new[0].ConvertedContactId != null) {
            Contact contCk = new Contact();
            contCk.Description = trigger.new[0].ConvertedContactId;
            contCk.AssistantName = trigger.new[0].Name;
        }
        // if a new account was created
        if (Trigger.new[0].ConvertedAccountId != null) {
            Account  acc= new Account();
            acc.Description=Trigger.new[0].ConvertedAccountId;
            acc.Name=Trigger.new[0].Name;
            //Similarly customize the converted account
        }
        // if a new opportunity was created
        if (Trigger.new[0].ConvertedOpportunityId != null) {
            Opportunity opp=new Opportunity();
            opp.Description=trigger.new[0].ConvertedOpportunityId;
            opp.Name=Trigger.new[0].Name;
            //Similarly customize the converted Opportunity
        }
    }

}