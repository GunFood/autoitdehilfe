#include <MsgBoxConstants.au3>

SplashTextOn("Beispiel", "Splash Screen", 500, 400, 100, 100)
MsgBox($MB_SYSTEMMODAL, 'Test 1', 'Splash ist sichtbar')
SplashOff()
MsgBox($MB_SYSTEMMODAL, 'Test 2', 'Splash ist nicht mehr sichtbar')
