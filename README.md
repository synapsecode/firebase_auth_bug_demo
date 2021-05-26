# FlutterWeb + FirebaseAuth + StreamBuilder Bug Demo

FirebaseAuth version 1.2.0 when combined with StreamBuilder for the stream (authStateChanges or even idTokenChanges) fails to work correcly on Hot Reload.
it works perfectly on Android but fails on FlutterWeb

The Stream builder works fine immediately after signing in and on full page reload (Ctrl + R)
but doesnt work correctly on Hot Reload. 

However, it works even on Hot Reload for dependency versions
  ```yaml
  firebase_core: "^0.7.0"
  firebase_auth: "^0.20.1"
  ```
  
This shows that its not a problem with Flutter's StreamBuilder but instead is a problem with FirebaseAuth
I tested it for version 1.0.0 of both plugins too but that also didnt work as expected.
It only works for the above versions which is a problem as it clashes with newer plugins like the latest version of image_picker.

I know for a fact that it is not any kind of setup error because the login works, and persists on Full Page reload
It just doesnt work on Hot Reload or Hot Restart which is frustrating
