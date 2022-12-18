; es ist cie Option Out zum Kompilieren in eine A3x-Datei zu verwenden
#pragma compile(Out, pragma[2].a3x)
#include <MsgBoxConstants.au3>

MsgBox($MB_ICONINFORMATION, @ScriptName, 'Kompiliert ? ... ' & @Compiled)
