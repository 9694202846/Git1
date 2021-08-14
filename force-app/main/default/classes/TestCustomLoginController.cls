public class TestCustomLoginController {

    public PageReference forwardToCustomAuthPage() {
        return null;
    }


    public String username{get; set;}
    public String password {get; set;}

    public pageReference login()
        {  
            return Site.login(username,password,null);
    }
}