@echo off
echo ###################################################################################
echo [W-09] ���� ���� - ���ʿ��� ���� ����
echo.

echo �� ���� ����
echo 	��ȣ : �Ϲ������� ���ʿ��� ���� (�Ʒ� ��� ����)�� �����Ǿ� ����.
echo 	��� : �Ϲ������� ���ʿ��� ���� (�Ʒ� ��� ����)�� ���� ����.
echo 	��� : ���α׷��� ���� �Ǵ��� �� ����.
echo.
echo.

echo �� ���� ���
echo    �� ��� ^(���α׷��� ���� �Ǵ��� �� ����^)
echo       �Ϲ������� ���ʿ��� ���񽺴� �Ʒ��� �����ϴ�.
echo.
echo Alerter
echo    ��Ʈ��ũ���� ����ڿ� ��ǻ�Ϳ� ������ ���޽����� �����ϴ� ���
echo Automatic updates
echo    �߿��� ������ ������Ʈ�� �ٿ���ϰ� ��ġ�� �� �ֵ��� �ϴ� ���ø����̼�, ������ġ�� �����ϰų�, MS��ġ ���� ������ ��ġ�� �ϰ������� �����ϴ� ��� ���ʿ��� ����
echo Clipbook
echo    ���� �� Slipbook�� �ٸ� Ŭ���̾�Ʈ�� ����
echo Computer Browser
echo    ��Ʈ��ũ�� �ִ� ��� ��ǻ���� ����� ������Ʈ �ϰ� �����ϴ� ���
echo Cryptographic Services
echo    ������ ������ ������ Ȯ���ϴ� īŻ�α� �����ͺ��̽� ���񽺸� �Ѱ�
echo DHCP ClientIP
echo    �ּҿ� DNS �̸��� DHCP ������ ����ϰų� DHCP �����κ��� ������ �� IP�ּҸ� �������� ����� ����. �ܵ����� �ý����� �����ϸ� ����IP�� ����ϴ� ��� ���ʿ��� ����
echo Distributed Link Tracking Client, Server
echo    ��Ʈ��ũ �������� ���� ��ǻ�ͳ� �Ϲ���ǻ�Ϳ��� NTFS ���ϰ��� ������ �����ϴ� ����. Active Directory�� �����Ǿ� ���� ���� ���������� ���ʿ� �� ����
echo DNS Client
echo    ��ǻ�Ϳ� ���� ������ �̸� �ý���(DNS)�̸��� Ȯ���ϰ� ĳ�ÿ� �����ϴ� ���. DNS ������ �ƴ� �ý��ۿ����� �������ϳ�, IPSEC�� ����ϴ� �� �� �ʿ��� ��� ����
echo Error reporting Service
echo    ���α׷� ������ �� �������α׷��� ������ MS�� �����Ѵٴ� ������ ǥ�� �ϴ� ���
echo Human Interface Device Access
echo    Ű���� �Ǵ� ��Ÿ ��Ƽ�̵�� ��ġ�� ���� ���ǵ� ��ư���� ����ϴ� HID ��ġ���� ���� ����
echo IMAPI CD-Burning COM Service
echo    ������ CD-RW �Ǵ� DVD-RW�� �����Ǿ� ���������ġ ������ �ϱ� ���� �� ��ü ���ڵ� ����� �� �� ����
echo Messenger
echo    Ŭ���̾�Ʈ�� ���� ���̿� netsend �� ����� �޽����� �����ϴ� ���
echo NetMeeting Remote Desktop Sharing
echo    ������9X �ü������ ������ ����ڰ� �ݹ����� ����ؼ� �������� ��ǻ �Ϳ� ������ �� �ֵ��� �ϴ� ���
echo Portable Media Serial Number
echo    ��ǻ�Ϳ� ����� �̵��� ���ǿ��ֱ�(�̵���)�� ��Ϲ�ȣ�� �����ϴ� ���
echo Print Spooler
echo    �μ� ������ �ִ� ��Ǯ���� �����ϴ� ����. �����Ͱ� �ִ� ��� �ʼ� �� ���̳�, �����Ͱ� ������� ���� �ý��ۿ����� ���ʿ���
echo Remote Registry
echo    ���� ����ڰ� �� ��ǻ�Ϳ��� ������Ʈ�� ������ ������ �� �ֵ��� ���� �ϴ� ���ø����̼�
echo Simple TCP/IP Services
echo    Echo, Discard, Character Generator, Daytime, Quote of the Day ����
echo Wireless Zero Configuration
echo    802.11 ����Ϳ� ���� �ڵ� ������ �����ϴ� �⺻���� ����
call %CHK_FILE% WARN %1
echo.
echo.

echo �� ��ġ ���
echo    Step1^) ���� ^> ���� ^> SERVICES.MSC ^> "���ʿ��� ����" ���� ^> �Ӽ�
echo    Step2^) ���� ���� ^> ��� �� ��
echo    Step3^) ���� ���� ^> ��������
echo.
echo.