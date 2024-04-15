import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class NumberDisplay extends JFrame {
    
    private JTextField textField;
    private JButton startButton;
    private volatile boolean running = false;

    public NumberDisplay() {
        setTitle("Number Display");
        setSize(300, 100);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        textField = new JTextField(10);
        textField.setEditable(false);
        startButton = new JButton("Start");
        
        startButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                if (!running) {
                    running = true;
                    startButton.setEnabled(false);
                    new Thread(new NumberRunnable()).start();
                }
            }
        });
        
        JPanel panel = new JPanel();
        panel.add(textField);
        panel.add(startButton);
        add(panel);
    }

    private class NumberRunnable implements Runnable {
        public void run() {
            for (int i = 1; i <= 100; i++) {
                if (!running) return;
                try {
                    SwingUtilities.invokeAndWait(new Runnable() {
                        public void run() {
                            textField.setText(Integer.toString(i));
                        }
                    });
                    Thread.sleep(100); // Adjust delay as needed
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            running = false;
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    startButton.setEnabled(true);
                }
            });
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new NumberDisplay().setVisible(true);
            }
        });
    }
}
