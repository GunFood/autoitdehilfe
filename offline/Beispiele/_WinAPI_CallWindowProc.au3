#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WinAPIDlg.au3>
#include <WinAPISysWin.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_idContextMenu, $g_idCommonMenuItem, $g_idFileMenuItem, $g_idExitMenuItem
Global $g_hGui, $idInput, $g_hProcOld

Example()

Func Example()
	Local $idInput2, $hProcNew, $idDummyMenu

	$g_hGui = GUICreate("Tippt oder fügt irgendetwas ein:", 400, 200, -1, -1, $WS_THICKFRAME, -1)
	$idInput = GUICtrlCreateInput("", 20, 20, 360, 20)
	$idInput2 = GUICtrlCreateInput("", 20, 50, 360, 20)

	GUICtrlCreateLabel("abcd", 1, 1, 30, 18)
	GUICtrlSetCursor(-1, 9)

	$hProcNew = DllCallbackRegister("_MyWindowProc", "ptr", "hwnd;uint;long;ptr")
	$g_hProcOld = _WinAPI_SetWindowLong(GUICtrlGetHandle($idInput), $GWL_WNDPROC, DllCallbackGetPtr($hProcNew))
	_WinAPI_SetWindowLong(GUICtrlGetHandle($idInput2), $GWL_WNDPROC, DllCallbackGetPtr($hProcNew))
	; _WinAPI_SetWindowLong(GUICtrlGetHandle($idInput3), $GWL_WNDPROC, DllCallbackGetPtr($hProcNew)) ; und so weiter

	$idDummyMenu = GUICtrlCreateDummy()
	$g_idContextMenu = GUICtrlCreateContextMenu($idDummyMenu)
	$g_idCommonMenuItem = GUICtrlCreateMenuItem("Allgemein", $g_idContextMenu)
	$g_idFileMenuItem = GUICtrlCreateMenuItem("Datei", $g_idContextMenu)
	GUICtrlCreateMenuItem("", $g_idContextMenu)
	$g_idExitMenuItem = GUICtrlCreateMenuItem("Beenden", $g_idContextMenu)

	GUISetState(@SW_SHOW)
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func do_clever_stuff_with_clipboard($hWnd)
	Local $sData
	$sData = ClipGet()
	If @error Then Return 0 ; Daten in der Zwischenablage sind kein Text oder Zwischenablage ist leer
	; Tue irgendwas
	$sData = StringUpper($sData)
	; Setzt Text
	GUICtrlSetData(_WinAPI_GetDlgCtrlID($hWnd), $sData) ; Oder _GUICtrlEdit_SetText($hWnd, $sData)
	Return 1
EndFunc   ;==>do_clever_stuff_with_clipboard

; Zeigt ein Menü im angegebenen GUI-Fenster, das zum angegebenen Control gehört
Func ShowMenu($hWnd, $nContextID)
	Local $iSelected = _GUICtrlMenu_TrackPopupMenu(GUICtrlGetHandle($nContextID), $hWnd, -1, -1, -1, -1, 2)
	Switch $iSelected
		Case $g_idCommonMenuItem
			ConsoleWrite("Allgemein" & @CRLF)
		Case $g_idFileMenuItem
			ConsoleWrite("Datei" & @CRLF)
		Case $g_idExitMenuItem
			ConsoleWrite("Beenden" & @CRLF)
	EndSwitch
EndFunc   ;==>ShowMenu

Func _MyWindowProc($hWnd, $iMsg, $wParam, $lParam)
	Switch $iMsg
		Case $WM_PASTE
			Return do_clever_stuff_with_clipboard($hWnd)
		Case $WM_CONTEXTMENU
			If $hWnd = GUICtrlGetHandle($idInput) Then
				ShowMenu($g_hGui, $g_idContextMenu)
				Return 0
			EndIf
		Case $WM_SETCURSOR
			GUICtrlSetCursor(_WinAPI_GetDlgCtrlID($hWnd), 5) ; Setzt den Ibeam- (Text-) Cursor
			Return 1 ; Und verhindere, dass die Standard-Fensterprozedur alles durcheinanderbringt
	EndSwitch

	; Reicht die unbehandelten Nachrichten an die Standard-Fensterprozedur weiter
	Return _WinAPI_CallWindowProc($g_hProcOld, $hWnd, $iMsg, $wParam, $lParam)
EndFunc   ;==>_MyWindowProc
