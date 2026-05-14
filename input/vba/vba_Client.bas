Attribute VB_Name = "Client"
Option Compare Database

Private Declare PtrSafe Function apiGetUserName Lib "advapi32.dll" Alias _
"GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Function fOSUserName() As String
    Dim lngLen As Long, lngX As Long
    Dim strUserName As String
    strUserName = String$(254, 0)
    lngLen = 255
    lngX = apiGetUserName(strUserName, lngLen)
    If lngX <> 0 Then
        fOSUserName = Left$(strUserName, lngLen - 1)
    Else
        fOSUserName = ""
    End If
End Function

