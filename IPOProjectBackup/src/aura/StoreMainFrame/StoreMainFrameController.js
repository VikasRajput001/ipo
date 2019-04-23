({
	myAction : function(component, event, helper) {
		
	},
    redirectToMateReqCreator : function(component, event, helper) {
        component.set("v.isMaterialLstViewEnable",false);
	},
    redirectToMateReqLstView : function(component, event, helper) {
        component.set("v.isMaterialLstViewEnable",true);
	}
})