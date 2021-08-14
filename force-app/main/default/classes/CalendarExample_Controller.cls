public class CalendarExample_Controller {
 
    public Boolean includeMyEvents {get;set;}
    public list<calEvent> events {get;set;}     
    public string location_1 {get;set;}
        public string locate;
    public Boolean show{get;set;}
   
    String dtFormat='yyyy-MM-dd HH:mm:ss ';
    
    public CalendarExample_Controller() {        
    show =true;
       system.debug('@@@@@@@@@@@@@@@@@@@');
            
       includeMyEvents = true;
    
    }       
    public PageReference pageLoad() {
    
    locate=location_1;
   
    
 /*   if(locate=='None'){
            show =False;
        }
        else{
            show =True;
        
      */
    
    
       system.debug('@@@@@@@@@@@@@'+locate);
            events = new list<calEvent>();
            for(Contact cont : [select Id, Birthdate, FirstName, LastName from Contact where Birthdate != null]){
            DateTime startDT = datetime.newInstance(Date.Today().Year(),cont.Birthdate.Month(), cont.Birthdate.Day());            
            calEvent bday = new calEvent();            
            bday.title = cont.FirstName + ' ' + cont.LastName + '\'s Birthday!';            
            bday.allDay = true;            
            bday.startString = startDT.format(dtFormat);            
            bday.endString = '';            
            bday.url = '/' + cont.Id;            
            bday.className = 'event-birthday';
            events.add(bday);
             }
         
        
     /*   for(Campaign camp : [select Id, Name, StartDate, EndDate from Campaign where IsActive = true]){
            DateTime startDT = camp.StartDate;
            DateTime endDT = camp.EndDate;
            calEvent campEvent = new calEvent();
             
            campEvent.title = camp.Name;
            campEvent.allDay = true;
            campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = endDT.format(dtFormat);
            campEvent.url = '/' + camp.Id;
            campEvent.className = 'event-campaign';
            events.add(campEvent);
        }                
         */
          if(location_1=='Summary'){
         for(Opportunity__c camp : [select Id,End_Date_Time__c,Location__c,Start_Date_Time__c,Name,Stage__c,CreatedDate,Close_Date__c from Opportunity__c where Stage__c ='Closed Won' and Start_Date_Time__c!=null and End_Date_Time__c!=null ]){               
            DateTime startDT = camp.Start_Date_Time__c;
            DateTime endDT = camp.End_Date_Time__c;
            Datetime ss=endDT.addDays(1);
            calEvent campEvent = new calEvent();
              campEvent.title = camp.Name  + ' ' + camp.Location__c ;
            campEvent.allDay = true;
            campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = ss.format(dtFormat);
            campEvent.url = '/' + camp.Id;
            campEvent.className ='event-Asif';
            events.add(campEvent);   
                     
        }        
         for(Opportunity__c camp : [select Id,End_Date_Time__c,Location__c,Start_Date_Time__c,Name,Stage__c,CreatedDate,Close_Date__c from Opportunity__c where Stage__c !='Closed Won' and Start_Date_Time__c!=null and End_Date_Time__c!=null ]){
           
            system.debug('@@@@@@@@@@@@@@@@@@@@@@'+camp.CreatedDate);
           // DateTime startDT = camp.CreatedDate;
            DateTime startDT = camp.Start_Date_Time__c;
            DateTime endDT = camp.End_Date_Time__c;
            Datetime ss=endDT.addDays(1);
            calEvent campEvent = new calEvent();
            
            campEvent.title = camp.Name + ' ' +camp.Location__c;
            campEvent.allDay = true;
         // campEvent.startString = startDT.format(dtFormat);
            campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = ss.format(dtFormat);
            system.debug('@@@@@@@@@@@@@@@@@@@@@@'+campEvent.startString);
            campEvent.url = '/' + camp.Id;
            campEvent.className = 'event-Asif1';
            events.add(campEvent);
                  }
        
        
        
      }
      
      else{
      
      for(Opportunity__c camp : [select Id,End_Date_Time__c,Location__c,Start_Date_Time__c,Name,Stage__c,CreatedDate,Close_Date__c from Opportunity__c where Stage__c ='Closed Won' and Start_Date_Time__c!=null and End_Date_Time__c!=null and Location__c=:locate]){
         
       
            DateTime startDT = camp.Start_Date_Time__c;
            DateTime endDT = camp.End_Date_Time__c;
            Datetime ss=endDT.addDays(1);
            calEvent campEvent = new calEvent();
            campEvent.title = camp.Name + ' ' + camp.Location__c;
            campEvent.allDay = true;
              campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = ss.format(dtFormat);
            campEvent.url = '/' + camp.Id;
            campEvent.className = 'event-Asif';
            events.add(campEvent);
            
        }         
           
         for(Opportunity__c camp : [select Id,End_Date_Time__c,Location__c,Start_Date_Time__c,Name,Stage__c,CreatedDate,Close_Date__c from Opportunity__c where Stage__c !='Closed Won' and Start_Date_Time__c!=null and End_Date_Time__c!=null and Location__c=:locate]){
             system.debug('@@@@@@@@@@@@@@@@@@@@@@'+camp.CreatedDate);
           // DateTime startDT = camp.CreatedDate;
            DateTime startDT = camp.Start_Date_Time__c;
            DateTime endDT = camp.End_Date_Time__c;
            Datetime ss=endDT.addDays(1);
            calEvent campEvent = new calEvent();
            
            campEvent.title = camp.Name + ' ' + camp.Location__c;
            campEvent.allDay = true;
         // campEvent.startString = startDT.format(dtFormat);
            campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = ss.format(dtFormat);
            system.debug('@@@@@@@@@@@@@@@@@@@@@@'+campEvent.startString);
            campEvent.url = '/' + camp.Id;
            campEvent.className = 'event-Asif1';
            events.add(campEvent);
                }
      
      
      
      
      
      }  
    /*  if(includeMyEvents){
            for(Event evnt: [select Id, Subject, isAllDayEvent, StartDateTime, EndDateTime from Event where OwnerID = :UserInfo.getUserId()]){
                DateTime startDT = evnt.StartDateTime;
                   DateTime endDT = evnt.EndDateTime;
                calEvent myEvent = new calEvent();
                 
                myEvent.title = evnt.Subject;
                myEvent.allDay = evnt.isAllDayEvent;
                myEvent.startString = startDT.format(dtFormat);
                myEvent.endString = endDT.format(dtFormat);
                myEvent.url = '/' + evnt.Id;
                myEvent.className = 'event-personal';
                events.add(myEvent);
                
                
            }
        }*/
        return null;
    }
     /* public PageReference toggleMyEvents() {
        if(includeMyEvents){
            includeMyEvents = false;
        }
        else{
            includeMyEvents = true;
        }
        pageload();
        return null;
    }*/
          
    public class calEvent{
        public String title {get;set;}
   
        public Boolean allDay {get;set;}
        public String startString {get;set;}
        public String endString {get;set;}
        public String url {get;set;}
        public String className {get;set;}
    }
}