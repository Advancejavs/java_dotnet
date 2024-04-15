import java.util.Random;

class MyThread extends Thread {
    private String threadName;

    public MyThread(String name) {
        this.threadName = name;
    }

    public void run() {
        System.out.println(threadName + " is created.");

        Random random = new Random();
        int sleepTime = random.nextInt(5000); // Generates random sleep time in range 0 to 4999
        System.out.println(threadName + " will sleep for " + sleepTime + " milliseconds.");

        try {
            Thread.sleep(sleepTime); // Thread sleeps for the generated random sleep time
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println(threadName + " is dead.");
    }
}

public class ThreadLifecycle {
    public static void main(String[] args) {
        MyThread thread1 = new MyThread("Thread 1");
        MyThread thread2 = new MyThread("Thread 2");

        thread1.start(); // Starts thread 1
        thread2.start(); // Starts thread 2
    }
}
