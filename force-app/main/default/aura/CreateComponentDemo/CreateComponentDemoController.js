({
    CreateNewButton : function(component, event, helper) {
        var isButtonVisible = component.get("v.IsBottonVisible");
        if(isButtonVisible == false){
            $A.createComponent(
                "lightning:button",
                {
                    "aura:id": "UniqueAuraId",
                    "label": "Destroy Me",
                    "onclick": component.getReference("c.DestroyMe")
                },
                function(newButton, status, errorMessage){
                    if (status === "SUCCESS") {
                        var body = component.get("v.body");
                        body.push(newButton);
                        component.set("v.body", body);
                        isButtonVisible= true;
                        component.set("v.IsBottonVisible", isButtonVisible);
                    }
                    else if (status === "ERROR") {
                        console.log("Error: " + errorMessage);
                    }
                }
            );
        }      
    },

    DestroyMe : function(cmp) {
        // Find the button by the aura:id value
        console.log("button: " + cmp.find("UniqueAuraId"));
        var comp = cmp.find("UniqueAuraId")
        comp.destroy();
        cmp.set("v.IsBottonVisible", false);
    }

})