#include "Extras\HelpFileInternals.au3"

#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("Clipboard", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Öffnet die Zwischenablage
	If Not _ClipBoard_Open($hGui) Then _WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen")

	; Liest die Anzahl der verschiedenen Datenformate aus, die in der Zwischenablage gespeichert sind.
	_MemoWrite("Clipboard Formate ..: " & _ClipBoard_CountFormats())

	; Leert die Zwischenablage
	If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty fehlgeschlagen")

	; Liest die Anzahl der verschiedenen Datenformate aus, die in der Zwischenablage gespeichert sind.
	_MemoWrite("Clipboard Formate ..: " & _ClipBoard_CountFormats())

	; Schließt die Zwischenablage
	_ClipBoard_Close()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example