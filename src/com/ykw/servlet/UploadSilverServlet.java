package com.ykw.servlet;

//Répond sur /upload
/**
 * Cette servlet est appelée par le Blobstore après qu'il ait stocké les fichiers envoyés dans le formulaire.
 */

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class UploadSilverServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/uploadSilver.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		UserService userService = UserServiceFactory.getUserService();
		
		// Récupère une Map de tous les champs d'upload de fichiers
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		// Récupère la liste des fichiers uploadés dans le champ "uploadedFile"
		// (il peut y en avoir plusieurs si c'est un champ d'upload multiple,
		// d'où la List)
		List<BlobKey> blobKeys = blobs.get("uploadedFile");
		// Récupère la clé identifiant du fichier uploadé dans le Blobstore (à
		// sauvegarder)
		BlobKey blobKey = blobKeys.get(0);
		request.setAttribute("blobKey", blobKey);
		String cleFichierUploade = blobKeys.get(0).getKeyString();
		request.setAttribute("cleFichierUploade", cleFichierUploade);

		/*
		 * for getting the name of the video just uploaded
		 */
		getBlobInfo(request);

		// On peut récupérer les autres champs du formulaire comme d'habitude
		String autreChamp = request.getParameter("description");
		request.setAttribute("autreChamp", autreChamp);

		String email = userService.getCurrentUser().getEmail();
		request.setAttribute("email", email);

		String[] silver_format = request.getParameterValues("silver_format");
		request.setAttribute("silver_format", silver_format);

		/*
		 * helper logic classes
		 */
		StockDatastore.stockDatastoreRequest(request);
		
		// Add the task to the default queue.
	    Queue queue = QueueFactory.getDefaultQueue();
	    request.setAttribute("queue", queue);
	    // send an email for confirming the operation immediately
	    queue.add(TaskOptions.Builder
	    		.withUrl("/tasks/sendconfirmemail")
	    		.param("description", autreChamp)
			    .param("videoName", (String) request.getAttribute("videoName"))
			    .param("creation_date", request.getAttribute("creation_date").toString())
			    .param("email", email));
	    // send an email for confirming the processing of operation 2 min later
	    queue.add(TaskOptions.Builder
	    		.withUrl("/tasks/sendprocessingemail")
	    		.param("description", autreChamp)
			    .param("videoName", (String) request.getAttribute("videoName"))
			    .param("creation_date", request.getAttribute("creation_date").toString())
			    .param("email", email)
	    		.countdownMillis(2*60*1000));
	    // send an email with download link 5 min later
	    queue.add(TaskOptions.Builder
	            .withUrl("/tasks/senddownloademail")
	            .param("description", autreChamp)
			    .param("videoName", (String) request.getAttribute("videoName"))
			    .param("creation_date", request.getAttribute("creation_date").toString())
			    .param("email", email)
			    .param("cleFichierUploade", cleFichierUploade)
	            .countdownMillis(5*60*1000));

		 this.getServletContext().getRequestDispatcher("/WEB-INF/confirmSilver.jsp").forward(request, response);
	}

	private void getBlobInfo(HttpServletRequest request) {
		/*
		 * for getting the name of the video just uploaded
		 */
		BlobInfoFactory blobInfoFactory = new BlobInfoFactory();
		BlobInfo blobInfo = blobInfoFactory.loadBlobInfo((BlobKey) request.getAttribute("blobKey"));
		String videoName = blobInfo.getFilename();
		request.setAttribute("videoName", videoName);
		Date creation_date = blobInfo.getCreation();
		request.setAttribute("creation_date", creation_date);
	}
}