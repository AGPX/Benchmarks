if not exist output (
	mkdir output
)

CALL oscar64 -O1 -xz fill.cpp -o=output/fill.prg
if %ERRORLEVEL% GEQ 1 EXIT /B 1
CALL x64sc.exe output/fill.prg
