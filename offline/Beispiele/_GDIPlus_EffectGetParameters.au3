#include <GDIPlus.au3>
#include <MsgBoxConstants.au3>

_Example()

Func _Example()
    If Not _GDIPlus_Startup() Or @extended < 6 Then
		MsgBox($MB_SYSTEMMODAL, "FEHLER", "GDIPlus.dll v1.1 ist nicht verfügbar")
		Return
	EndIf

	Local $hEffect = _GDIPlus_EffectCreate($GDIP_SharpenEffectGuid)
	Local $tEffectParameters = DllStructCreate($tagGDIP_EFFECTPARAMS_Sharpen)

	_GDIPlus_EffectGetParameters($hEffect, $tEffectParameters)
	ConsoleWrite("> Standardwert von Sharpen_Radius: " & $tEffectParameters.Radius & @CRLF)
	ConsoleWrite("> Standardwert von Sharpen_Amount: " & $tEffectParameters.Amount & @CRLF)

	_GDIPlus_EffectDispose($hEffect)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Example
