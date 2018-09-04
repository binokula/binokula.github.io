for /f "tokens=*" %%f in ('dir /b /a:d "../"') do IF NOT [%%f]==[.git] (IF NOT [%%f]==[mkdocs]  ( del /Q %%f))
mkdocs build
xcopy /s/Y/Q site\* ..\*

