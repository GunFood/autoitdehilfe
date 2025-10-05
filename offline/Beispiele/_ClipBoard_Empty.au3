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
	If _ClipBoard_Open($hGui) Then

		ShowData($hGui)

		; Leert die Zwischenablage
		If Not _ClipBoard_Empty() Then _WinAPI_ShowError("_ClipBoard_Empty fehlgeschlagen")

		; Schließt die Zwischenablage
		_ClipBoard_Close()
	Else
		_WinAPI_ShowError("_ClipBoard_Open failed")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Zeigt die Statistik der Zwischenablage
Func ShowData($hGui)
	_MemoWrite("GUI Handle ................: " & $hGui)
	_MemoWrite("Clipboard Besitzer ........: " & _ClipBoard_GetOwner())
	_MemoWrite("Für Clipboard geöffnetes Fenster .: " & _ClipBoard_GetOpenWindow())
	_MemoWrite("Clipboard Sequenz .........: " & _ClipBoard_GetSequenceNumber())
	_MemoWrite()
EndFunc   ;==>ShowData