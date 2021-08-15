public with sharing class AccountController {

    @AuraEnabled
    public static List<Account> findAll() {
        //my first comment
    return [SELECT Id, name,Phone, Location__Latitude__s, Location__Longitude__s
            FROM Account
            WHERE Location__Latitude__s != NULL AND Location__Longitude__s != NULL
            LIMIT 52];
    }

}