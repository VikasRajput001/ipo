({
    doInit: function(component, event, helper) {
        component.set('v.todayDate', new Date());
        helper.fetchMaterialDataWrap(component, event, helper);
    },
    formSubmit: function(component, event, helper) {
        component.set('v.todayDate', new Date());
        helper.submitMaterialDataWrap(component, event, helper);
        //alert('Submit');
    },
    formCancel: function(component, event, helper) {
        component.set('v.todayDate', new Date());
		helper.redirectToMatReqLstView(component, event, helper);
        //materialRequestLstView
        //alert('Cancel');
    }
})