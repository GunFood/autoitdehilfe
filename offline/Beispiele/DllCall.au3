; Direkter Aufruf der Nachrichtenfenster-API.
DllCall("user32.dll", "int", "MessageBox", _
		"hwnd", 0, _ ; Handle des Hauptfensters
		"str", "Some text", _ ; Der Text des Nachrichtenfensters
		"str", "Some title", _ ; Der Titel des Nachrichtenfensters
		"int", 0) ; Flags des Nachrichtenfensters
