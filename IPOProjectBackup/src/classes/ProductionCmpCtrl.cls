/*

    Description:
    Indicator: Cmp => Component, Ctrl => Controller
*/
public class ProductionCmpCtrl{
    
    @AuraEnabled
    public static MaterialRequestWrapper loadingMaterialQuantityWrap(String objDepartmentIdARG){
        return new MaterialBusinessService().fetchNewMaterialData(objDepartmentIdARG);
    }
    
    @AuraEnabled
    public static String submitMaterialDataWrap(MaterialRequestWrapper objMatReqARG){
        new MaterialBusinessService().createNewMaterialReqData(objMatReqARG);
        return null;
    }
    
    @AuraEnabled
    public static List<MaterialRequestWrapper> loadingMaterialRequestWrap(String objDepartmentIdARG){
        return new MaterialBusinessService().fetchMaterialRequestData(objDepartmentIdARG);
    }
    
    @AuraEnabled
    public static String approveMaterialDataWrap(MaterialRequestWrapper objMatReqARG){
        new MaterialBusinessService().approveMaterialReqData(objMatReqARG);
        return null;
    }
}