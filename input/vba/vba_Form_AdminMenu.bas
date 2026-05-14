VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_AdminMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database



Private Sub copies_Click()
On Error GoTo Err_copies_Click

    Dim stDocName As String
    Dim stLinkCriteria As String

    stDocName = "copies_form"
    DoCmd.OpenForm stDocName, , , stLinkCriteria

Exit_copies_Click:
    Exit Sub

Err_copies_Click:
    MsgBox Err.Description
    Resume Exit_copies_Click
    
End Sub
Private Sub all_apps_Click()
On Error GoTo Err_all_apps_Click

    Dim stDocName As String
    Dim stLinkCriteria As String

    stDocName = "app_form"
    DoCmd.OpenForm stDocName, , , stLinkCriteria

Exit_all_apps_Click:
    Exit Sub

Err_all_apps_Click:
    MsgBox Err.Description
    Resume Exit_all_apps_Click
    
End Sub
Private Sub quit_Click()
On Error GoTo Err_quit_Click


    DoCmd.quit

Exit_quit_Click:
    Exit Sub

Err_quit_Click:
    MsgBox Err.Description
    Resume Exit_quit_Click
    
End Sub
Private Sub Command7_Click()
On Error GoTo Err_Command7_Click

    Dim stDocName As String
    Dim stLinkCriteria As String

    stDocName = "Incident Report"
    DoCmd.OpenForm stDocName, , , stLinkCriteria

Exit_Command7_Click:
    Exit Sub

Err_Command7_Click:
    MsgBox Err.Description
    Resume Exit_Command7_Click
    
End Sub

Private Sub Close_Click()

DoCmd.Close

End Sub
