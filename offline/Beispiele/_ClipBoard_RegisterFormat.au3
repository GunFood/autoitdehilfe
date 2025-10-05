#include "Extras\HelpFileInternals.au3"

#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $iFormat

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Registriere ein neues Clipboard-Format
	$iFormat = _ClipBoard_RegisterFormat("AutoIt-Bibliothek Text")
	If $iFormat <> 0 Then

		; Zeigt das neue Format an
		_MemoWrite(_ClipBoard_GetFormatName($iFormat))
	Else
		_WinAPI_ShowError("_ClipBoard_RegisterFormat fehlgeschlagen!")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example