@echo off

:loop

REM Mendapatkan tanggal dalam format yyyy-MM-dd
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "datetime=%%I"
set "datestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%"

REM Mendapatkan waktu dalam format HH-mm-ss
set "timestamp=%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%"

REM Menggabungkan tanggal dan waktu untuk nama branch
set "branchname=backup-%datestamp%_%timestamp%"

REM Menjalankan perintah Git
git config --global user.name "GTPSHAX"
git config --global user.email "yourgmail@gmail.com"
git init
git remote add origin "Your repo"
git add .
git commit -m "Backup"
git checkout -b "%branchname%"
git push origin "%branchname%"

echo Backup telah dipush ke branch baru dengan nama: %branchname%

REM Menunggu 10 menit sebelum iterasi berikutnya
timeout /t 600 >nul

REM Kembali ke awal loop
goto loop