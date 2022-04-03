#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Global $g_hListView

Example()

Func Example()
	Local $hGUI, $hImage
	$hGUI = GUICreate("ListView: Erstellen (v" & @AutoItVersion & ")", 400, 300)

	$g_hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($g_hListView, 0, "Spalte 1", 120)
	_GUICtrlListView_InsertColumn($g_hListView, 1, "Spalte 2", 120)
	_GUICtrlListView_InsertColumn($g_hListView, 2, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 3: Spalte 1", 2)

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
;~ 				Case $LVN_BEGINDRAG ; Eine "Ziehen und Ablegen"-Operation wurde ausgelöst, an der die linke Maustaste beteiligt ist
;~ 					_WM_NOTIFY_DebugEvent("$LVN_BEGINDRAG", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 				; Kein Rückgabewert
;~				Case $LVN_BEGINLABELEDIT ; Beginn der Änderung der Itembezeichnung
;~					_WM_NOTIFY_DebugEvent("$LVN_BEGINLABELEDIT", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns")
;~					Return False ; Erlaubt dem Benutzer, die Bezeichnung zu ändern
;~					;Return True  ; Verbietet dem Benutzer, die Bezeichnung zu ändern
;~ 				Case $LVN_BEGINRDRAG ; Eine "Ziehen und Ablegen"-Operation wurde ausgelöst, an der die rechte Maustaste beteiligt ist
;~ 					_WM_NOTIFY_DebugEvent("$LVN_BEGINRDRAG", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 				; Kein Rückgabewert
;~ 				Case $LVN_BEGINSCROLL ; Eine Scroll-Operation beginnt (Minimum WinXP)
;~ 					_WM_NOTIFY_DebugEvent("$LVN_BEGINSCROLL", $tagNMLVSCROLL, $lParam, "IDFrom,,DX,DY")
;~ 					; Kein Rückgabewert
				Case $LVN_COLUMNCLICK ; Eine Spalte wurde angeklickt
					_WM_NOTIFY_DebugEvent("$LVN_COLUMNCLICK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
;~ 				Case $LVN_DELETEALLITEMS ; Alle Items des Controls sollen gelöscht werden
;~ 					_WM_NOTIFY_DebugEvent("$LVN_DELETEALLITEMS", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					Return True ; Unterdrückt die folgenden $LVN_DELETEITEM-Nachrichten
;~ 					;Return False ; Empfängt die folgenden $LVN_DELETEITEM-Nachrichten
;~ 				Case $LVN_DELETEITEM ; Ein Item soll gelöscht werden
;~ 					_WM_NOTIFY_DebugEvent("$LVN_DELETEITEM", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ENDLABELEDIT ; Ende der Änderung der Bezeichnung eines Items
;~ 					_WM_NOTIFY_DebugEvent("$LVN_ENDLABELEDIT", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns,,TextMax,*Text")
;~ 					; Wenn das Input-Control nicht leer ist, führt der Rückgabewert True zum Übernehmen des Textes als Itembezeichnung, False verwirft den eingegebenen Text.
;~ 					; Wenn das Input-Control leer ist, wird der Rückgabewert ignoriert
;~ 					Return True
;~ 				Case $LVN_ENDSCROLL ; Eine Scroll-Operation endet (Minimum WinXP)
;~ 					_WM_NOTIFY_DebugEvent("$LVN_ENDSCROLL", $tagNMLVSCROLL, $lParam, "IDFrom,,DX,DY")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_GETDISPINFO ; Liefert Informationen, die für die Anzeige oder Sortierung eines ListView-Items benötigt werden
;~ 					_WM_NOTIFY_DebugEvent("$LVN_GETDISPINFO", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns,,TextMax,*Text")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_GETINFOTIP ; Wird von einem ListView mit großen Icons gesendet, das den erweiterten Stil $LVS_EX_INFOTIP besitzt
;~ 					_WM_NOTIFY_DebugEvent("$LVN_GETINFOTIP", $tagNMLVGETINFOTIP, $lParam, "IDFrom,,Flags,Item,SubItem,lParam,,TextMax, *Text")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_HOTTRACK ; Wird von einem ListView gesendet, wenn der Benutzer die Maus über ein Item bewegt
;~ 					_WM_NOTIFY_DebugEvent("$LVN_HOTTRACK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					Return 0 ; Erlaubt dem ListView, seine normale "Verfolgen und Auswählen"-Operation durchzuführen.
;~ 					;Return 1 ; Das Item wird nicht ausgewählt.
;~ 				Case $LVN_INSERTITEM ; Ein neues Item wurde eingefügt
;~ 					_WM_NOTIFY_DebugEvent("$LVN_INSERTITEM", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ITEMACTIVATE ; Wird von einem ListView gesendet, wenn der Benutzer ein Item aktiviert
;~ 					_WM_NOTIFY_DebugEvent("$LVN_ITEMACTIVATE", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
;~ 					Return 0
;~ 				Case $LVN_ITEMCHANGED ; Ein Item hat sich geändert
;~ 					_WM_NOTIFY_DebugEvent("$LVN_ITEMCHANGED", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ITEMCHANGING ; Ein Item wird geändert
;~ 					_WM_NOTIFY_DebugEvent("$LVN_ITEMCHANGING", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
;~ 					Return True ; Verhindert das Ändern
;~ 					;Return False ; Erlaubt das Ändern
				Case $LVN_KEYDOWN ; Eine Taste wurde gedrückt
					_WM_NOTIFY_DebugEvent("$LVN_KEYDOWN", $tagNMLVKEYDOWN, $lParam, "IDFrom,,VKey,Flags")
					; Kein Rückgabewert
;~ 				Case $LVN_MARQUEEBEGIN ; Ein Auswahlrahmen (Marquee) wurde begonnen
;~ 					_WM_NOTIFY_DebugEvent("$LVN_MARQUEEBEGIN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 0 ; Akzeptiert die Nachricht
;~ 					;Return 1 ; Bricht die Auswahlbox ab
;~				Case $LVN_SETDISPINFO ; Aktualisiert die enthaltenen Informationen über ein Item
;~					_WM_NOTIFY_DebugEvent("$LVN_SETDISPINFO", $tagNMLVDISPINFO, $lParam, "IDFrom,,Mask,Item,SubItem,State,StateMask,Image,Param,Indent,,GroupID,Columns,pColumns,,TextMax,*Text")
;~ 					; Kein Rückgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
;~ 				Case $NM_HOVER ; Wird vom ListView gesendet, wenn die Maus über einem Item schwebt
;~ 					_WM_NOTIFY_DebugEvent("$NM_HOVER", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 0 ; Normale Bearbeitung der Schwebe-Nachricht
;~ 					;Return 1 ; Verbietet die Abarbeitung der Schwebe-Nachricht
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RETURN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_WM_NOTIFY_DebugEvent("$NM_SETFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
