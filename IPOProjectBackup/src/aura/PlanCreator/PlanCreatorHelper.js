({
	fetchTypePicklistValue : function(component, event, helper) {
		this.commonActionToGetPicklistValue(component, "Plan__c", "Type__c", "v.lstTypePicklistValues");
        this.commonActionToGetPicklistValue(component, "Plan__c", "Status__c", "v.lstStatusPicklistValues");
	},
    commonActionToGetPicklistValue : function(component, objectAPIName, fieldAPIName, assignedLst) {
        var action = component.get("c.fetchPicklist");
		action.setParams({
            objectNameARG : objectAPIName,
            fieldAPIARG : fieldAPIName
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set(assignedLst,response.getReturnValue());
            }else if (state === "INCOMPLETE"){
                alert('INCOMPLETE');
            }else if (state === "ERROR"){
                alert('ERROR');
            }
            //alert(component.get(assignedLst));
        });
        $A.enqueueAction(action);
    }
})