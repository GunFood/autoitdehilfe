Local $hDLL = DllOpen("user32.dll")
DllCall($hDLL, "int", "MessageBox", "hwnd", 0, "str", "Etwas Text", "str", "Ein Titel", "int", 0)
DllClose($hDLL)
