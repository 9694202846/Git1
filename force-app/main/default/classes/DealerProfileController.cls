public with sharing class DealerProfileController {
    
    private Account acc;
    
    public DealerProfileController(ApexPages.StandardController stdController) {         
        this.acc = (Account)stdController.getRecord();
    }
    
    public Id getImage(){
        String imageName = '%'+acc.Parent.Name+'%logo%';
        system.debug(imageName +'imageName');
        Id imageId;
        List<Id> listContentDocId = new List<Id>();
        List<ContentDocumentLink> contLink = [SELECT Id, ContentDocumentId FROM ContentDocumentLink  WHERE LinkedEntityId =: acc.ParentId];
        system.debug(contLink +'contLink');
        if(!contLink.isEmpty()){
            for(ContentDocumentLink co : contLink){
                listContentDocId.add(co.ContentDocumentId);
            }
            if(!listContentDocId.isEmpty()){
                List<ContentVersion> contentVer = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE ContentDocumentId IN : listContentDocId AND Title LIKE : imageName LIMIT 1];
                system.debug(contentVer +'contentVer');
                if(!contentVer.isEmpty()){
                    imageId = contentVer[0].Id;
                }
            }
        }
        return imageId;
    } 
}