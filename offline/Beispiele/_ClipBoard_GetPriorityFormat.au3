#include "Extras\HelpFileInternals.au3"

#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $aFormats[3] = [2, $CF_TEXT, $CF_OEMTEXT]

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Schau nach, ob irgendein Text in der Zwischenablage ist
	_MemoWrite("Bevorzugte Formate .:. " & _ClipBoard_GetPriorityFormat($aFormats))
	_MemoWrite("Unicode-Text verfügbar .: " & _ClipBoard_IsFormatAvailable($CF_UNICODETEXT))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example