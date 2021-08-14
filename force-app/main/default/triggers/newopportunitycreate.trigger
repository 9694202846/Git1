trigger newopportunitycreate on Account (after insert) {
    List<Opportunity> opplist=New List<Opportunity>();
    for(Account acc:[SELECT id ,Name,Type FROM Account WHERE Type='Prospect' AND Id IN:Trigger.new]){
        Opportunity opp=new Opportunity();
        
            opplist.add(opp);
            
            
            
            
            
            
            
            
        
        
        
        
        
    }
    insert opplist;

}