({
    handleClick : function (cmp, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
    },
    handleClick1 : function (cmp, event, helper) {
       helper.helperMethodp(cmp, event, helper);
    },
    
});