public with sharing class PicklistBusinessService{
    
    public List<PicklistWrapper> fetchPicklistValue(String objectNameARG,String fieldAPIARG){
        List<PicklistWrapper> lstPickWrap = new List<PicklistWrapper>();
        List<String> lstObjectType = new List<String>();
        lstObjectType.add(objectNameARG);
        List<Schema.DescribeSobjectResult> results = Schema.describeSObjects(lstObjectType);
        for(Schema.DescribeSobjectResult res : results) {
            for(Schema.PicklistEntry entryPicklist : res.fields.getMap().get(fieldAPIARG).getDescribe().getPicklistValues()) {
                lstPickWrap.add(new PicklistWrapper(entryPicklist.getLabel(),entryPicklist.getValue()));
            }
        }
        return lstPickWrap;
    }
    
}