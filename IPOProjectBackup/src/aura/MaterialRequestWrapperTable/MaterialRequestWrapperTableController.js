({
	materialselected : function(component, event, helper) {
        helper.fetchSelectedMaterialRequestWrap(component, event, helper);
        //alert(''+ event.currentTarget.id);
    },
    approveMaterialRequest : function(component, event, helper) {
        helper.approveMaterialRequest(component, event, helper);
    },
    approeMaterialCancel : function(component, event, helper) {
        component.set("v.rowSelected",false);
    }
})