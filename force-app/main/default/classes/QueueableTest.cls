@isTest
public with sharing class QueueableTest {

    @isTest
    public static void testIndustryUpdate() {
        Account acctest = new Account(Name = 'Test', Industry = '');
        insert acctest;

        List<Account> accs = new List<Account>{acctest};
        System.Test.startTest();
        QueueableAccountIndustries myTestJob = new QueueableAccountIndustries(accs);
        System.enqueueJob(myTestJob);
        System.Test.stopTest();

        Account result = [SELECT Industry FROM Account WHERE Id = :acctest.Id];
        Assert.areEqual('Your Industry field is empty', result.Industry);
    }
}
