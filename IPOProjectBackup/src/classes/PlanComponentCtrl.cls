public with sharing class PlanComponentCtrl{

    @AuraEnabled
    public static List<PicklistWrapper> fetchPicklist(String objectNameARG,String fieldAPIARG){
        return new PicklistBusinessService().fetchPicklistValue(objectNameARG,fieldAPIARG);
    }
}