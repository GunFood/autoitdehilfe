#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Frägt die folgende Textdatei ab. Diese kann sich im Include-Ordner befinden, welcher sich wiederum im Installationspfad von AutoIt liegt.
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\_ReadMe_.txt"

	; Lädt die readme Datei (.txt) mit dem Standardeditor für Textdateien.
	Local $iPID = ShellExecute($sFile)

	MsgBox($MB_SYSTEMMODAL, "", "PID: " & $iPID)
EndFunc   ;==>Example
