Attribute VB_Name = "DeleteSubReports"
Option Compare Database

Public Function KillMyFiles()

'Loop through all the files in the directory by using Dir$ function
Dim MyFile As String
MyFile = Dir$("b:\enterprise and communities\databases\cctv\subreports\*.*")
Do While MyFile <> ""
    Kill "b:\enterprise and communities\databases\cctv\subreports\" & MyFile
    'need to specify full path again because a file was deleted 1
    MyFile = Dir$("b:\enterprise and communities\databases\cctv\subreports\*.*")
Loop

End Function


