# Documentation of the process of creating this App using TVMaze API Challenge

## Run the code
### With Emulator
- Follow this to start the application in a Emulator (With emulator open):
1) Clone this repository.
2) Enter in `tvseries_maze_challenge_clean`  
`Flutter SDK Version: 1.22.5`  
- Type this commands in the terminal
```
flutter clean
flutter pub get
flutter run
```
- Folder [distribution](https://github.com/raphaelbarbosaqwerty/tvmaze-challenge-app/tree/main/distribution)
- For emulator you can download from the folder the file `app-debug.apk`.  
### With Real-Device
- Folder [distribution](https://github.com/raphaelbarbosaqwerty/tvmaze-challenge-app/tree/main/distribution)
- For Real device you can download from the folder the file `app-release.apk`.  
## Tests and Coverage
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

### Images
<img src="https://raw.githubusercontent.com/raphaelbarbosaqwerty/tvmaze-challenge-app/main/images/app-1.png" height="600"> <img src="https://raw.githubusercontent.com/raphaelbarbosaqwerty/tvmaze-challenge-app/main/images/app-2.png" height="600"> <img src="https://raw.githubusercontent.com/raphaelbarbosaqwerty/tvmaze-challenge-app/main/images/app-3.png" height="600"> <img src="https://raw.githubusercontent.com/raphaelbarbosaqwerty/tvmaze-challenge-app/main/images/app-4.png" height="600"> <img src="https://raw.githubusercontent.com/raphaelbarbosaqwerty/tvmaze-challenge-app/main/images/app-5.png" height="600">
