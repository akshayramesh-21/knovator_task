# Knovator Posts App - Technical Documentation

## Architecture Overview

This application follows **Clean Architecture** principles with a clear separation of concerns across multiple layers:

```
lib/
├── application/          # Application Layer (BLoC State Management)
│   └── bloc/
│       └── posts/
│           ├── post_bloc.dart
│           ├── post_event.dart
│           └── post_state.dart
│
├── core/                 # Core Layer (Shared Utilities)
│   └── core/
│       ├── api_end_points/
│       ├── di/           # Dependency Injection
│       ├── errors/       # Failure Classes
│       └── styles/
│
├── domain/               # Domain Layer (Business Logic & Models)
│   └── all_posts/
│       ├── i_all_product_repo.dart    # Repository Interface
│       └── post_model/
│           └── post_model.dart
│
├── infrastructure/       # Infrastructure Layer (Data Sources)
│   └── posts/
│       └── posts_repository.dart      # Repository Implementation
│
├── presentation/         # Presentation Layer (UI)
│   └── pages/
│       ├── homepage.dart
│       └── post_detail_page.dart
│
└── main.dart             # App Entry Point
```

### Layer Responsibilities

| Layer | Responsibility |
|-------|----------------|
| **Presentation** | UI widgets, user interactions, displaying state |
| **Application** | BLoC classes managing state and business logic orchestration |
| **Domain** | Entity models, repository interfaces (contracts) |
| **Infrastructure** | API calls, local storage, repository implementations |
| **Core** | Shared utilities, DI setup, error handling, constants |

---

## Features Implemented

### 1. Mark as Read
- **Behavior**: When a user taps on any list item, it is marked as read
- **Visual Feedback**: Background color changes from light blue (`#F5F9FF`) to white
- **Icon Change**: Timer icon is replaced with a green checkmark
- **Implementation**: `PostEvent.markAsRead(postId)` dispatched on tap

### 2. Timer Icon
- **Display**: Each post shows a timer icon on the right side
- **Random Duration**: Timer values are randomly assigned from `[10, 20, 25]` seconds
- **Visual**: Blue timer badge with countdown display

### 3. Timer Functionality
- **Auto-start**: Timer starts counting when item appears on screen (>50% visible)
- **Pause on Scroll**: Timer pauses when item scrolls out of view (<10% visible)
- **Pause on Navigation**: Timer pauses when user navigates to detail page
- **Resume**: Timer resumes from paused value when item becomes visible again
- **Auto Mark as Read**: When timer reaches 0, post is automatically marked as read
- **Implementation**: Uses `VisibilityDetector` widget for scroll-based visibility tracking

### 4. Local Storage
- **Persistence**: Posts are cached in `SharedPreferences`
- **Offline First**: On app start, cached data is displayed immediately
- **Background Sync**: API is called in background to fetch fresh data
- **State Preservation**: Read status and timer values persist across app restarts

---

## Third-Party Libraries

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | ^9.1.0 | State management using BLoC pattern |
| `bloc` | ^9.1.0 | Core BLoC library |
| `freezed_annotation` | ^2.4.4 | Immutable class generation annotations |
| `freezed` | ^2.5.8 | Code generator for immutable classes |
| `json_annotation` | ^4.9.0 | JSON serialization annotations |
| `json_serializable` | ^6.9.4 | JSON serialization code generator |
| `dartz` | ^0.10.1 | Functional programming (Either type for error handling) |
| `get_it` | ^8.0.3 | Service locator for dependency injection |
| `injectable` | ^2.5.0 | DI annotations |
| `injectable_generator` | ^2.7.0 | DI code generator |
| `http` | ^1.3.0 | HTTP client for API calls |
| `shared_preferences` | ^2.2.2 | Local storage for data persistence |
| `shimmer` | ^3.0.0 | Loading skeleton animations |
| `visibility_detector` | ^0.4.0+2 | Detect widget visibility for timer pause/resume |
| `equatable` | ^2.0.5 | Value equality for objects |

---

## State Management (BLoC)

### Events
```dart
PostEvent.getPosts()                    // Fetch posts from API
PostEvent.markAsRead(postId)            // Mark a post as read
PostEvent.updateTimerDuration(postId, duration)  // Update timer countdown
PostEvent.initializeFromLocalStorage()  // Load cached posts
PostEvent.saveToLocalStorage()          // Save posts to cache
PostEvent.pauseTimer(postId)            // Pause specific timer
PostEvent.resumeTimer(postId)           // Resume specific timer
PostEvent.pauseAllTimers()              // Pause all timers (navigation)
PostEvent.resumeAllTimers()             // Resume all timers
```

### State
```dart
PostState({
  bool isLoading,
  bool isError,
  bool isSuccess,
  List<PostModel> allPosts,
  bool isInitialized,
})
```

---

## How to Run the Application

### Prerequisites
- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Connected device or emulator

### Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd knovator_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (Freezed, JSON Serializable, Injectable)**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**
   ```bash
   # List available devices
   flutter devices
   
   # Run on specific device
   flutter run -d <device-id>
   
   # Or run on default device
   flutter run
   ```

5. **Build APK (optional)**
   ```bash
   flutter build apk --release
   ```

---

## API Endpoint

The app fetches posts from JSONPlaceholder API:
```
GET https://jsonplaceholder.typicode.com/posts
```

Response format:
```json
[
  {
    "userId": 1,
    "id": 1,
    "title": "Post title",
    "body": "Post body content"
  }
]
```

---

## Key Implementation Details

### Timer Management
- Timers are managed in `PostBloc` using `Map<int, Timer>` for active timers
- Paused timers are tracked in `Set<int> _pausedTimers`
- Each timer ticks every second and updates the state

### Visibility Detection
- `VisibilityDetector` wraps each list item
- Visibility threshold: >50% visible = resume, <10% visible = pause
- Prevents unnecessary timer operations for partially visible items

### Local Storage Strategy
1. App starts → Load from `SharedPreferences`
2. Display cached data immediately
3. Fetch fresh data from API in background
4. Merge new data with existing (preserve read status & timer values)
5. Save updated data to local storage

### Error Handling
- Uses `Either<Failure, Success>` from `dartz` for functional error handling
- Graceful fallback to cached data on network errors
- Retry button displayed on complete failure

---

## File Descriptions

| File | Description |
|------|-------------|
| `main.dart` | App entry point, DI initialization, BlocProvider setup |
| `homepage.dart` | Main list view with posts, shimmer loading, visibility detection |
| `post_detail_page.dart` | Detail view with timer pause/resume on navigation |
| `post_bloc.dart` | BLoC handling all post-related state and timer logic |
| `post_event.dart` | All events that can be dispatched to PostBloc |
| `post_state.dart` | Immutable state class with helper methods |
| `post_model.dart` | Post entity with `isRead` and `timerDuration` fields |
| `posts_repository.dart` | API implementation for fetching posts |
| `i_all_product_repo.dart` | Repository interface (contract) |
| `dependancy.dart` | GetIt service locator configuration |

---

## Author
Developed as part of Knovator technical assessment.
