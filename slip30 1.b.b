import java.applet.Applet;
import java.awt.*;

public class MovingCar extends Applet implements Runnable {
    int x = 0;
    int y = 150;
    Thread t;

    public void init() {
        setBackground(Color.cyan);
        setForeground(Color.BLACK);
    }

    public void start() {
        t = new Thread(this);
        t.start();
    }

    public void run() {
        try {
            while (true) {
                x += 5;
                if (x > getWidth()) {
                    x = 0;
                }
                repaint();
                Thread.sleep(100);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void paint(Graphics g) {
        g.setColor(Color.RED);
        g.fillRect(x, y, 150, 100);

        g.setColor(Color.BLUE);
        g.fillRect(x + 10, y + 10, 130, 40);

        g.setColor(Color.BLACK);
        g.fillOval(x + 25, y + 80, 30, 30);
        g.fillOval(x + 95, y + 80, 30, 30);
    }
}
