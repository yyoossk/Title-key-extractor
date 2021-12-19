CertUtil -f -encodehex %1 1.txt
findstr 0180 1.txt >> 2.txt
set infilenm=2.txt
set outfilenm=3.txt
set beforestr=0180	
set afterstr=
type nul >3.txt
setlocal enabledelayedexpansion
for /f "delims=" %%A in (%infilenm%) do (
    set line=%%A
    echo !line:%beforestr%=%afterstr%!>>%outfilenm%
)
set infilenm=3.txt
set outfilenm=4.txt
set beforestr= 
set afterstr=
type nul >4.txt
setlocal enabledelayedexpansion
for /f "delims=" %%A in (%infilenm%) do (
    set line=%%A
    echo !line:%beforestr%=%afterstr%!>>%outfilenm%
)
dd if=./4.txt of=./titleksy.txt bs=1 count=32
)
del 1.txt
del 2.txt
del 3.txt
del 4.txt
pause