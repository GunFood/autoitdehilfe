#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idEdit
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $sBefore, $sAfter

	; Erstellt eine GUI
	GUICreate("Edit: Mit weichen Zeilenumbrüchen", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile, 500))

	; Standardmäßig enthaltener Text
	$sBefore = _GUICtrlEdit_GetText($idEdit)

	; Fügt 'soft line-break'-Zeichen (weiche Zeilenumbrüche) ein, wenn ein Wortumbruch im Editfeld die Zeile zerstört
	_GUICtrlEdit_FmtLines($idEdit, True)

	; Text mit weichen Zeilenumbrüchen
	$sAfter = _GUICtrlEdit_GetText($idEdit)

	MsgBox($MB_TASKMODAL, "Information", "Vorher:" & @CRLF & @CRLF & $sBefore & @CRLF & @CRLF & _
			'--------------------------------------------------------------' & @CRLF & _
			"Nachher:" & @CRLF & @CRLF & $sAfter)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
