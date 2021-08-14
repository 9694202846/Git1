trigger duplicatecontactacc on Account (before insert) {
    List<Contact>  conlist =  new List<Contact>();
    for(Account acc:trigger.new){
        Contact con = new Contact();
        conlist.add(con);
          Contact[] contacts= [select id from Contact where FirstName = :con.FirstName and LastName = :con.LastName and Email = :con.Email];
        if (contacts.size() > 0) {
          con.LastName.addError('Contact cannot be created - Contact already exists');
      }    
      
    }
       insert conlist;
}