#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>

Global $g_hStatus, $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Imagelist: Ermittelt das Icon (v" & @AutoItVersion & ")", 400, 300)
	$g_hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register($g_idMemo)

	; Setzt die Abschnitte
	Local $aParts[4] = [75, 150, 300, 400]
	_GUICtrlStatusBar_SetParts($g_hStatus, $aParts)
	_GUICtrlStatusBar_SetText($g_hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($g_hStatus, "Abschnitt 2", 1)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($g_hStatus, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($g_hStatus, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($g_hStatus, 0x0000FF, 11, 11))

	; Setzt die Icons
	Local $ahIcons[2]
	$ahIcons[0] = _GUIImageList_GetIcon($hImage, 1)
	$ahIcons[1] = _GUIImageList_GetIcon($hImage, 2)
	_GUICtrlStatusBar_SetIcon($g_hStatus, 0, $ahIcons[0])
	_GUICtrlStatusBar_SetIcon($g_hStatus, 1, $ahIcons[1])
	MemoWrite("")

	; Zeigt die Handles der Icons
	MemoWrite("Icon-Handle vom Abschnitt 1 .: 0x" & Hex($ahIcons[0]))
	MemoWrite("Icon-Handle vom Abschnitt 2 .: 0x" & Hex($ahIcons[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Icons zerstören
	MsgBox($MB_SYSTEMMODAL, "Information", "Icon 1 zerstört? " & _GUIImageList_DestroyIcon($ahIcons[0]))
	MsgBox($MB_SYSTEMMODAL, "Information", "Icon 2 zerstört? " & _GUIImageList_DestroyIcon($ahIcons[1]))
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Local $tinfo
	Switch $hWndFrom
		Case $g_hStatus
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat die linke Maustaste innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdrückt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick.
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdrückt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdrückt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdrückt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $SBN_SIMPLEMODECHANGE ; Änderungen des 'einfachen Modus'
					_WM_NOTIFY_DebugEvent("$SBN_SIMPLEMODECHANGE", $tagNMHDR, $lParam, ",hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
