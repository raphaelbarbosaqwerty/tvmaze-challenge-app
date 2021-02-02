# tvseries_maze_challenge_clean

A new Flutter project. Created by Slidy

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Documentation of the process of creating this App using TVMaze API Challenge

## Run the code
- Follow this to start the application in a Emulator (With emulator open):
1) Clone this repository.
2) Enter in tvseries_maze_challenge_clean

- Type this commands in the terminal
```
flutter clean
flutter pub get
flutter run
```
### Tests and Coverage
- I decided only to do Unit Tests because of the limited time. Widget tests are more complex to do, they spend more time to do.
- Actually have 57 unit tests and all passing.
- You can check then just doing this, open your console in app folder root and:
```
flutter test
```
## Clean-architecture
- I decided to use the Clean-dart approach for this project with BDD(TDD). Based on the requirements I received on the PDF file.
- After receiving the documentation with application flow, I decided to separate in requirements check the folder inside the project.
Folder: **requirements/**
- **requirements/bdd.md**
- **pages/detail_page.md**
- **pages/home_page.md**
- **pages/summary_page.md**

## Modular approach
- Used Modular for **Dependency Injection** and his own structure what is based on decoupled and **independent modules**. Each module has their own pages, business logic, and need to be independent of each other existent.

## State Managment (ValueNotifier as RxNotifier)
- **ValueNotifier** is native from Flutter. I decided to use it together with **RxNotifier** this brings simple transparency to the ValueNotifier.

## Design and UI
- Decided to use a simple UI and interactive.

## Packages and their functions
- **Modular** (Routing and Dependency Injection).
- **RxNotifier** (It's a transparency for ValueNotifier(Native of Flutter)).
- **Hexcolor** (Colors from Hex).
- **Dio** (Powerfull HttpClient).
- **Dartz** (Tests).
- **Intl** (Good functions).
- **Mockito** (Mock classes).
