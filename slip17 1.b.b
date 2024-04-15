import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String filePath = "path_to_your_file"; // Specify the file path here

        // Create a File object with the specified file path
        File file = new File(filePath);

        // Check if the file exists
        if (file.exists()) {
            // If the file exists, display its contents on the client's terminal
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                System.out.println("File Contents:");
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // If the file does not exist, display "File Not Found" message
            System.out.println("File Not Found");
        }
    }
}
