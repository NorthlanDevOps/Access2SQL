VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_WatchMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Close_Database_Click()
On Error GoTo Err_Close_Database_Click


    DoCmd.quit

Exit_Close_Database_Click:
    Exit Sub

Err_Close_Database_Click:
    MsgBox Err.Description
    Resume Exit_Close_Database_Click
    
End Sub

Private Sub Command7_Click()

End Sub

Private Sub Update_Complaint_Click()

End Sub
Private Sub Return_to_Main_Menu_Click()
On Error GoTo Err_Return_to_Main_Menu_Click


    DoCmd.Close
    
Exit_Return_to_Main_Menu_Click:
    Exit Sub

Err_Return_to_Main_Menu_Click:
    MsgBox Err.Description
    Resume Exit_Return_to_Main_Menu_Click
    
End Sub
Private Sub Search_Records_Click()
 Select Case optsearch
        Case 1
            DoCmd.OpenForm "sumshtall"
            Forms!sumshtall!LogNo = "txtlogno"
        Case 2
            DoCmd.OpenForm "frmSearchResults"
            Forms!frmSearchResults!lstSearch.RowSource = "qrySearchResults_2"
            Forms!frmSearchResults!lstSearch.Visible = True
        Case 3
            DoCmd.OpenForm "frmSearchResults"
            Forms!frmSearchResults!lstSearch.RowSource = "qrySearchResults_3"
            Forms!frmSearchResults!lstSearch.Visible = True
        Case 4
            DoCmd.OpenForm "frmSearchResults"
            Forms!frmSearchResults!lstSearch.RowSource = "qrySearchResults_4"
            Forms!frmSearchResults!lstSearch.Visible = True
        
    End Select





On Error GoTo Err_Search_Records_Click


    Screen.PreviousControl.SetFocus
    DoCmd.DoMenuItem acFormBar, acEditMenu, 10, , acMenuVer70

Exit_Search_Records_Click:
    Exit Sub

Err_Search_Records_Click:
    MsgBox Err.Description
    Resume Exit_Search_Records_Click
    
End Sub
Private Sub SearchIncident_Click()
On Error GoTo Err_SearchIncident_Click

    Dim stDocName As String
    Dim stLinkCriteria As String

    stDocName = "IncidentsByType"
    DoCmd.OpenForm stDocName, , , stLinkCriteria

Exit_SearchIncident_Click:
    Exit Sub

Err_SearchIncident_Click:
    MsgBox Err.Description
    Resume Exit_SearchIncident_Click
    
End Sub
