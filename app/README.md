# Vision Director

The mobile application written in Flutter.

## Stack

- Flutter

- [Bloc and Cubit](https://bloclibrary.dev/#/) for state management

- [get_it](https://pub.dev/packages/get_it) for dependency injection

- REST for data fetching and [SignalR](https://docs.microsoft.com/en-us/aspnet/core/signalr/introduction?view=aspnetcore-6.0) for real time events

- [FFmpeg](https://www.ffmpeg.org/) to generate the videos

## Architecture

The architecture of this app is based on Reso Coder's [Domain Driven Design Principles](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/):

![DDD architecture](Architecture.svg)

[(Image Source)](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/)

> **Application** contains all the Use Cases

> **Domain** contains the business logic (entities and validation)

> **Infrastructure** contains the repositories and network calls as well as Data Transfer Objects

> **Presentation** contains all the UI components and the web sockets

The layers then hold the features (e.g. all `project` related files will be in the `projects` folders within each layer).

## Requirements

You should be familiar with the following:

- Flutter / Dart
- Code generation using `build_runner`
- A little Functional Programming (using `Dartz`)
- State Management using `Bloc`
- Dependency Injection
- [React Hooks](https://reactjs.org/docs/hooks-intro.html)

## Installation

You will need Flutter Version 2 to run this app.

This app was created and tested on `Flutter 2.10.5` and `Dart 2.16.2` .

```
cd app
flutter packages get
```

## Development

For debug mode run `flutter run` and for production mode run `flutter run --release`

To run the code generator using `freezed`, run `flutter pub run build_runner watch --delete-conflicting-outputs`.

If you want to use your own server you will need to change the `BaseUrl` in `InjectableModule`.

If said server runs locally you will also need to add `android:usesCleartextTraffic="true"` to the Android manifest.

**Note**: Instead of `localhost` you need to specify your `IPv4 Address` (e.g. `192.168.2.xxx`), otherwise the HttpClient won't be able to connect to the server.

Whenever you use `Dartz` together with the `Task` model, you have to add `hide Task` to the `dartz` import, e.g. `import 'package:dartz/dartz.dart' hide Task;`.

Similarly, if you want to use the `Step` model anywhere in the `presentation` layer, you need to hide it from `flutter/material`, e.g. `import 'package:flutter/material.dart' hide Step;`.

## Deployment

To create an APK run `flutter build apk`.

The generated APK can be found at `/build/app/outputs/apk/release/app-release.apk`.

## Tests

This repository contains two examples for testing `Application` use-cases using `bloc_test` and `mocktail`. Most of the other network related Cubits would follow a similar approach.

Additionally, there's an example on how to test `Infrastructure` repositories and dtos.

Run `flutter test` to run them all.

## Localization

The basis for adding multiple languages in already set. To localize the app, follow
[the docs](https://docs.flutter.dev/development/accessibility-and-localization/internationalization#adding-your-own-localized-messages) and edit the values in the `arb` files located at `lib/presentation/core/l10n/arb`. To use the generated translations, import `'package:vision_director/presentation/core/l10n/l10n.dart'` to more easily access the instance using `context.l10n`.

## Other platforms.

Due to some dependencies only working on mobile platforms, the only other targetable platform is iOS.

To get started with iOS, you will need to go through the packages and see if they got additional setup stuff needed to get started.

## Credits

[Reso Coder](https://resocoder.com/): This app's structure is based on his DDD tutorial.

[Trimmer](https://github.com/sbis04/video_trimmer): The original creator of the trimmer widget. The only reason there's a local copy is because this app and the package rely on different versions of FFmpeg.

App Icon: <a href="https://www.flaticon.com/free-icons/director" title="director icons">Director icons created by Dimi Kazak - Flaticon</a>
