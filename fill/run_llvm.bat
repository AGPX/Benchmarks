if not exist output (
	mkdir output
)

CALL mos-c64-clang++.bat -Os -DLLVM_MOS fill.cpp -o output/fill_llvm.prg
if %ERRORLEVEL% GEQ 1 EXIT /B 1

CALL mos-c64-clang++.bat -Os -DLLVM_MOS fill.cpp -o output/fill_llvm.prg -Wl,--lto-emit-asm

CALL x64sc.exe output/fill_llvm.prg