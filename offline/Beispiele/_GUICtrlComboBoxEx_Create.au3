#include <Extras\WM_NOTIFY.au3>
#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_hCombo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ComboBoxEx: Erstellen (v" & @AutoItVersion & ")", 400, 300)
	$g_hCombo = _GUICtrlComboBoxEx_Create($hGUI, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	_GUICtrlComboBoxEx_AddString($g_hCombo, "Etwas mehr Text")
	_GUICtrlComboBoxEx_InsertString($g_hCombo, "zu löschender Text", 1)
	_GUICtrlComboBoxEx_DeleteString($g_hCombo, 1)
	_GUICtrlComboBoxEx_InsertString($g_hCombo, "Eingefügter Text", 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Local $tInfo
	Switch $hWndFrom
		Case $g_hCombo
			Switch $iCode
				Case $CBEN_BEGINEDIT ; Gesendet, wenn der Benutzer die Aufklappliste aktiviert oder in das Input-Control des Controls klickt.
					_WM_NOTIFY_DebugEvent("$CBEN_BEGINEDIT", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					Return 0
				Case $CBEN_DELETEITEM
					_WM_NOTIFY_DebugEvent("$CBEN_DELETEITEM", $tagNMCOMBOBOXEX, $lParam, "IDFrom,,Mask,Item,*Text,TextMax,Indent,Image,SelectedImage,OverlayImage,Param")
					Return 0
				Case $CBEN_DRAGBEGINA, $CBEN_DRAGBEGINW
					$tInfo = DllStructCreate($tagNMCBEDRAGBEGIN, $lParam)
					If DllStructGetData($tInfo, "ItemID") Then
						_WM_NOTIFY_DebugEvent("$CBEN_DRAGBEGIN", $tagNMCOMBOBOXEX, $lParam, "IDFrom,,Mask,Item,*Text,TextMax,Indent,Image,SelectedImage,OverlayImage,Param")
					EndIf
					_WM_NOTIFY_DebugEvent("$CBEN_DRAGBEGIN", $tagNMCBEDRAGBEGIN, $lParam, "IDFrom,,ItemID,Text")
					; Rückgabe auslassen
				Case $CBEN_ENDEDITA, $CBEN_ENDEDITW ; Gesendet, wenn der Benutzer eine Operation in dem Input-Control beendet hat oder ein Item aus der Aufklappliste des Controls ausgewählt hat.
					_WM_NOTIFY_DebugEvent("$CBEN_ENDEDIT", $tagNMCBEENDEDIT, $lParam, "IDFrom,,fChanged,NewSelection,Text,Why")
					Return False ; Akzeptiert die Benachrichtigung und erlaubt dem Control das gewählte Item anzuzeigen
;~ 					Return True  ; Andernfalls
				Case $CBEN_GETDISPINFOA, $CBEN_GETDISPINFOW ; Gesendet, um Anzeigeinformationen über das Callback-Item abzurufen
					_WM_NOTIFY_DebugEvent("$CBEN_GETDISPINFOW", $tagNMCOMBOBOXEX, $lParam, "IDFrom,,Mask,Item,*Text,TextMax,Indent,Image,SelectedImage,OverlayImage,Param")
					Return 0
				Case $CBEN_INSERTITEM
					_WM_NOTIFY_DebugEvent("$CBEN_INSERTITEM", $tagNMCOMBOBOXEX, $lParam, "IDFrom,,Mask,Item,*Text,TextMax,Indent,Image,SelectedImage,OverlayImage,Param")
					Return 0
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
