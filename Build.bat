@echo off
asm68k.exe /q /o ws+ /p main.asm,Rom.bin,, .lst
if not exist Rom.bin pause