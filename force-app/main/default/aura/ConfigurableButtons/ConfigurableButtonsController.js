({
    doInit : function(component, event, helper) {
        var action = component.get("c.getButtonConfigLabel");
        action.setParams({
            configName : 'My Button'
        });
        
        component.get("v.button01_mdt");
    }
})
