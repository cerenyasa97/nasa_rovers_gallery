# nasa_rovers_gallery

The application that lists the images NASA received from the robots it sent to Mars for research purposes

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Description
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Over the years, NASA has sent four robotic vehicles, called rovers, to Mars--and NASA plans to send another soon. In total, the four rovers that have already gone to Mars are:Sojourner, Spirit and Opportunity, and Curiosity. The Perseverance rover will be heading to the Red Planet soon. This API is designed to collect image data gathered by NASA's Curiosity, Opportunity, and Spirit rovers on Mars and make it more easily available to other developers, educators, and citizen scientists. Each rover has its own set of photos stored in the database, which can be queried separately. There are several possible queries that can be made against the API. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the application, these photos are shown by filtering according to which camera and which rover were taken. User can login to the application with Facebook and Google. Then the home page is displayed with photos taken with Curiosity's FAHZ camera. Other camera photos of Curiosity can be seen by selecting the desired camera from the Sliding Segmented Control widget at the top of the screen. Choose tab from the Bottom Navigation Bar to access the Opportunity and Spirit photos. When you click on the listed photos, the date they were taken according to the world is displayed, and the photo can be copied or shared on different platforms.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the application, the pictures are sorted from the last taken to the first taken according to sol. If a different camera type or different rover is selected in the application, the pre-loaded images are kept in the local memory via Hive and loaded from there.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Spirit, Opprtunity, and Curiosity tabs keep their own state. In this way, when navigating between tabs, each tab continues to work from where it left off.

<p align="center">
  <img src = "https://user-images.githubusercontent.com/59059790/126638867-98295a5f-9bd6-4644-ba8e-67953a352863.gif" width = "300">
</p>

### Getting Started
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

#### Prerequisites
What things you need to install the software and how to install them
* [Android Studio](https://developer.android.com/studio/install)
* [Flutter SDK](https://flutter.dev/docs/get-started/install)

#### Installing
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;After making sure that the Android Studio and Flutter installations are complete, download the project and open it with Android Studio and start using it.

### Getting Help
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please report bugs (actually broken code, not usage questions) to the cerenyasa97/nasa_rovers_gallery GitHub issue tracker, prefixing the issue name with "nasa_rovers_gallery_bug".

### Maintainer
* Ceren Yaşa 
