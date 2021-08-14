({
    onPageReferenceChange: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        var id = account.id;
        cmp.set("v.id", id);
    }
})