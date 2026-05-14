VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_IncidentsByPendingBySelection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub Clse_Click()
On Error GoTo Err_Clse_Click


    DoCmd.Close
    
Exit_Clse_Click:
    Exit Sub

Err_Clse_Click:
    MsgBox Err.Description
    Resume Exit_Clse_Click
    
End Sub
