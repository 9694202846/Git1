Public class OpportunityCloneHelper{
    public static void OpportunityClone(List<Opportunity> OpportunityList_new){
    List<Opportunity> OpprtunityList = [select id, Amount from Opportunity where Amount!=null];
   
        for(Opportunity opp  : OpprtunityList){
            Opp.Amount= opp.Amount/2;
            OpprtunityList.add(opp);

            Opportunity oppclone = new Opportunity();
            oppclone.Amount = opp.Amount;
            OpprtunityList.add(oppclone);

        }
    insert OpprtunityList;
    }
}