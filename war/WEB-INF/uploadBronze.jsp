<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<!DOCTYPE html>

<html>
<head>
<title>Bronze Format</title>
<meta charset="utf-8" />
</head>

<body>
	<h1>Envoyez un video dans le Cloud !</h1>
	<form action="<%=blobstoreService.createUploadUrl("/upload/bronzeFormat")%>"
		method="post" enctype="multipart/form-data">
		<p>
			<label>Fichier à envoyer : <input type="file"
				name="uploadedFile" accept="video/*" /></label>
		</p>
		<p>
			<label>Description du fichier : <input type="text"
				name="description" /></label>
			<!-- 			<label>Enter Your Email : 
				<input type="text" name="email"/></label> -->
		</p>
		<p>
		<fieldset>
			<legend>Bronze (only 1 choice):</legend>
			<input type="radio" name="bronze_format" value="avi" checked>AVI
			<input type="radio" name="bronze_format" value="wmv">WMV <input
				type="radio" name="bronze_format" value="mov">MOV <input
				type="radio" name="bronze_format" value="flv">FLV <input
				type="radio" name="bronze_format" value="mkv">MKV <input
				type="radio" name="bronze_format" value="rmvb">Real Video
		</fieldset>
		</p>
		<p>
			<input type="submit" />
		</p>
	</form>
	<script type="text/javascript">
		function stopRKey(evt) {
			var evt = (evt) ? evt : ((event) ? event : null);
			var node = (evt.target) ? evt.target
					: ((evt.srcElement) ? evt.srcElement : null);
			if ((evt.keyCode == 13) && (node.type == "text")) {
				return false;
			}
		}

		document.onkeypress = stopRKey;
	</script>
</body>
</html>