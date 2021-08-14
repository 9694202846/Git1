trigger Lazyemployee on Case (before insert) {
     for(Case newCases:Trigger.new){
  newCases.Status = 'Closed';
   newCases.OwnerId = '00528000000hzcD';
    
  }
  }