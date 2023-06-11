Local $bFileInstall = False ; Auf True ändern und die Pfade unten anpassen.

; Dies installiert die Datei C:\Test.bmp in den Skriptordner.
If $bFileInstall Then FileInstall("C:\Test.bmp", @ScriptDir & "\Test.bmp")
