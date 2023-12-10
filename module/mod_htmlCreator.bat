@echo off
:: echo %1

set "fileName=test.html"
set "fileWrite=call mod_fileWrite.bat %fileName%"

echo %fileName%

%fileWrite% startHTML
%fileWrite% append "<html>"
%fileWrite% append "	<head>"
%fileWrite% append "	<title>example</title>"
%fileWrite% append "		<style>"
%fileWrite% append "			table {"
%fileWrite% append "				width: 50%;"
%fileWrite% append "				border-collapse: collapse;"
%fileWrite% append "			}"
%fileWrite% append "			th, td {"
%fileWrite% append "				border: 1px solid #ddd;"
%fileWrite% append "				padding: 10px;"
%fileWrite% append "			}"
%fileWrite% append "			th {"
%fileWrite% append "				background-color: #f2f2f2;"
%fileWrite% append "			}"
%fileWrite% append "		</style>"
%fileWrite% append "	</head>"
%fileWrite% appendNULL
rem 테이블 CSS 적용

%fileWrite% append "	<body>"
%fileWrite% append "		<table 	border="1">"
%fileWrite% append "		<th>Col 1</th>"
%fileWrite% append "		<th>Col 2</th>"
%fileWrite% append "		<tr>"
%fileWrite% append "			<td>Row 1</th>"
%fileWrite% append "			<td>Row 2</th>"
%fileWrite% append "		</tr>"
%fileWrite% append "		<tr>"
%fileWrite% append "			<td>Row 1</th>"
%fileWrite% append "			<td>Row 2</th>"
%fileWrite% append "		</tr>"
%fileWrite% append "		</table>"
%fileWrite% append "	</body>"
%fileWrite% append "</html>"
rem 테이블 생성

pause>nul