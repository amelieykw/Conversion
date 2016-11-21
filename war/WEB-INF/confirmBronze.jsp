<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bronze format confirm page</title>
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
	float: center;
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
			<TD><B> <%
 	String bronze_format = (String) request.getAttribute("bronze_format");
 	if (bronze_format != null) {
 		out.print("bronze_format = ");
 		String result = null;
 		if (bronze_format.equals("avi")) {
 			result = "avi";
 		} else if (bronze_format.equals("wmv")) {
 			result = "wmv";
 		} else if (bronze_format.equals("mov")) {
 			result = "mov";
 		} else if (bronze_format.equals("flv")) {
 			result = "flv";
 		} else if (bronze_format.equals("mkv")) {
 			result = "mkv";
 		} else if (bronze_format.equals("rmvb")) {
 			result = "rmvb";
 		} else {
 			result = "No Choice!";
 		}
 		out.print(result);
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