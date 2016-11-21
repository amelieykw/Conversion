package com.ykw.servlet;

import javax.servlet.http.HttpServletRequest;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class StockDatastore {
	
	public static void stockDatastoreRequest(HttpServletRequest request) {
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		// Crée l'entité de type (kind) "UploadFichier" avec l'ID
		// "cleFichierUploade"
		Entity uploadFichier = new Entity("UploadFichier", (String) request.getAttribute("cleFichierUploade"));

		uploadFichier.setProperty("nom", "UploadFichier_" + request.getAttribute("cleFichierUploade"));
		uploadFichier.setProperty("email", request.getAttribute("email"));
		
		String bronze_format = (String) request.getAttribute("bronze_format");
		String[] silver_format = (String[]) request.getAttribute("silver_format");
		String[] gold_format = (String[]) request.getAttribute("gold_format");
		
		if(bronze_format != null){
			uploadFichier.setProperty("bronze_format", request.getAttribute("bronze_format"));
		}else if(silver_format != null) {
			int n = 0;
			for (String silver : silver_format) {
				n += 1;
				uploadFichier.setProperty("silver_format_" + n, silver);
			}
		}else {
			int n = 0;
			for (String gold : gold_format) {
				n += 1;
				uploadFichier.setProperty("gold_format_" + n, gold);
			}
		}

		datastore.put(uploadFichier);
	}

}
