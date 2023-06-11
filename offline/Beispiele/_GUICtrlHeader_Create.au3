#include <Extras\WM_NOTIFY.au3>
#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>

Global $g_hHeader, $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Erstellen (v" & @AutoItVersion & ")", 400, 300)
	$g_hHeader = _GUICtrlHeader_Create($hGUI)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

;~ 	_GUICtrlHeader_SetUnicodeFormat($g_hHeader, False)

	_WM_NOTIFY_Register($g_idMemo)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 3", 100)

	; Löscht alle Filter
	_GUICtrlHeader_ClearFilterAll($g_hHeader)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo-Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hHeader
			Switch $iCode
				Case $HDN_BEGINDRAG ; Gesendet durch ein Header-Control, wenn eine Ziehoperation auf einem seiner Items begonnen wurde
					_WM_NOTIFY_DebugEvent("$HDN_BEGINDRAG", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					Return False ; Dies erlaubt dem Header-Control, Drag-and-drop-Operationen automatisch zu behandeln
;~ 						Return True  ; Gibt an, dass Drag-and-drop-Operationen extern (manuell) behandelt werden, um dem Besitzer des Controls
					; Zu ermöglichen, zusätzliche Dienste als Teil des Drag-and-drop-Prozesses festzulegen
				Case $HDN_BEGINTRACK, $HDN_BEGINTRACKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer mit dem Verschieben eines Trenners beginnt
					_WM_NOTIFY_DebugEvent("$HDN_BEGINTRACK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					Return False ; Um das Ziehen eines Trenners zu erlauben
;~ 						Return True  ; Um das Ziehen zu verhindern
				Case $HDN_DIVIDERDBLCLICK, $HDN_DIVIDERDBLCLICKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer einen Doppelklick auf einen Trenner ausgeführt hat
					_WM_NOTIFY_DebugEvent("$HDN_DIVIDERDBLCLICK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_ENDDRAG ; Das Header-Control sendet eine Nachricht, wenn eine Ziehoperation auf einem Item des Controls beendet wurde
					_WM_NOTIFY_DebugEvent("$HDN_ENDDRAG", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					Return False ; Um dem Control das automatische Platzieren und Neu-Ordnen des Items zu erlauben
;~ 						Return True  ; Um das Platieren des Items zu verhindern
				Case $HDN_ENDTRACK, $HDN_ENDTRACKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer mit dem verschieben eines Trenners fertig ist
					_WM_NOTIFY_DebugEvent("$HDN_ENDTRACK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_FILTERBTNCLICK ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Filter-Button angeklickt wurde oder das eine Antwort auf eine $HDM_SETITEM-Nachricht gekommen ist
					_WM_NOTIFY_DebugEvent("$HDN_FILTERBTNCLICK", $tagNMHDFILTERBTNCLICK, $lParam, "IDFrom,,Item,Left,Top,Right,Bottom")
;~ 						Return True  ; Eine $HDN_FILTERCHANGE-Nachricht wird an das übergeordnete Fenster des Header-Controls gesendet
					; Diese Nachricht ermöglicht dem übergeordneten Fenster, seine UI-Items zu synchronisieren
					Return False ; Falls keine Nachricht gesendet werden soll
				Case $HDN_FILTERCHANGE ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass die Attribute des Header-Controlfilters geändert wurden
					_WM_NOTIFY_DebugEvent("$HDN_FILTERCHANGE", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_GETDISPINFO, $HDN_GETDISPINFOW ; Sendet dem Besitzer des Header-Controls eine Nachricht, dass das Control Informationen über ein Callback-Headeritem benötigt
					_WM_NOTIFY_DebugEvent("$HDN_GETDISPINFO", $tagNMHDDISPINFO, $lParam, "IDFrom,Item")
;~ 						Return LRESULT
				Case $HDN_ITEMCHANGED, $HDN_ITEMCHANGEDW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass sich die Attribute eines Header-Items geändert haben
					_WM_NOTIFY_DebugEvent("$HDN_ITEMCHANGED", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_ITEMCHANGING, $HDN_ITEMCHANGINGW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass sich die Attribute eines Headeritems ändern
					_WM_NOTIFY_DebugEvent("$HDN_ITEMCHANGING", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					Return False ; Um Änderungen zu erlauben
;~ 						Return True  ; Verhindert dies
				Case $HDN_ITEMCLICK, $HDN_ITEMCLICKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer einen Einfachklick auf das Control durchgeführt hat
					_WM_NOTIFY_DebugEvent("$HDN_ITEMCLICK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_ITEMDBLCLICK, $HDN_ITEMDBLCLICKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer einen Doppelklick auf das Control durchgeführt hat
					_WM_NOTIFY_DebugEvent("$HDN_ITEMDBLCLICK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					; Kein Rückgabewert
				Case $HDN_TRACK, $HDN_TRACKW ; Benachrichtigt das übergeordnete Fenster des Header-Controls, dass der Benutzer einen Trenner im Header-Control verschiebt
					_WM_NOTIFY_DebugEvent("$HDN_TRACK", $tagNMHEADER, $lParam, "IDFrom,,Item,Button")
					Return False ; Um das Verschieben das Trenners fortzusetzen
;~ 						Return True  ; Um das Verschieben zu beenden
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
