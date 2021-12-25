#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Deklariert die CLSID, IID und Interfacebezeichnung für ITaskbarList.
	; Es ist nicht nötig die Mitglieder von IUnknown zu beschreiben.
	Local Const $sCLSID_TaskbarList = "{56FDF344-FD6D-11D0-958A-006097C9A090}"
	Local Const $sIID_ITaskbarList = "{56FDF342-FD6D-11D0-958A-006097C9A090}"
	Local Const $sTagITaskbarList = "HrInit hresult(); AddTab hresult(hwnd); DeleteTab hresult(hwnd); ActivateTab hresult(hwnd); SetActiveAlt hresult(hwnd);"

	; Erstellt das Objekt.
	Local $oTaskbarList = ObjCreateInterface($sCLSID_TaskbarList, $sIID_ITaskbarList, $sTagITaskbarList)

	; Initialisiert das iTaskbarList Objekt.
	$oTaskbarList.HrInit()

	; Startet den Editor.
	Run("notepad.exe")

	; Wartet auf das Editor Fenster und liest dessen Handle aus.
	Local $hNotepad = WinWait("[CLASS:Notepad]")

	; Weist den User daraufhin, dass er hinsehen soll.
	MsgBox($MB_SYSTEMMODAL, "", "Schau auf die Taskbar und du solltest einen Eintrag für den Editor finden." & @CRLF & @CRLF & "OK drücken um fortzufahren.")

	; Löscht den Editor Eintrag aus der Taskbar.
	$oTaskbarList.DeleteTab($hNotepad)

	; Weist den User daraufhin, dass er hinsehen soll.
	MsgBox($MB_SYSTEMMODAL, "", "Schau auf die Taskbar. Dort sollte nun kein Eintrag mehr für den Editor vorhanden sein obwohl er immer noch läuft." & @CRLF & @CRLF & "OK drücken um fortzufahren.")

	; Schließt den Editor.
	WinClose($hNotepad)
EndFunc   ;==>Example
