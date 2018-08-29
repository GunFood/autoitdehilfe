; zwingender Download von www.autoitscript.com

; #RequireAdmin ; benötigt, falls die Datei in @systemdir liegt

#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $sSQliteDll = _SQLite_Startup("", False, -1)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll konnte nicht geladen werden!")
	Exit -1
EndIf

MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
