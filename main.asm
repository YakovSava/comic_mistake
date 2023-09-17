format PE gui
entry start

include "win32a.inc"

section '.data' data readable writeable
	caption db "Error", 0
	message db "This is a strange error!", 0

section '.code' code readable executable
	start:
		mov ebx, 5

		repeat_loop:
			push ebx
			push (MB_ICONERROR or MB_OKCANCEL)
			push caption
			push message
			push 0
			call [MessageBoxA]

			sub ebx, 1
			cmp ebx, 0
			jne repeat_loop

		endprog:
			push 0
			call [ExitProcess]

section '.idata' import data readable writeable
	library kernel32, 'kernel32.dll',\
		user32, 'user32.dll'


	import kernel32,\
		ExitProcess, 'ExitProcess'

	import user32,\
		MessageBoxA, 'MessageBoxA'