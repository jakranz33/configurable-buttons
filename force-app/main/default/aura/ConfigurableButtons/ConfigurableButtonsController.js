({
    doInit : function(component, event, helper) {
        var action = component.get("c.getButtonConfig");

        action.setParams({
            configName : component.get("v.button01_mdt_name")
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.button01_mdt", response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        $A.enqueueAction(action);
    },
    button_01_click : function(component, event, helper) {
        var navService = component.find("navService");
        var navAttributes = '' + component.get("v.button01_mdt").Button_Configuration__c.toString();
        
        console.log(navAttributes);
        try {
            var pageRef = JSON.parse(navAttributes);
        } catch(e) {
            alert(e);
        }
        

        console.log(pageRef);
        event.preventDefault();
        navService.navigate(pageRef);
    }
})
