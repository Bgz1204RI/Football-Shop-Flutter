# Football Shop — Assignment 7

### 1
Flutter builds UIs as a hierarchical **tree of widgets**. Each widget (parent) composes one or more child widgets. Parents control **layout and constraints**; children describe **appearance and behavior**. During build, constraints flow **down**, sizes flow **up**, and parent positions children.

### 2
- `MaterialApp`: top-level app wrapper providing Material design, routing, themes.
- `ThemeData`: configures app-wide colors/typography.
- `Scaffold`: basic page structure (app bar, body, SnackBars, etc.).
- `AppBar`: the top application bar with a title.
- `SafeArea`: avoids system intrusions (status bar/notch).
- `Padding`/`SizedBox`: spacing/layout helpers.
- `Column`: vertical layout of the three buttons.
- `ElevatedButton.icon`: a Material button with an icon and a label.
- `Icon`/`Text`: visual content inside buttons and app bar.
- `SnackBar`: transient message bar.
- `ScaffoldMessenger`: shows/hides SnackBars.
- `StatelessWidget`: immutable widget that rebuilds when parents/inputs change.

### 3
`MaterialApp` wires up Material theming, text direction, navigation, localization, and default scaffolding behavior. Using it as the **root widget** provides these capabilities throughout the subtree without manual wiring.

### 4
- **StatelessWidget**: has no internal mutable state; UI depends only on inputs. Great for static screens or pure views.
- **StatefulWidget**: holds mutable `State` that can change via `setState()`. Use when UI updates due to user input, animations, streams, or timers.

### 5
`BuildContext` is a handle to a widget’s position in the widget tree. It lets widgets:
- Access inherited data (theme, media queries).
- Navigate or show SnackBars/Dialogs (via ancestor lookups).
In `build`, it’s passed so the widget can read inherited widgets and construct children appropriately.

### 6
- **Hot reload**: injects updated source into the running Dart VM, **preserving state** when possible and rebuilding widgets. Very fast iteration for UI tweaks.
- **Hot restart**: fully restarts the app, **clearing state** and running `main()` again. Use when state or globals need a clean slate.


