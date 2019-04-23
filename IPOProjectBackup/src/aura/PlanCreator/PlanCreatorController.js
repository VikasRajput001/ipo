({
    doInit : function(component, event, helper) {
		helper.fetchTypePicklistValue(component, event, helper);
	},
    saveForm : function(component, event, helper) {
		alert('SAVE');
	},
    cancelForm : function(component, event, helper) {
		alert('cancel');
	}
})