@echo off
echo ###################################################################################
echo [W72] ���� ���� - Dos���� ��� ������Ʈ�� ����
echo.

echo �� ���� ����
echo 	��ȣ :  DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� ����.
echo 	��� :  DoS ��� ������Ʈ�� ���� �Ʒ��� ���� �����Ǿ� ���� ���� ���.
echo    SynAttackProtect = REG_DWORD 0(False) -^> 1 �̻�
echo    EnableDeadGWDetect = REG_DWORD 1(True) -^> 0
echo    KeepAliveTime = REG_DWORD 7,200,000(2�ð�) -^> 300,000(5��)
echo    NoNameReleaseOnDemand = REG_DWORD 0(False) -^> 1
echo 	���� :  ���α׷��� ���� �Ǵ��� �� ����.
echo    �� Windows 2012�� ��� ������ ���� ����  ��
echo.
echo.

echo �� ���� �����
net users | find /v "����� �� �����߽��ϴ�."
rem "����� �� �����߽��ϴ�." ���ڸ� ���� ���
echo 	�� ���� ^(�Ǵ� �Ұ�^)
echo.
echo.

echo �� ��ġ ���
echo 	Step1^) ���� -^> ���� -^> REGEDIT
echo 	Step2^) HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\ �˻�
echo    Step3^) DOS ��� ������Ʈ�� �� �߰� �Ǵ�, ����
call %CHK_FILE% WARN %1
echo.
echo.