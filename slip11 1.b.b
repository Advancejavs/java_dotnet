import java.sql.*;

public class SalesDetails {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/your_database_name";

    static final String USER = "your_database_username";
    static final String PASS = "your_database_password";

    public static void main(String[] args) {
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName(JDBC_DRIVER);
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to database...");

            stmt = conn.createStatement();
            String sql = "SELECT PID, PName, Qty, Rate, Amount FROM Sales WHERE SaleDate BETWEEN ? AND ?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setDate(1, java.sql.Date.valueOf("2024-01-01")); // Start date
            preparedStatement.setDate(2, java.sql.Date.valueOf("2024-03-31")); // End date

            ResultSet rs = preparedStatement.executeQuery();

            System.out.println("Sales details between selected dates:");
            while (rs.next()) {
                int pid = rs.getInt("PID");
                String pname = rs.getString("PName");
                int qty = rs.getInt("Qty");
                double rate = rs.getDouble("Rate");
                double amount = rs.getDouble("Amount");

                System.out.println("PID: " + pid + ", PName: " + pname + ", Qty: " + qty + ", Rate: " + rate + ", Amount: " + amount);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
