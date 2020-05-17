trigger trgReq on SOBJECT (before update) {

    List<SObject> reqToUpdate = new List<SObject>();

    //check that the type field is updated
    if(Trigger.isBefore && Trigger.isUpdate){
        for(SObject rnew : Trigger.new){
            SObject rold = Trigger.oldMap.get(rnew.Id);
            if(rold.Type__c != rnew.Type__c){
                rnew.Owner = username;
                reqToUpdate.add(rnew);
            }

        }
        update reqToUpdate;
    }
    //if yes, change its owner field to a user or queue
}