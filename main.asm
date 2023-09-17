format PE gui
entry start

include "win32a.inc"

section '.data' data readable writeable
	caption db "Error", 0
	message db "This is a strange error!", 0

section '.code' code readable executable
	start:
		mov ecx, 5
		mov eax, 0

		repeat_loop:
			push (MB_ICONERROR or MB_OKCANCEL)
			push caption
			push message
			push 0
			call [MessageBoxA]

			add eax, 2
			loop repeat_loop

		push 0
		call [ExitProcess]

section '.idata' import data readable writeable
	library kernel32, 'kernel32.dll',\
		user32, 'user32.dll'


	import kernel32,\
		ExitProcess, 'ExitProcess'

	import user32,\
		MessageBoxA, 'MessageBoxA'