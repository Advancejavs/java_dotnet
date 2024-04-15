Imports System.Data.SqlClient

Public Class Form1

    Dim connectionString As String = "Data Source=YourServerName;Initial Catalog=YourDatabaseName;Integrated Security=True"
    Dim connection As New SqlConnection(connectionString)

    Private Sub CreatePlayerTable()
        Try
            connection.Open()
            Dim query As String = "CREATE TABLE Player (PID INT PRIMARY KEY, PName NVARCHAR(50), Game NVARCHAR(50), no_of_matches INT)"
            Dim command As New SqlCommand(query, connection)
            command.ExecuteNonQuery()
            MessageBox.Show("Player table created successfully.")
        Catch ex As Exception
            MessageBox.Show("Error creating player table: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub InsertRecords()
        Try
            connection.Open()
            Dim query As String = "INSERT INTO Player (PID, PName, Game, no_of_matches) VALUES (1, 'Virat Kohli', 'Cricket', 150), (2, 'Rohit Sharma', 'Cricket', 140)"
            Dim command As New SqlCommand(query, connection)
            command.ExecuteNonQuery()
            MessageBox.Show("Records inserted successfully.")
        Catch ex As Exception
            MessageBox.Show("Error inserting records: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub UpdateMatchesForRohitSharma()
        Try
            connection.Open()
            Dim query As String = "UPDATE Player SET no_of_matches = 141 WHERE PName = 'Rohit Sharma'"
            Dim command As New SqlCommand(query, connection)
            command.ExecuteNonQuery()
            MessageBox.Show("Number of matches updated for Rohit Sharma.")
        Catch ex As Exception
            MessageBox.Show("Error updating matches: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub DisplayRecords()
        Try
            connection.Open()
            Dim query As String = "SELECT * FROM Player"
            Dim adapter As New SqlDataAdapter(query, connection)
            Dim table As New Data.DataTable()
            adapter.Fill(table)
            DataGridView1.DataSource = table
        Catch ex As Exception
            MessageBox.Show("Error displaying records: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CreatePlayerTable()
        InsertRecords()
        UpdateMatchesForRohitSharma()
        DisplayRecords()
    End Sub
End Class
