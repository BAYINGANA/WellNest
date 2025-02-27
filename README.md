# **WellNest App**  
**A Student Mental Wellness & Peer Support App**  

---

## **📱 Overview**  
WellNest is a **mental wellness app** designed to help students track their moods, write journal entries, and connect with peer support groups. Built using **Flutter**, the app provides a safe and supportive environment for students to reflect on their emotions, access guided meditation, and seek help when needed.  

---

## **✨ Features**  
- **Mood Tracking & Journaling**: Log moods and write personal reflections.  
- **Anonymous Peer Support Chat**: Join support groups and chat anonymously.  
- **Guided Meditation & Stress Relief**: Access relaxation exercises and calming music.  
- **Emergency Contact Integration**: Quick access to counselors and helplines.  
- **Offline Storage**: Journals and mood logs are stored locally using SQLite.  

---

## **🚀 Getting Started**  

### **Prerequisites**  
- Flutter SDK (version 3.0.0 or higher)  
- Dart (version 2.17.0 or higher)  
- Android Studio or VS Code (with Flutter and Dart plugins installed)  

### **Installation**  
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-username/wellnest-app.git
   ```  
2. Navigate to the project directory:  
   ```bash
   cd wellnest-app
   ```  
3. Install dependencies:  
   ```bash
   flutter pub get
   ```  
4. Run the app:  
   ```bash
   flutter run
   ```  

---

## **🛠️ Dependencies**  
- **url_launcher**: For making phone calls and opening URLs.  
- **youtube_player_flutter**: For playing guided meditation videos.  
- **audioplayers**: For playing relaxing music and sounds.  
- **google_fonts**: For custom typography.  
- **connectivity_plus**: For checking internet connectivity.  

---

## **📂 Project Structure**  
- **lib/screens**: Contains all the app screens (e.g., login, home, journal).  
- **lib/services**: Includes the `DatabaseService` for SQLite operations.  
- **lib/widgets**: Custom widgets like the bottom navigation bar.  
- **lib/models**: Data models (e.g., `JournalEntry`).  

---

## **📝 Notes**  
- The app uses **SQLite** for offline storage. Ensure you have the necessary permissions set up in `AndroidManifest.xml` and `Info.plist` for database access.  
- Replace placeholder API keys and URLs with your own in the code.  

---

## **📜 License**  
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.  

---

**Happy Coding!** 😊  
*Developed with ❤️ by [BAYINGANA]*
