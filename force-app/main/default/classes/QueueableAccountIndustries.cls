public with sharing class QueueableAccountIndustries implements System.Queueable {
    
    public List<Account> accInlist;
    public QueueableAccountIndustries(List<Account> records) {
        this.accInlist = records;
    }

    public void execute(System.QueueableContext context) {
        for(Account acc : accInlist) {
            if (String.isBlank(acc.Industry)) {
                acc.Industry = 'Your Industry field is empty';
            }            
        }
        update accInlist;
        }
   }
