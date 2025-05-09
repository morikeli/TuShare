# TuShare

## Mobile app screenshots
| Light mode | Dark mode |
| ------------------------- | ------------------------- |
| | |
| Homescreen (My rides tab) | Homescreen (discover tab) |
| ![homescreen-light](https://github.com/user-attachments/assets/5cea39e7-bdc1-45e8-a44b-b691314afb78) | ![homescreen-dark](https://github.com/user-attachments/assets/d5560fce-0087-41c8-85c9-adcb8e3f4455)|
| | |
| | |
| Profile screen (light mode) | Profile screen (dark mode) |
| ![profile-screen-light](https://github.com/user-attachments/assets/6c906ee9-8ea1-4dc6-a7a9-d8780ca647c2) | ![profile-screen-dark](https://github.com/user-attachments/assets/74d18205-6896-45ec-b3a0-6463f2c0de4c) |
| | |
| | |
| Car slots screen | Car slots screen on scroll |
| ![car-slots](https://github.com/user-attachments/assets/c39d7210-f9e5-43b9-a250-78578a75cbfc) | ![car-slots-on-scroll](https://github.com/user-attachments/assets/1be63e6e-17b0-4a8c-9208-a80b7d9599b9) |
| | |
| | |
| Car slots (Mini map) | Fullscreen map |
| ![car-slots-route-screenshot](https://github.com/user-attachments/assets/6ef671ae-6fca-4292-8b2b-d63f6890df02) | ![fullscreen-map](https://github.com/user-attachments/assets/9815dd87-e8bf-4805-b6f5-9641901e233e) |
| | |
| | |
| Messages screen | Messages screen |
| ![messages-screen-light](https://github.com/user-attachments/assets/6431a69f-7376-4d91-becc-18aa3fd5c055) | ![messages-screen-dark](https://github.com/user-attachments/assets/c3a77632-9d33-4f1f-9465-eb4c2d048e29) | 
| ![chat-screen-light](https://github.com/user-attachments/assets/0c0b6fc8-53e9-4020-b934-c2eaf494cd2b) | ![chat-screen-dark](https://github.com/user-attachments/assets/8e13aceb-8de6-4347-b066-0575bfb85344) |


## Overview
This is a **carpooling (ride-sharing) mobile application** designed to provide a seamless and efficient way for users to share rides. The app connects passengers and drivers, allowing users to book or offer rides conveniently.  

### **Key Features**
- **Ride booking** – Passengers can search for and book available rides.  
- **Ride posting** – Drivers can list their rides, including route, time, and seat availability.  
- **Real-time location tracking** – Integrated with OpenStreetMap for navigation.  
- **Secure authentication** – User authentication and profile management.  
- **Dynamic seat availability** – Tracks remaining seats per ride.  

### **Technologies Used**
- **Frontend:** Flutter (Dart)  
- **Backend:** FastAPI (Python)  
- **Database:** SQLite/PostgreSQL  
- **State Management:** GetX  
- **Authentication:** OAuth 2.0  and JWT-based authentication  
- **Maps & Navigation:** OpenStreetMap


## Developer instructions
---
**NOTE**: 
* To run this project, you **MUST** install Flutter SDK on your machine. Refer to [Flutter's documentation](https://docs.flutter.dev/get-started/install) and follow a step-by-step guide on how you can install Flutter SDK on your OS.

* Make sure you have installed Android Studio or a text editor of your choice - VS Code or XCode.

* Make sure your machine supports virtualization - required to run an emulator. If it doesn't, don't worry, you can install `scrcpy` on your machine or use Android Studio's `mirror device` feature.

**Scrcpy Installation guide** 
* [Install scrcpy on Windows](https://github.com/Genymobile/scrcpy/blob/master/doc/windows.md)
* [Install scrcpy on Linux](https://github.com/Genymobile/scrcpy/blob/master/doc/linux.md)
* [Install scrcpy on MacOS](https://github.com/Genymobile/scrcpy/blob/master/doc/macos.md)

---


#### Installation guide for developers

1. Git clone

Clone this repository by opening your terminal/CMD and change the current working directory to Desktop - use `cd Desktop` command.
```bash
    cd Desktop
    git clone https://github.com/morikeli/TuShare.git
```
2. Create a `.env` file and add the following environment variable.
```env
    API_URL=https://tushare-ride-sharing-app.onrender.com
```
3. Open the cloned repository on your text editor and run this command:
```bash
    flutter run
```
4. Make sure you have a very strong internet connection so that the necessary gradle files can be downloaded. These files are necessary to build the project `apk` file.

---
**Keep in mind**:
* When building the application for the first time, it may take 10 - 15 minutes to finish the installation and build process.
* When running the application using the `flutter run` command, it may take atleast a minute, or more dependencies on your hardware specifications such as CPU speed, or RAM, to install the build files on a physical device.
---


## Contributor expectations
Incase of a bug or you wish to make a contribution, create a new branch using the git command `git checkout -b <name of your branch>` and create a pull request. Wait for review.

You can also open an issue using the `Issues` tab. The reported issue will be reviewed and a solution may be provided.


## Request
Don't forget to star the repo 🌟😉


## Known issues
The app is still under development. More features will be added with time.
