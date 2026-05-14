Attribute VB_Name = "DB"
Option Compare Database
Function setcurrentdb()
On Error GoTo setcurrentdb_Err

    Dim DB As Database
    Set DB = currentdb()

setcurrentdb_Exit:
    Exit Function

setcurrentdb_Err:
    MsgBox Error$
    Resume setcurrentdb_Exit

End Function



