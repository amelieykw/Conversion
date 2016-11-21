package com.ykw.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.utils.SystemProperty;

public class SendDownloadEmail {

	private static final Logger log = Logger.getLogger(SendDownloadEmail.class.getName());

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String description = request.getParameter("description");
		String videoName =  request.getParameter("videoName");
		String creation_date = request.getParameter("creation_date");
		String email = request.getParameter("email");
		String cleFichierUploade = request.getParameter("cleFichierUploade");

		String message = "Your file " + videoName + " about " + description + " has been uploaded at " + creation_date
				+ "\n" + " You can find it here : " + "http://1-dot-conversion-149903.appspot.com/confirm?blob-key="
				+ cleFichierUploade;

		try {
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("admin@" + SystemProperty.applicationId.get() + ".appspotmail.com",
					"Administrateur"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, "user"));
			msg.setSubject("The transcodage of your video has been done !");
			msg.setText(message);
			Transport.send(msg);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
