#include <Extras\WM_NOTIFY.au3>
#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>

Global $g_hHeader, $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Setzt und ermittelt Filter (v" & @AutoItVersion & ")", 400, 300)
	$g_hHeader = _GUICtrlHeader_Create($hGUI, $HDS_FILTERBAR)
	$g_idMemo = GUICtrlCreateEdit("", 2, 48, 396, 250, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; ANSI Format
;~ 	_GUICtrlHeader_SetUnicodeFormat($g_hHeader, False)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($g_hHeader, "Spalte 3", 100)

	; Startet das Ändern in dem festgelegten Filter
	_GUICtrlHeader_EditFilter($g_hHeader, 0)
	Sleep(500)
	Send("Filter 0")
	Sleep(1000)
	Send("{ENTER}")

	_GUICtrlHeader_EditFilter($g_hHeader, 1)
	Sleep(500)
	Send("Filter 1")
	Sleep(1000)
	Send("{ENTER}")
	MemoWrite("Filtertext von Spalte 1 : " & _GUICtrlHeader_GetFilterText($g_hHeader, 1))

	; Bereinigt den Filter
	_GUICtrlHeader_ClearFilter($g_hHeader, 0)

	;Registert WM_NOTIFY zur Behandlung von $HDN_FILTERBTNCLICK-Meldungen
	_WM_NOTIFY_Register($g_idMemo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDFILTERBTNCLICK

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Local $iColumn, $sText
	Switch $hWndFrom
		Case $g_hHeader
			Switch $iCode
				Case $HDN_FILTERBTNCLICK ; Benachrichtigt das übergeordnete Fenster des Kopfzeilen-Steuerelements, wenn die Filter-Schaltfläche angeklickt wird oder als Reaktion auf eine $HDM_SETITEM-Nachricht
					$tNMHDFILTERBTNCLICK = DllStructCreate($tagNMHDFILTERBTNCLICK, $lParam)
					$iColumn = DllStructGetData($tNMHDFILTERBTNCLICK, "Item")

					$sText = " Text=" & _GUICtrlHeader_GetFilterText($g_hHeader, $iColumn)
					_WM_NOTIFY_DebugEvent("$HDN_FILTERBTNCLICK", $tagNMHDFILTERBTNCLICK, $lParam, "IDFrom,,Item", $sText)

					;Return True  ; Eine $HDN_FILTERCHANGE-Benachrichtigung wird an das übergeordnete Fenster des Header-Controls gesendet
					; Diese Benachrichtigung gibt dem übergeordneten Fenster die Möglichkeit, seine Benutzeroberflächenelemente zu synchronisieren
					Return False ; Wenn man nicht möchte, dass die Benachrichtigung gesendet wird

				Case $HDN_FILTERCHANGE ; Benachrichtigt das übergeordnete Fenster des Kopfzeilensteuerelements, dass die Attribute eines Kopfzeilensteuerungsfilters geändert oder bearbeitet werden
					$tNMHDFILTERBTNCLICK = DllStructCreate($tagNMHDFILTERBTNCLICK, $lParam)
					$iColumn = DllStructGetData($tNMHDFILTERBTNCLICK, "Item")

					$sText = " Text=" & _GUICtrlHeader_GetFilterText($g_hHeader, $iColumn)
					_WM_NOTIFY_DebugEvent("$HDN_FILTERCHANGE", $tagNMHDFILTERBTNCLICK, $lParam, "IDFrom,,Item", $sText)

					; kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
