  Imports System.Data.OleDb
Imports System.Data
Public Class Form1
 Private Sub Form1_Load(ByVal senderAs System.Object,ByVal eAs 
System.EventArgs)Handles MyBase.Load
DataSet21.Clear()
Me.OleDbDataAdapter1.Fill(DataSet11,"emp")
end sub

