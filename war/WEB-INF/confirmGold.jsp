<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gold format confirm page</title>
</head>
<style>
TABLE {
	float: center;
	text-align: left;
	width: 100%;
}
TH {
	width: 30%;
}
TD {
	width: 70%;
}
.video {
	float:center;
}
</style>
<body>
	<TABLE BORDER=2>
		<TR>
			<TH><B>video name</B></TH>
			<TD><B><%=request.getAttribute("videoName")%></B></TD>
		</TR>
		<TR>
			<TH><B>created time</B></TH>
			<TD><B><%=request.getAttribute("creation_date")%></B></TD>
		</TR>
		<TR>
			<TH><B>description</B></TH>
			<TD><B><%=request.getAttribute("autreChamp")%></B></TD>
		</TR>
		<TR>
			<TH><B>user email</B></TH>
			<TD><B><%=request.getAttribute("email")%></B></TD>
		</TR>
		<TR>
			<TH><B>gold format</B></TH>
			<TD><B>
					<%
						String[] gold_formats = (String[]) request.getAttribute("gold_format");
						if (gold_formats != null) {
							out.print("gold_format = ");
							for (String gold_format : gold_formats) {
								out.print(gold_format + " ");
							}
						} else {
							out.println("You didn't choose any format!");
						}
					%>
			</B></TD>
		</TR>
		<TR>
			<TD class="video" colspan="2">
				<%
					String videoLocation = "http://1-dot-conversion-149903.appspot.com/confirm?blob-key="
							+ request.getAttribute("cleFichierUploade");
				%> <video width="400" controls> <source
					src="<%=videoLocation%>"> Your browser does not support
				HTML5 video. </video>
			</TD>
		</TR>
	</TABLE>
</body>
</html>