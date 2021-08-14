({
 doHandleEvent : function(component, event, helper) {
  var cmpEvnt=component.getEvent("regInChild");
        cmpEvnt.setParams({
            storeMessage : component.get("v.textMessage")     
        });
        cmpEvnt.fire();
 }
})