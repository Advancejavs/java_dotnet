import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;

public class TrafficSignal extends Applet implements Runnable {

    private int currentSignal = 0; // 0 - Red, 1 - Yellow, 2 - Green
    private Thread thread;
    private boolean running = false;

    public void init() {
        setSize(200, 400);
        setBackground(Color.WHITE);
    }

    public void start() {
        if (thread == null) {
            thread = new Thread(this);
            running = true;
            thread.start();
        }
    }

    public void stop() {
        running = false;
        thread = null;
    }

    public void run() {
        while (running) {
            try {
                Thread.sleep(3000); // Change signal every 3 seconds
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            currentSignal = (currentSignal + 1) % 3;
            repaint();
        }
    }

    public void paint(Graphics g) {
        switch (currentSignal) {
            case 0:
                g.setColor(Color.RED);
                g.fillOval(75, 50, 50, 50); // Red light
                g.setColor(Color.BLACK);
                g.drawOval(75, 50, 50, 50);
                g.setColor(Color.GRAY);
                g.fillOval(75, 150, 50, 50); // Yellow light off
                g.fillOval(75, 250, 50, 50); // Green light off
                break;
            case 1:
                g.setColor(Color.RED);
                g.fillOval(75, 50, 50, 50); // Red light
                g.setColor(Color.BLACK);
                g.drawOval(75, 50, 50, 50);
                g.setColor(Color.YELLOW);
                g.fillOval(75, 150, 50, 50); // Yellow light
                g.setColor(Color.GRAY);
                g.fillOval(75, 250, 50, 50); // Green light off
                break;
            case 2:
                g.setColor(Color.GRAY);
                g.fillOval(75, 50, 50, 50); // Red light off
                g.setColor(Color.YELLOW);
                g.fillOval(75, 150, 50, 50); // Yellow light off
                g.setColor(Color.GREEN);
                g.fillOval(75, 250, 50, 50); // Green light
                g.setColor(Color.BLACK);
                g.drawOval(75, 250, 50, 50);
                break;
        }
    }
}
