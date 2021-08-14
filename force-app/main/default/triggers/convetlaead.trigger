trigger convetlaead on Lead (before update) {

    Map<Id,String> leadStatus = new Map<Id,String>(); // Map of the converted Contact ID and the Lead Status

    for(Lead lead : Trigger.new) {
        if (lead.IsConverted) {
            leadStatus.put(lead.ConvertedContactId,lead.Status);
        }
    }
    List<Contact> conContacts = [select Id from Contact WHERE Contact.Id IN :leadStatus.keySet()];
    for ( Contact c : conContacts) {
        c.Department= leadStatus.get(c.Id);
    }
    update conContacts;
}