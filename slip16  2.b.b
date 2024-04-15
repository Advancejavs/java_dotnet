import java.sql.*;
import java.util.Scanner;

public class Main {
    // Database URL, username, and password
    static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name";
    static final String USER = "your_username";
    static final String PASS = "your_password";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            // Accept details of students
            Scanner scanner = new Scanner(System.in);
            for (int i = 0; i < 5; i++) {
                System.out.println("Enter student details (rno, sname, per):");
                int rno = scanner.nextInt();
                String sname = scanner.next();
                double per = scanner.nextDouble();

                // Insert student details into database
                String insertQuery = "INSERT INTO students (rno, sname, per) VALUES (?, ?, ?)";
                try (PreparedStatement preparedStatement = conn.prepareStatement(insertQuery)) {
                    preparedStatement.setInt(1, rno);
                    preparedStatement.setString(2, sname);
                    preparedStatement.setDouble(3, per);
                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // Retrieve details of student with highest percentage
            String selectQuery = "SELECT rno, sname, per FROM students WHERE per = (SELECT MAX(per) FROM students)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(selectQuery)) {
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    System.out.println("Student with highest percentage:");
                    System.out.println("Roll No: " + resultSet.getInt("rno"));
                    System.out.println("Name: " + resultSet.getString("sname"));
                    System.out.println("Percentage: " + resultSet.getDouble("per"));
                } else {
                    System.out.println("No student records found.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
