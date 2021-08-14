trigger quoteopp on Quote (after insert, after update) {
   

if(Trigger.isInsert){

    List<Opportunity> opplist = new List <Opportunity>();

    for(Quote qu : trigger.new){

       Opportunity opp = new Opportunity();
        opp.Name = qu.Name;
        opp.Amount = 20000;
        opp.CloseDate = date.today();
        opp.StageName = 'Closed Won';
        opp.AccountId = qu.AccountId;

                                         
                    
                   

        opplist.add(opp);
    }
    insert opplist; 
}

}