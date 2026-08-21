public class schedulepractie11 Implements Schedulable
{
    // This method is used to schedule the class to run at a specific time and frequency Send Email

    public void execute(SchedulableContext Sc)
    {
        Messaging.SingleEmailMessage SEM = new Messaging.SingleEmailMessage();
        List<messaging.SingleEmailMessage> SEMlist = new List<messaging.SingleEmailMessage>();
        List<String> tolist = new List<String>();
        tolist.add('nehapatilll5599@gmail.com');
        List<String> cclist = new List<String>();
        cclist.add('kunalkathore95@gmail.com');
    
       
        SEM.settoaddresses(tolist);
        SEM.setccaddresses(cclist);
        SEM.setSubject('Hiring – Full Stack Developer');
        SEM.setplaintextbody('Dear Candidate,\n Rolex** is hiring **Full Stack Developers** for its development team. Experience:** Fresher / 0–2 Years Skills:** HTML, CSS, JavaScript, React, Node.js, SQL, REST APIs Interested candidates can share their updated resume for further consideration.\n Best Regards,**HR Team**Rolex');
        
        SEMlist.add(SEM);
        Messaging.SendEmail(SEMlist);
        
    }
}