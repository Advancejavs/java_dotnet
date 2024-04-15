Imports System.Windows.Forms

Public Class Form1
    Dim goodVotes As Integer = 0
    Dim satisfactoryVotes As Integer = 0
    Dim badVotes As Integer = 0

    Private Sub ButtonVote_Click(sender As Object, e As EventArgs) Handles ButtonVote.Click
        If RadioButtonGood.Checked Then
            goodVotes += 1
        ElseIf RadioButtonSatisfactory.Checked Then
            satisfactoryVotes += 1
        ElseIf RadioButtonBad.Checked Then
            badVotes += 1
        End If

        ' Calculate percentages
        Dim totalVotes As Integer = goodVotes + satisfactoryVotes + badVotes
        Dim goodPercentage As Double = (goodVotes / totalVotes) * 100
        Dim satisfactoryPercentage As Double = (satisfactoryVotes / totalVotes) * 100
        Dim badPercentage As Double = (badVotes / totalVotes) * 100

        ' Update labels with percentages
        LabelGood.Text = $"Good: {goodPercentage}%"
        LabelSatisfactory.Text = $"Satisfactory: {satisfactoryPercentage}%"
        LabelBad.Text = $"Bad: {badPercentage}%"
    End Sub
End Class
