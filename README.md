# Diving Rules

## Intro
The Diving Rules Application is an app to train on the Fina Diving Rules. It is targeted for the diving judges and referees to learn the rule of the discipline and train on this knowledge. 
This document is the iOS App Readme.

## Technology
### iOS Development
The iOS version of the app is using SwiftUI coding.
The App is for the moment compatible with iOS version 14 but will be updated to be compatible with older versions
The app uses the SF Symbol Lybrary for all this icons within the app.

### Localization
The app has been localized in multiple languages. It is for the moment compatible with:
* EN (Default & Fallback)
* FR
* ES
* IT
The [PO Editor](https://poeditor.com/projects/view?id=425927) tool is used to generate the various localizations Languages

## Version Control
The Project repository is hosted on GitHub:
* [Diving Rules] ()

## Scope of functionalities
The Diving Rules App is organized into the following tabs:
_-- Insert Structure bluprint image here --_

* Rules: A view of the pdf file of the rules
* Penalties: a list of all the penalties summary that allow to view
  * the penalty description
  * the penalty sanction (there can be only one)
    * an aword of 0 points
    * a maximum of 2 points
    * a maximum of 4 1/2 point
    * a deduction of 2 points to the judges grades by the referee
    * a deduction of 1/2 to 2 points by the judge
    * depending on the judges opinion
  * the penalty ownership (Referee and/or Judge)
* Quizz: where you can select the number of questions in your quizz and launch the quizz - for each question will show the same interface as the penalty list but will allow the user to:
  * select from one of the penalty sanctions (they are mutualy exclusive)
  * select within the penalty ownership (the selection can be Referee / Judge / or both)
  * When the user has at least selected a saction and one owner then s/he can go to the next questions
* About: a description of the app and a disclamer of the fact that the app is not a fina app

## Data Model Structure
The code is structured around
* a json to declare the penalties sanctions and ownerships
* a json to list the sanctions descriptions (to check if still needed)
  * the app texts localization
  * the penalties description (the data presented in the app for a penalty is using the localization data and not the json description  - it is used in the description as a reference for the json creation and updates)

_-- To be Updated with an image of the data structure --_

## Project Status
The first version of the app has been releeased as an MVP. There are multiple updates planned.
The objective is to get the first user feedback.

I would like to grow a comunity around this project to get new contributors to help on this open source project weather it is to update the iOS version or to create and update the android version.
It is possible to add new localization if we get a local language support.

New feature will be added 

## Future Updates
These are the high level fetures to work on next:
[ ] update the code to alow further OS compatibilities
[ ] Add the ability to change the language at anytime within the app (user should always be able to switch from local language to EN)
[ ] update the pdf to read an online version of the file and enclose the english as a fallback
[ ] allow the user to view the history of his previous tests
[ ] Add new Quizz not just based on the penalties list (Add multiple choice questions and true/false questions)
[ ] Add a search functionality to search through the pdf and through the penalties

The full list can be found on the [Github iOS Kanban](https://github.com/B3n-d1v3/Diving-Rules/projects/1)

## Authors
- Benoit SUZANNE


## Contributing
-- To be Updated --

## License
This code was created under the GNU 3.0 Open Source License. 
