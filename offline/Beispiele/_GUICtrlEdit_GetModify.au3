#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Edit: Setzt und ermittelt den Status des Änderungflags (v" & @AutoItVersion & ")", 600, 300)
	Local $idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	Local $aPartRightSide[4] = [120, 248, 378, -1]
	Local $hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 3, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die Ränder
	_GUICtrlEdit_SetMargins($idEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Fügt den Text hinzu
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit) * -1)

	; Ermittelt den Status des Änderungflags
	_GUICtrlStatusBar_SetText($hStatusBar, "Änderungflags: " & _GUICtrlEdit_GetModify($idEdit), 1)
	Sleep(2000)

	_GUICtrlEdit_AppendText($idEdit, @CRLF & @CRLF & "Angehängter Text")
	; Ermittelt den Status des Änderungflags
	_GUICtrlStatusBar_SetText($hStatusBar, "Änderungflags: " & _GUICtrlEdit_GetModify($idEdit), 1)
	Sleep(2000)

	; Setzt den Status des Änderungflags erneut
	_GUICtrlEdit_SetModify($idEdit, False)
	; Ermittelt den Status des Änderungflags
	_GUICtrlStatusBar_SetText($hStatusBar, "Änderungflags: " & _GUICtrlEdit_GetModify($idEdit), 1)

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt den Status des Änderungflags")
	; Setzt den Status des Änderungflags
	_GUICtrlEdit_SetModify($idEdit, True)

	; Ermittelt den Status des Änderungflags
	_GUICtrlStatusBar_SetText($hStatusBar, "Änderungflags: " & _GUICtrlEdit_GetModify($idEdit), 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
