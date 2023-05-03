# Soka

This project is a Flutter project that uses Melos for managing the monorepo structure. It has two apps in the `_apps` folder named `kapira` and `kapira_admin`, which are the client and admin apps respectively. The project also has an `_packages` folder that contains shared packages for the entire project, including `assets`, `core`, `network`, `router`, and `widgets`.

## Getting Started

To get started with this project, follow these steps:

1. Fork the repository
2. Clone the project from the repository:

   ```
   git clone https://github.com/<username>/soka
   ```

3. Install Melos:

   ```
   pub global activate melos
   ```

4. Install dependencies for the entire project:

   ```
   melos bootstrap
   ```

## Apps

The project has two apps in the `_apps` folder named `kapira` and `kapira_admin`. The `kapira` app is the client app, while `kapira_admin` is the admin app.

To run an app, navigate to the app directory and run the following command:

```
flutter run
```

>Note: When using vscode, the launch.json file is already setup for both apps and can be run/debug directly.

## Packages

The project contains shared packages in the `_packages` folder. These packages are used by both the client and admin apps. The packages include:

- `assets`: This package contains all the assets used in the project, such as images and fonts.
- `core`: This package contains the core logic of the project, such as data models and business logic.
- `network`: This package contains all the network-related code, such as APIs and network clients.
- `router`: This package contains the navigation logic of the project.
- `widgets`: This package contains reusable widgets used throughout the project.

To use a package, add it to the dependencies section of the app's `pubspec.yaml` file. For example:

```
dependencies:
  assets:
    path: ../_packages/assets
```

## Designs

We currently have no core designs but we are using the following behance inspirations.

- https://www.behance.net/gallery/159181607/Live-match-watching-app
- https://www.behance.net/gallery/98568459/EPL-Ramailo-Npeal-App-UI-Design
- https://www.behance.net/gallery/150402707/Sports-Football-Live-Score-App-UI-Kit
- https://www.behance.net/gallery/160042351/Live-Score-App-Ui-design
- https://www.behance.net/gallery/162498989/Football-Fantasy-Live-Score-App

