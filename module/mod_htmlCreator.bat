@echo off
:: echo %1

set "fileName=test.html"
set "htmlWrite=call mod_fileWrite.bat %fileName%"

echo %fileName%

%htmlWrite% startHTML
%htmlWrite% append "<html>"
%htmlWrite% append "	<head>"
%htmlWrite% append "	<title>example</title>"
%htmlWrite% append "		<style>"
%htmlWrite% append "			table {"
%htmlWrite% append "				width: 50%;"
%htmlWrite% append "				border-collapse: collapse;"
%htmlWrite% append "			}"
%htmlWrite% append "			th, td {"
%htmlWrite% append "				border: 1px solid #ddd;"
%htmlWrite% append "				padding: 10px;"
%htmlWrite% append "			}"
%htmlWrite% append "			th {"
%htmlWrite% append "				background-color: #f2f2f2;"
%htmlWrite% append "			}"
%htmlWrite% append "		</style>"
%htmlWrite% append "	</head>"
%htmlWrite% appendNULL
rem 테이블 CSS 적용

%htmlWrite% append "	<body>"
%htmlWrite% append "		<table 	border="1">"
%htmlWrite% append "		<th>Col 1</th>"
%htmlWrite% append "		<th>Col 2</th>"
%htmlWrite% append "		<tr>"
%htmlWrite% append "			<td>Row 1</th>"
%htmlWrite% append "			<td>Row 2</th>"
%htmlWrite% append "		</tr>"
%htmlWrite% append "		<tr>"
%htmlWrite% append "			<td>Row 1</th>"
%htmlWrite% append "			<td>Row 2</th>"
%htmlWrite% append "		</tr>"
%htmlWrite% append "		</table>"
%htmlWrite% append "	</body>"
%htmlWrite% append "</html>"
rem 테이블 생성

pause>nul