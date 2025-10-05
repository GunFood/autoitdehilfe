#include "Extras\HelpFileInternals.au3"

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Zeigt die Anzahl von Decodern/Encodern
	_MemoWrite("Decoder Anzahl : " & _GDIPlus_DecodersGetCount());
	_MemoWrite("Decoder Größe .: " & _GDIPlus_DecodersGetSize());
	_MemoWrite("Encoder Anzahl : " & _GDIPlus_EncodersGetCount());
	_MemoWrite("Encoder Größe .: " & _GDIPlus_EncodersGetSize());

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example