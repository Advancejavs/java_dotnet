10)Write a VB.NET program to accept the details of product (PID, PName, expiry_date, price).Store it into the database and display it on data grid view.



Imports System.Data.OleDb
Imports System.Data
Public Class Form1
 Private Sub Form1_Load(ByVal senderAs System.Object,ByVal eAs System.EventArgs)
Handles MyBase.Load
DataSet21.Clear()
Me.OleDbDataAdapter1.Fill(DataSet21,"Prod")
End Sub
 Private Sub btnfirst_Click(ByVal senderAs System.Object,ByVal eAs System.EventArgs)
Handles btnfirst.Click
Me.BindingContext(DataSet21,"Prod").Position = 0
end sub
Private Sub btnprev_Click(ByVal senderAs System.Object,ByVal eAs System.EventArgs)
Handles btnprev.Click
Me.BindingContext(DataSet21,"Prod").Position =Me.BindingContext(DataSet21,"
Prod").Position - 1
End Sub
 Private Sub btnnext_Click(ByVal senderAs System.Object,ByVal eAs System.EventArgs)
Handles btnnext.ClickMe.BindingContext(DataSet21,"Prod").Position =Me.BindingContext(DataSet21,"Prod").Position + 1End Sub Private Sub btnlast_Click(ByVal senderAs System.Object,ByVal eAs System.EventArgs)
Handles btnlast.Click
Me.BindingContext(DataSet21,"Prod").Position =Me.BindingContext(DataSet21,"
Prod").Count - 1
End Sub