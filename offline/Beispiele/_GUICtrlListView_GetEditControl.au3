#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Global $g_hListView, $g_idMemo

Example()

Func Example()
	Local $hGui = GUICreate("ListView: Ermittelt das Handle zu dem Änderungscontrol (v" & @AutoItVersion & ")", 500, 300, Default, Default, Default, $WS_EX_CLIENTEDGE)
	$g_hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 118, BitOR($LVS_EDITLABELS, $LVS_REPORT))
	$g_idMemo = GUICtrlCreateEdit("", 2, 124, 396, 174, 0)
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_hListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 3", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 3: Spalte 1", 2)

	; Ändert das Label von Item 0 mit einem Timeout
	_WM_NOTIFY_Register($g_idMemo)

	_GUICtrlListView_EditLabel($g_hListView, 0)
	MemoWrite("Edit Handle: 0x" & Hex(_GUICtrlListView_GetEditControl($g_hListView)) & _
			" IsPtr = " & IsPtr(_GUICtrlListView_GetEditControl($g_hListView)) & " IsHWnd = " & IsHWnd(_GUICtrlListView_GetEditControl($g_hListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndListView = $g_hListView
	If Not IsHWnd($g_hListView) Then $hWndListView = GUICtrlGetHandle($g_hListView)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")

	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_BEGINLABELEDITA, $LVN_BEGINLABELEDITW ; Beginn der Änderung der Bezeichnung eines Items
					_WM_NOTIFY_DebugEvent("$LVN_BEGINLABELEDIT", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns")
					Return False ; Erlaubt dem Benutzer, die Bezeichnung zu ändern
					;Return True  ; Verbietet dem Benutzer, die Bezeichnung zu ändern
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
					_WM_NOTIFY_DebugEvent("$LVN_COLUMNCLICK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
				Case $LVN_ENDLABELEDITA, $LVN_ENDLABELEDITW ; Ende der Änderung der Bezeichnung eines Items
					Local $tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
					Local $pText = DllStructGetData($tInfo, "Text")
					If $pText <> 0 Then
						_WM_NOTIFY_DebugEvent("$LVN_ENDLABELEDIT", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns,,TextMax,*Text")
						Return True ; Wenn das Input-Control nicht leer ist, führt der Rückgabewert True zum Übernehmen des Textes als Itembezeichnung, False verwirft den eingegebenen Text.
					EndIf
					; Wenn das Input-Control leer ist, wird der Rückgabewert ignoriert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,,lParam,KeyFlags")
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RETURN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control erhält den Eingabefokus
					_WM_NOTIFY_DebugEvent("$NM_SETFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite