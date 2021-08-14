trigger UpdateAccount on Opportunity (After insert,After Update) {
   for(Opportunity opp:Trigger.new){
       if(opp.StageName== 'Closed Won' && Opp.AccountId !=null){
           
           
           Account acclist=[Select id , Name from Account where id=:opp.AccountId Limit 1];
           system.debug(acclist);
       
           
           acclist.Name='Client';
           
            update acclist;
       }
 
   }
}