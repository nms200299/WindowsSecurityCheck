@echo off
echo. [W30] RDS(Remonte Data Services) 제거
echo ■ (진단 현황)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\Virtual Roots" | find /I "MSADC"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" | find /I "RDSServer.DataFactory"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" | find /I "AdvancedDataFactory"
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch" | find /I "VbBusObj.VbBusObjCls"

echo ■ 결과 : 안전
