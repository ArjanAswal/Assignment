
# Assignment  

Download the [app](https://github.com/ArjanAswal/Assignment_2/raw/master/assets/app-release.apk)

<img src="https://github.com/ArjanAswal/Assignment_2/raw/master/assets/demo.gif" alt="Demo" />

# About

The app shows paginated list of images and videos using the Pexels API.
The app uses BLoC for State Management and is receptive to network changes.
The app uses hydrated BLoC for data persistence which uses HiveDB under the hood.

# Running the test

To run the test, we use the terminal and execute the following command:
```
$ flutter drive --target='test_driver/app.dart'
```
This should launch the app on a device and run the tests inside the  **app_test.dart**  accordingly.