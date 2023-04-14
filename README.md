# Poly Brewers
by Gregory Jans, Nicholas Porter, and Tomas Uribe

Poly Brewers is a free and open website/database for homebrewing beer recipes. Any user with or without an account can search for and view recipes, as well as filter search results. Users who create an account will be able to save recipes for later, view a beginner's guide for homebrewing, as well as post their own recipes.

## Code Description
The source code for Poly Brewers consists of a variety of widgets and functional modules which are located within the lib folder. The code, when run, conssists of a singular widget tree starting with the App widget and expanding through child widgets. As of now, the system is designed to be built for web, but may be expanded to other platforms in the future.

## Code Organization
The main codebase is located in the lib directory, with other directories being auto-generated by the Flutter framework to allow for easy portability between platforms. Within lib, each major widget is broken into a seperate dart file, with major widgets including website pages, components that are often reused, and framework widgets such as the head of the widget tree. Within the /form_pages subfolder is each of the three pages used by the brew form to submit a recipe to the database. The /services subfolder contains any dart file that is not a major widget and focuses more on database authentication and communication. The models.dart file contains any data structures that are used throughout the code, where models.g.dart is an auto-generated file. 

*Please note that although firebase_options.dart is not in /services, it is not a widget*

## Work Done By The Team
All code within the lib folder and its subfolders was created by a member of the development team, appart from models.g.dart. Any additional folders and files have been auto-generated by Flutter, with the majority of the code within them remaining untouuched, although some slight changes may heve been made depending on the file.

## External Dependancies
This project depends on Firebase services provided by Google, the flutter_rating_bar package and the rxdart package. Flutter_rating_bar is used to create the interactable rating bar within the individual recipe page while the rxdart package is used to help display the beginner's manual pdf. A full list of required dependancies can be found in the pubspec.yaml file.

## Build Directions
In order to build Poly Brewers locally, the following process is recommentded. Please note that flutter must be installed on the system:

1. Download and extract the zip file
2. Navigate to the extracted folder from the command prompt
3. Run the following command: ```flutter run```
4. If prompted to select a device, please select the apropriate option for Chrome (chrome) 

Notes:
  * choosing other options may cause unintended errors
  * the running process may take several minutes
