# SwiftUI movie app - Cinemate

### Overview
This is a SwiftUI-based movie app that follows the MVVM (Model-View-ViewModel) architecture. The app integrates Firebase Authentication for Single Sign-On (SSO) and utilizes Firebase Database to store user details and watchlist data. 
Additionally, it fetches movie data from The Movie Database (TMDB) API.

Get started with the [TMDB API](https://developer.themoviedb.org/docs/getting-started)

### Features
- **Dark Mode**: The app supports Dark Mode and light mode.
- **Trending Movies**: Explore trending movies based on today and this week for the latest and most popular content.
- **Top Rated Movies**: Discover top-rated movies.
- **Movies by Genres**:  Browse movies categorized by genres, allowing users to find content based on their preferences.
- **Movie Details View**:
  - Add to Watchlist: Save movies to your watchlist for later viewing.
  - Movie Overview: Get a detailed overview of each movie.
  - Movie Trailer: Watch trailers directly within the app.
  - Cast Information: Explore the cast details of each movie.
- **Search Movies**:  Utilize a search feature to find movies quickly based on the titles.
- **Watchlist**: Manage your watchlist by adding or removing movies.
- **Profile View**: View the user profiles and the log out option.

> iOS version: 17.0

https://github.com/avishka964/cinemate/assets/62757898/88a5e155-a05a-4378-ae7d-4b5567a9c31e

### Dark mode and light mode
<img src="https://github.com/avishka964/cinemate/assets/62757898/0e4f9670-e2cc-4f88-bf6f-4ffea99364de" width="393" height="852"/>

<img src="https://github.com/avishka964/cinemate/assets/62757898/3841b330-a2c0-4186-8ffe-d7fdb62eccee" width="393" height="852"/>

### Prerequisites
- Xcode: Ensure you have Xcode installed on your development machine.
- Firebase Account: Create a Firebase project and set up Firebase Authentication and Database.
- TMDB API Read Access Token: Obtain an API Read Access Token from TMDB to access their movie data.

1. Clone the repository
    ```
    git clone https://github.com/avishka964/cinemate.git
    ```
2. Configure Firebase
    - Add your Firebase configuration plist file to the project.
    - Update the Firebase settings in the app accordingly.
    
3. Configure TMDB API Read Access Token
   
4. Add YouTubePlayerKit Package:
    - The app uses the [YouTubePlayerKit](https://github.com/SvenTiigi/YouTubePlayerKit) package for displaying YouTube videos. Ensure that you have integrated this package into your project.
   
5. Build and run the app in Xcode.




