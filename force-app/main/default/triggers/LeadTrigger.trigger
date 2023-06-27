trigger LeadTrigger on Lead (before insert, before update) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            LeadTriggerHandler.onBeforeInsert(Trigger.new);
        } else if (Trigger.isUpdate) {
            LeadTriggerHandler.onBeforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
    }
}