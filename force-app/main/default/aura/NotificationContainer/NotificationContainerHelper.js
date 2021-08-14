({
    
    shiftDiv: function(component, event,lWidth) {
        
        var changeposition = component.get("v.intervalId");
        var float = component.find("p1");
        if(typeof float === 'undefined'){
            console.log("float Undefined helper");
        }else{
            var floatElement = component.find("p1").getElement();
            if(component.get("v.mouseover") == true){	  
                if(changeposition < lWidth){
                floatElement.style.setProperty('left', changeposition+'px');
                
                    changeposition = changeposition + 5;
                    component.set("v.intervalId",changeposition);
                }
                //reset the left to 0
                else{
                    component.set("v.intervalId",0);
                    floatElement.style.setProperty('left', '0px');
                    changeposition = component.get("v.intervalId");//resetting so as to hit the if block again
                }
            }
        }
    }
})