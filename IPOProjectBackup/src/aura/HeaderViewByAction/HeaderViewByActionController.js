({
    navigate : function(component,event,helper) {
        alert();
     	var urlEvent = $A.get("e.force:navigateToURL");
      	urlEvent.setParams({
        	'url': 'http://www.google.com'
      	});
      	urlEvent.fire();
    }
})