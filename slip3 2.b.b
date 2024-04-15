Imports System.Data.SqlClient

Module Module1
    Dim connectionString As String = "Data Source=YourServerName;Initial Catalog=YourDatabaseName;Integrated Security=True"

    Sub Main()
        CreateTeacherTable()
        InsertTeacherRecords()
        SearchTeacher("Seeta")
    End Sub

    Sub CreateTeacherTable()
        Dim createTableQuery As String = "CREATE TABLE Teacher (Tid INT PRIMARY KEY, TName NVARCHAR(50), Subject NVARCHAR(50))"
        ExecuteNonQuery(createTableQuery)
    End Sub

    Sub InsertTeacherRecords()
        Dim insertQueries() As String = {
            "INSERT INTO Teacher VALUES (1, 'John', 'Maths')",
            "INSERT INTO Teacher VALUES (2, 'Alice', 'English')",
            "INSERT INTO Teacher VALUES (3, 'Bob', 'Science')",
            "INSERT INTO Teacher VALUES (4, 'Seeta', 'History')",
            "INSERT INTO Teacher VALUES (5, 'Tom', 'Geography')"
        }

        For Each query As String In insertQueries
            ExecuteNonQuery(query)
        Next
    End Sub

    Sub SearchTeacher(ByVal teacherName As String)
        Dim searchQuery As String = $"SELECT * FROM Teacher WHERE TName = '{teacherName}'"

        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand(searchQuery, connection)
                connection.Open()

                Dim reader As SqlDataReader = command.ExecuteReader()

                If reader.HasRows Then
                    Console.WriteLine("Teacher found:")
                    While reader.Read()
                        Console.WriteLine($"Tid: {reader("Tid")}, TName: {reader("TName")}, Subject: {reader("Subject")}")
                    End While
                Else
                    Console.WriteLine("Teacher not found.")
                End If

                reader.Close()
            End Using
        End Using
    End Sub

    Sub ExecuteNonQuery(ByVal query As String)
        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand(query, connection)
                connection.Open()
                command.ExecuteNonQuery()
            End Using
        End Using
    End Sub
End Module
