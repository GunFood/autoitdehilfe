#include <IE.au3>
#include <MsgBoxConstants.au3>

; Zeigt das frameset-Beispiel an, erstellt eine Frame-Auflistung, fragt die Anzahl der Frames ab, zeigt die Anzahl vorhandener Frames oder iFrames an

Local $oIE = _IE_Example("frameset")
Local $oFrames = _IEFrameGetCollection($oIE)
Local $iNumFrames = @extended
If $iNumFrames > 0 Then
	If _IEIsFrameSet($oIE) Then
		MsgBox($MB_SYSTEMMODAL, "Frame Info", "Die Seite enthält " & $iNumFrames & " Frames in einem FrameSet")
	Else
		MsgBox($MB_SYSTEMMODAL, "Frame Info", "Die Seite enthält " & $iNumFrames & " iFrames")
	EndIf
Else
	MsgBox($MB_SYSTEMMODAL, "Frame Info", "Die Seite enthält keine Frames")
EndIf

_IEQuit($oIE)
