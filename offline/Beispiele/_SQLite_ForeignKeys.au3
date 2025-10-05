#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "SQLite3.dll Can't be Loaded!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)

Local $hMemDb = _SQLite_Open() ; Creates a :memory: database
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't create a memory Database!")
	Exit -2
EndIf

Local $bCurFKConstraints = _SQLite_ForeignKeys()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't read FKConstraints!")
	Exit -3
EndIf
ConsoleWrite(@CRLF & " Current _SQLite_FKConstraints=" & $bCurFKConstraints & @CRLF)

Local $bNewFKConstraints = _SQLite_ForeignKeys(Default, True)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't update FKConstraints!")
	Exit -4
EndIf
ConsoleWrite(" New _SQLite_FKConstraints=" & $bNewFKConstraints & @CRLF)

Local $iRet = _SQLite_Close($hMemDb)
If $iRet <> $SQLITE_OK Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't Close Database = " & $iRet & " !")
	Exit -6
EndIf

Local $hMemDb2 = _SQLite_Open(Default, Default, Default, True) ; Creates a :memory: database with Foreign keus constraints ON
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't create a memory Database with FKConstraints2!")
	Exit -7
EndIf

Local $bCurFKConstraints2 = _SQLite_ForeignKeys()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't read FKConstraints2!")
	Exit -8
EndIf
ConsoleWrite(@CRLF & " Current _SQLite_FKConstraints2=" & $bCurFKConstraints2 & @CRLF)

; close the Dbs we created
Local $iRet2 = _SQLite_Close($hMemDb2)
If $iRet <> $SQLITE_OK Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Can't Close Database2 = " & $iRet2 & " !")
	Exit -9
EndIf

_SQLite_Shutdown()
