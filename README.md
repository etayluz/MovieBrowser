# MovieBrowser

**MovieBrowser** is a SwiftUI-based iOS app that allows users to browse and view details of movies. The app fetches movie data from an API, displays movie posters in a grid view, and lets users navigate to a detailed view of each movie. The app uses **Kingfisher** to efficiently load and cache images from URLs.

## Features
- Browse movies in a scrollable grid view.
- View movie details such as title, description, and poster.
- Lazy image loading and caching using **Kingfisher**.
- Seamless navigation to a detailed view of each movie.

## Requirements
- iOS 15.0+
- Xcode 16+
- Swift 5+
- CocoaPods or Swift Package Manager (SPM) for dependency management.

## Libraries and Tools Used
- Kingfisher: For image loading, caching, and displaying images from URLs.
- SwiftUI: For the user interface.
- Combine: For reactive programming, handling async data streams.
- NavigationStack: For handling navigation between views.

## Installation

You can install **MovieBrowser** by cloning this repository and opening it in Xcode.

### 1. Clone the repository:
```bash
git clone https://github.com/etayluz/MovieBrowser.git
```

### 2. Open the project in Xcode
```bash
open MovieBrowser/MovieBrowser.xcodeproj
```

## Usage
Once the project is set up, you can run the app on a simulator or device. The main screen will show a grid of movies, and you can tap on any movie to view its details.

### Screen Flow:
- Home Screen: Displays a grid of movie posters fetched from the network.
- Movie Detail Screen: Displays detailed information about the selected movie, including its title, description, and poster.


## License
This project is licensed under the MIT License
