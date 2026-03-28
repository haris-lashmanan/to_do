# todolist

To Do List

## Getting Started

This project is a starting point for a Flutter application.

This project follows MVVM Architect pattern with Provider as State management.

It has localization features for future enhancements.

Splash will be shown until the initialization of the app is being completed.

Without network we won't be able to fetch ToDos, hence if there is no network, we will be showing the user with No Network and will ask user to retry once network connection is back.

## Project Structure

 - data : For models, network calls and repositories
 - l10n : For Localizations
 - utils: App constants, themes, router will be defined
 - view_models: All business level logics should be written over here
 - view: And finally presentation layer where only StateFull and Stateless widgets to be present.
 - main.dart: Opens Splash screen and will wait for api fetch and in future if any initialization like Firebase or plugins comes post initialization will create the Router and move the user to the respective page.

In future if we need encryption or decryption, it can be added in utils.