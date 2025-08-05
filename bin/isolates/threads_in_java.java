// This file is a java file in which we are trying to understand the concept of Thread.
// The code will not execute because VsCode has no extension of java. I write this code in intellij idea and copy paste it here.
import java.io.File;

public class MultiThreading {
    public static void main(String[] args) {
        // These first 3 lines run immediately in the main thread. The variable a is a local variable, and System.out.println(a) will output 10 to the console, and File object will be created. This happens before the new thread is started.
        int a = 10;
        System.out.println(a);
        File file = new File("");

        // Thread class have multiple overloaded constructors but we use thread(new Runnable(){}).
        // new Thread(...) creates a new thread object. Inside Thread, you pass an instance of an anonymous inner class that implements the Runnable functional interface. 
        // The Runnable interface has one method: run(). Whatever code you write inside run() will be executed in the new thread when you call thread.start().
        // If I talk about the code it has nested loops which is a long running operation and after all it's thousands of iterations file.wait() will be called.
        // If we run these loops in main thread definately it will hang the main thread untill the iteration sof loop, so its batter to perform this long running operation in new thread.
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                for (int i = 0; i < 1000; i++) {
                    for (int j = 0; j < 5000; j++) {
                        try {
                            file.wait();  
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e); 
                        }
                    }
                }
            }
        });
        // When you call thread.start(), the run() method will execute in a new thread, running in parallel with the main thread.
        thread.start();
    }
}
// If you add more code after thread.start(); in main, it will also run in main thread, concurrently with the new thread.

