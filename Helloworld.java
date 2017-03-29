package logic;

import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

public class Helloworld{

	String a;
	String temppswd;
    Timer timer;


    public Helloworld(int seconds) {
       
        timer = new Timer();
        
        a="spandana0123456789bharath0123456789shiva0123456789sanjay";
        Random rnd = new Random();
        StringBuilder ab = new StringBuilder(4);
        for(int i =0;i<8;i++){
        	ab.append(a.charAt(rnd.nextInt(a.length())));
        }
        temppswd = ab.toString();
        System.out.println("my name is " + temppswd);
        timer.schedule(new RemindTask(), seconds*1000);
        
    }

    class RemindTask extends TimerTask {
        public void run() {
             
        System.out.println("Time's up!");
        temppswd ="";
        System.out.println("my name is " + temppswd);
        
        timer.cancel(); //Terminate the timer thread
        }
    }

    public static void main(String args[]) {
        new Helloworld(10);
        System.out.println("Task scheduled.");
        
    }
}