/*toggleCssController.js*/
({
    DisplayAccount : function(component, event, helper) {
        var toggleDiv = component.find("Account");
        $A.util.toggleClass(toggleDiv, "toggle");
    }
})