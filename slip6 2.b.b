Imports System.Data.SqlClient
Imports System.Windows.Forms

Public Class Form1

    Dim connectionString As String = "Data Source=YourServerName;Initial Catalog=YourDatabaseName;Integrated Security=True"
    Dim connection As New SqlConnection(connectionString)

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        CreateTable()
    End Sub

    Private Sub CreateTable()
        Try
            connection.Open()
            Dim query As String = "CREATE TABLE Movies (Mv_Name VARCHAR(50), Release_year INT, Director VARCHAR(50))"
            Dim command As New SqlCommand(query, connection)
            command.ExecuteNonQuery()
            MessageBox.Show("Movie table created successfully.")
        Catch ex As Exception
            MessageBox.Show("Error creating movie table: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub InsertRecord(name As String, releaseYear As Integer, director As String)
        Try
            connection.Open()
            Dim query As String = "INSERT INTO Movies (Mv_Name, Release_year, Director) VALUES (@Mv_Name, @Release_year, @Director)"
            Dim command As New SqlCommand(query, connection)
            command.Parameters.AddWithValue("@Mv_Name", name)
            command.Parameters.AddWithValue("@Release_year", releaseYear)
            command.Parameters.AddWithValue("@Director", director)
            command.ExecuteNonQuery()
            MessageBox.Show("Record inserted successfully.")
        Catch ex As Exception
            MessageBox.Show("Error inserting record: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub DeleteRecords()
        Try
            connection.Open()
            Dim query As String = "DELETE FROM Movies WHERE Release_year = 2022"
            Dim command As New SqlCommand(query, connection)
            Dim rowsAffected As Integer = command.ExecuteNonQuery()
            If rowsAffected > 0 Then
                MessageBox.Show("Records deleted successfully.")
            Else
                MessageBox.Show("No records found to delete.")
            End If
        Catch ex As Exception
            MessageBox.Show("Error deleting records: " & ex.Message)
        Finally
            If connection.State = ConnectionState.Open Then
                connection.Close()
            End If
        End Try
    End Sub

    Private Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click
        InsertRecord(txtName.Text, Convert.ToInt32(txtYear.Text), txtDirector.Text)
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        DeleteRecords()
    End Sub
End Class
