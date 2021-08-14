public with sharing class EmailUtility {

    /*
        Returns template based on API name.
        If not found, function returns emty email template.
    */
    public static EmailTemplate getTemplate(String templateName) {
        EmailTemplate template = null;
        try {
            template = [SELECT Id, Name, Subject, HtmlValue 
                        FROM EmailTemplate 
                        WHERE DeveloperName =: templateName LIMIT 1];
        } catch (Exception e) {
            //ApexLog.error('Fetching email template failed for: ' +templateName, 'EmailTemplate', e);
        }
        return template;
    }

    
    /* 
        Replaces the strings defined in mapper (parameter) in template.
        Returns email body as a String in HTML format.
    */
    public static String TemplateToHTMLConstrutor(EmailTemplate template, Map<String,String> mapper) {
        String htmlBody = template.HtmlValue;

        for (String key: mapper.keySet()) {
            String value = (mapper.get(key) != null) ? mapper.get(key) : '';
            htmlBody = htmlBody.replace(key, value);
        }

        return htmlBody;
    }
    
    /*
        Returns organization wide email based on email address given.
        If not found, function creates no-reply@telia.fi address and logs error.
    */
   /* public static OrgWideEmailAddress getEmailSenderAddress(String addressAPIName) {
        OrgWideEmailAddress systemEmailAddress;
        Org_Specific_Conf__mdt setting;
        try {
            setting = [SELECT Id, Email__c FROM Org_Specific_Conf__mdt WHERE DeveloperName = :addressAPIName];
        } catch (Exception e) {
            ApexLog.error('Fetching Org_Specific_Conf__mdt failed: ' +addressAPIName, 'Org_Specific_Conf__mdt', e);
        }
        try {
            systemEmailAddress = [SELECT Id, Address 
                                  FROM OrgWideEmailAddress
                                  WHERE Address =:setting.Email__c LIMIT 1];

        } catch (Exception e) {
            systemEmailAddress = new OrgWideEmailAddress();
            systemEmailAddress.Address = 'no-reply@telia.fi';
            ApexLog.error('Fetching systemEmailAddress failed: ' +addressAPIName, 'OrgWideEmailAddress', e);
        }

        return systemEmailAddress;
    }*/
    /*
        This function handles email sending and crashing.
        Emailtype can be a className.methodName which calls this or some custom naming.
        Remember to use Test.isTest-check when calling this method to avoid sending actually messages during test run.
    */
    public static Boolean sendEmails(String emailType, List<Messaging.SingleEmailMessage> emailsToBeSent) {
        // Send emails and store results
        try {
            List<Messaging.SendEmailResult> results = Messaging.sendEmail(emailsToBeSent);
             // success and error handling
            if(results.size() > 0) {
                if (results[0].success) {
                    System.debug('The email was sent successfully.');
                    return true;
                } else {
                   // ApexLog.error(emailType + ' email sending failed. Error: '+ results[0].errors[0].message, 'SingleEmailMessage',  null);
                    return false;
                }
            } else {
               // ApexLog.debug(emailType + ' did not send any mails.');
                return false;
            }  
        } catch (Exception e) {
           // ApexLog.error(emailType + ' email sending crashed.', 'SingleEmailMessage',  e);
            return false;
        }
    
    }


    /*
        Fetches the url of a logo. Logo should be uploaded to org with the unique name. 
        If logo is not found the function will return an empty string.
    */
    public static String getLogoAddress(String logoUniqueName) {
        String logoExtUrl = null;
        
        try {
            Document logo = [SELECT Id, DeveloperName FROM Document WHERE DeveloperName =:logoUniqueName];
            logoExtUrl = System.URL.getSalesforceBaseUrl().toExternalForm() + '/servlet/servlet.ImageServer?id=' +
            String.valueOf(logo.Id).substring(0, 15) + '&oid=' + String.valueOf(UserInfo.getOrganizationId()).substring(0, 15);

        } catch (Exception e) {
            //ApexLog.error('Organization is missing logo: ' + logoUniqueName, 'Document', e);
        }
        return logoExtUrl;
    }
}