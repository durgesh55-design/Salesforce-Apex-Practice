public class ScheduleDemo Implements Schedulable {


 @future public static void FutureMethod()
    {
        Account acc = new Account();
        acc.Name='KGP';
        acc.Phone='0987654321';
        acc.Rating='Hot';
        Insert acc;
    }

// This method is used to schedule the class to run at a specific time and frequency

  public void execute(SchedulableContext SC)
  {

    ScheduleDemo.FutureMethod(); // Call the future method to insert an Account record asynchronously


      List<Case>LMClosedCases = [SELECT Id FROM Case WHERE ClosedDate = Last_N_Days:15];
      
      Delete LMClosedCases; 
      
  }

}

// This line of code creates an instance of the ScheduleDemo class and schedules
// it to run at 10:30 PM on the 2nd day of every month, deleting cases that were closed in the last 15 days.

//Execute the schedule

ScheduleDemo SD = new ScheduleDemo();
System.schedule('Deleting Last 15 days closed cases' , '0 30 22 2 * ? *',SD);