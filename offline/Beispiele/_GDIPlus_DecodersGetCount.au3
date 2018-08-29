#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Zeigt die Anzahl von Decodern/Encodern
	MemoWrite("Decoder Anzahl : " & _GDIPlus_DecodersGetCount());
	MemoWrite("Decoder Größe .: " & _GDIPlus_DecodersGetSize());
	MemoWrite("Encoder Anzahl : " & _GDIPlus_EncodersGetCount());
	MemoWrite("Encoder Größe .: " & _GDIPlus_EncodersGetSize());

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
