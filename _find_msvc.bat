@rem VS120COMNTOOLS=E:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\Tools\
@rem VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\
@rem VS150COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\
@rem VS160COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\
@rem VS80COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 8\Common7\Tools\
@rem VS90COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\

@if "%MSVC%"=="" goto LOOKUP_FOR_MSVC
@exit /B 0

:LOOKUP_FOR_MSVC
@rem set MSVC_ARCH=x64

@if "%VS160COMNTOOLS%"=="" goto CHECK_2022
@echo Found MSVC2019
@set MSVC=2019
@exit /B 0

:CHECK_2022
@if not exist "%ProgramFiles%\Microsoft Visual Studio\2022" goto CHECK_2026
@echo Found MSVC2022
@set MSVC=2022
@exit /B 0

:CHECK_2026
@if not exist "%ProgramFiles%\Microsoft Visual Studio\18" goto CHECK_2064
@echo Found MSVC2026
@set MSVC=2026
@exit /B 0

:CHECK_2064
@set MSVC=2064
@exit /B 1

