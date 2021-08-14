trigger oppreneval on Opportunity (before insert,after insert) {
List<Opportunity> OpprtunityList = [select id, Amount from Opportunity where Amount!=null];
   
        for(Opportunity opp  : trigger.new){
            Opp.Amount= opp.Amount/2;
            OpprtunityList.add(opp);

            /*Opportunity oppclone = new Opportunity();
            oppclone.Amount = opp.Amount;
            OpprtunityList.add(oppclone); */

        }
    insert OpprtunityList;

}