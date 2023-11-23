@echo off
echo ###################################################################################
echo [W-09] 서비스 관리 - 불필요한 서비스 제거
echo.

echo ■ 진단 기준
echo 	양호 : 일반적으로 불필요한 서비스 (아래 목록 참조)가 중지되어 있음.
echo 	취약 : 일반적으로 불필요한 서비스 (아래 목록 참조)가 구동 중임.
echo 	경고 : 프로그램을 통해 판단할 수 없음.
echo.
echo.

echo ■ 진단 결과
echo    → 경고 ^(프로그램을 통해 판단할 수 없음^)
echo       일반적으로 불필요한 서비스는 아래와 같습니다.
echo.
echo Alerter
echo    네트워크에서 사용자와 컴퓨터에 관리용 경고메시지를 전송하는 기능
echo Automatic updates
echo    중요한 윈도우 업데이트를 다운로하고 설치할 수 있도록 하는 애플리케이션, 수동패치를 적용하거나, MS패치 관리 서버로 패치를 일괄적으로 관리하는 경우 불필요한 서비스
echo Clipbook
echo    서버 내 Slipbook을 다른 클라이언트와 공유
echo Computer Browser
echo    네트워크에 있는 모든 컴퓨터의 목록을 업데이트 하고 관리하는 기능
echo Cryptographic Services
echo    윈도우 파일의 서명을 확인하는 카탈로그 데이터베이스 서비스를 총괄
echo DHCP ClientIP
echo    주소와 DNS 이름을 DHCP 서버에 등록하거나 DHCP 서버로부터 동적으 로 IP주소를 가져오는 기능을 수행. 단독으로 시스템을 수행하며 고정IP를 사용하는 경우 불필요한 서비스
echo Distributed Link Tracking Client, Server
echo    네트워크 도메인의 여러 컴퓨터나 일반컴퓨터에서 NTFS 파일간의 연결을 관리하는 도구. Active Directory가 구성되어 있지 않은 서버에서는 불필요 한 서비스
echo DNS Client
echo    컴퓨터에 대한 도메인 이름 시스템(DNS)이름을 확인하고 캐시에 보관하는 기능. DNS 서버가 아닌 시스템에서는 유명무실하나, IPSEC을 사용하는 경 우 필요한 경우 있음
echo Error reporting Service
echo    프로그램 오류가 시 응용프로그램의 오류를 MS에 보고한다는 내용을 표시 하는 기능
echo Human Interface Device Access
echo    키보드 또는 기타 멀티미디어 장치에 사전 정의된 버튼들을 사용하는 HID 장치들을 위한 서비스
echo IMAPI CD-Burning COM Service
echo    서버에 CD-RW 또는 DVD-RW가 장착되어 보조백업장치 역할을 하기 위해 서 자체 레코딩 백업을 할 수 있음
echo Messenger
echo    클라이언트와 서버 사이에 netsend 및 경고서비스 메시지를 전송하는 기능
echo NetMeeting Remote Desktop Sharing
echo    윈도우9X 운영체제부터 인증된 사용자가 넷미팅을 사용해서 원격으로 컴퓨 터에 접근할 수 있도록 하는 기능
echo Portable Media Serial Number
echo    컴퓨터에 연결된 이동성 음악연주기(미디기기)의 등록번호를 복원하는 기능
echo Print Spooler
echo    인쇄 과정에 있는 스풀링을 관리하는 서비스. 프린터가 있는 경우 필수 서 비스이나, 프린터가 연결되지 않은 시스템에서는 불필요함
echo Remote Registry
echo    원격 사용자가 이 컴퓨터에서 레지스트리 설정을 수정할 수 있도록 설정 하는 애플리케이션
echo Simple TCP/IP Services
echo    Echo, Discard, Character Generator, Daytime, Quote of the Day 지원
echo Wireless Zero Configuration
echo    802.11 어댑터에 대해 자동 구성을 공급하는 기본적인 도구
call %CHK_FILE% WARN %1
echo.
echo.

echo ■ 조치 방안
echo    Step1^) 시작 ^> 실행 ^> SERVICES.MSC ^> "불필요한 서비스" 선택 ^> 속성
echo    Step2^) 시작 유형 ^> 사용 안 함
echo    Step3^) 서비스 상태 ^> 중지설정
echo.
echo.