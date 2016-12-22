# CaaS - Conversion as a Service

It's for developing an Cloud-based application for transcoding asynchronously the videos uploaded by users to several different types and qualities.
http://conversion-149903.appspot.com

## General Fonctions

- A client signs in this web application with his Google account. He uploads his video, chooses the formats and qualities offered on the web page, and then enters the corresponding information about this video and an email address for contact.

- Once the demande of the client being registered, this application will send an email to the client in order to confirm that the operation of transcoding is in process and a link to the web page of the summary of the statut of each conversion : waiting, in process, finished. For each statut, it contains the time passed at this current statut.

- When a video has been converted, a link will be sent by email to allow the client to download the converted video. The client has 5 minutes to download the video, otherwise it'll be deleted.


## Specification for Simulation

- This application doesn't actually do the operation of transcoding. It will be simulated by a period of waiting.

## Qualities of service

This application offers 3 types of qualities of service.

- Level "Bronze" : the client can only choose one format to transcode each time.

- Level "Silver" : the client can choose three formats to transcode each time.

- Level "Gold" : the client can choose all the formats offered to transcode each time.

## Deployment

This application is deployed on Google App Engine.

## Built With

* MVC
* Java EE
* Google App Engine
* Google Cloud Storage
* Eclipse EE

## Authors

* **YU Kaiwen (amelieykw)** 
