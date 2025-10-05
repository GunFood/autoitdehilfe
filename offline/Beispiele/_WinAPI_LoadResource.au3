#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <Memory.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIMisc.au3>
#include <WinAPIRes.au3>

Local Const $sJpg = @TempDir & '\~Tech.jpg'

; Resources.dll in den Speicher laden
Local $sDll = _Extras_PathFull('Resources.dll')
Local $hInstance = _WinAPI_LoadLibraryEx($sDll, $LOAD_LIBRARY_AS_DATAFILE)

; JPEG-Ressource aus Resources.dll-Bibliothek laden
Local $hResource = _WinAPI_FindResource($hInstance, 'JPEG', 1)
Local $iSize = _WinAPI_SizeOfResource($hInstance, $hResource)
Local $hData = _WinAPI_LoadResource($hInstance, $hResource)
Local $pData = _WinAPI_LockResource($hData)

; Ressource als .jpg-Datei speichern
Local $hFile = FileOpen($sJpg, 2 + 16)
Local $tData = DllStructCreate('byte[' & $iSize & ']', $pData)
FileWrite($hFile, DllStructGetData($tData, 1))
FileClose($hFile)

; FONT-Ressource aus Resources.dll-Bibliothek laden
$hResource = _WinAPI_FindResource($hInstance, $RT_FONT, 'TECHNOVIA_CAPS')
$iSize = _WinAPI_SizeOfResource($hInstance, $hResource)
$hData = _WinAPI_LoadResource($hInstance, $hResource)
$pData = _WinAPI_LockResource($hData)

; Schriftart aus einem Speicher zum System hinzufügen
Local $hFont = _WinAPI_AddFontMemResourceEx($pData, $iSize)

; SOUND-Ressource aus Resources.dll-Bibliothek laden
$hResource = _WinAPI_FindResource($hInstance, 'SOUND', 1)
$iSize = _WinAPI_SizeOfResource($hInstance, $hResource)
$hData = _WinAPI_LoadResource($hInstance, $hResource)
$pData = _WinAPI_LockResource($hData)

; WAV zur späteren Verwendung in den Speicher kopieren
Local $hWave = _MemGlobalAlloc($iSize, $GMEM_MOVEABLE)
Local $pWave = _MemGlobalLock($hWave)
_MemMoveMemory($pData, $pWave, $iSize)
; _MemGlobalUnlock($hWave)

; STRING-Ressource aus Resources.dll-Bibliothek laden
Local $sText = _WinAPI_LoadString($hInstance, 1)

; Resources.dll aus dem Speicher entladen
_WinAPI_FreeLibrary($hInstance)

; GUI erstellen
GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 350, 350)
GUICtrlCreatePic($sJpg, 0, 0, 350, 350)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateLabel($sText, 10, 18, 330, 36, $SS_CENTER)
GUICtrlSetFont(-1, 30, -1, -1, 'Technovia Caps')
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetColor(-1, 0xF06000)
Local $idButton = GUICtrlCreateButton('Sound abspielen', 125, 316, 100, 23)
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $idButton
			_WinAPI_PlaySound($pWave, BitOR($SND_ASYNC, $SND_MEMORY, $SND_NOWAIT))
	EndSwitch
WEnd

; Ressourcen freigeben
_WinAPI_RemoveFontMemResourceEx($hFont)
FileDelete($sJpg)
