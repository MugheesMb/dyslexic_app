<h1 align="center"> Dyslexic App 🔥 </h1> 
<h3 align="center"> Designed for Childrens </h3>

To view  live How to run this app, **[click here](https://www.youtube.com/watch?v=x3nJxGKv0t0&ab_channel=MugheesMb)**

##Sections 📚

✔️ Onboarding Screens\
✔️ Login/SignUp\
✔️ Diagnostic Screen\
✔️ Activity Screen (RLW Sceen)\
✔️ Dyslexic Games\
✔️ Dashboard Screen \
✔️ Deep Progress\
✔️ Chat Messenger (Psychologist Screen)\
✔️ Dyslexic News\
✔️ Profile Screen

## Getting Started....
- The app is completely built on `flutter` framework of `dart` and that's why we need `flutter sdk` and much more do your flutter setup by going to the folloewing link
- https://docs.flutter.dev/get-started/install/windows
-  , after the successful of setup installation, clone the repository into your local system using below command:

```bash
# Clone this repository
$ git clone https://github.com/MugheesMb/dyslexic_app.git

# Go into the repository
$ cd dyslexic_app

# Open project in VS code
$ code .

# Install dependencies by going to pubspec.yaml
$ flutter pub get

```

#after that we need to connect  firebase within our app So , for that goto firebase website https://firebase.google.com/  and make account and setup your firebase
,
```
# Optional
you can also  goto the video i provided above and start watching from 1:30 and watch it till end , and it will connect your firebase with in app and after that you are good to use this app.
```

## after going to firebase website , click on console on upper right corner then click on new project and add new name to it. and click continue anf create project and it will take a few seconds..! and after completing this is how your screen will look like..!


<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172184367-7af9f5b8-cf1e-4e37-a9f2-04ba381a34c3.png"></img>
  </kbd>
</p>

## Next goto authentication  and click on sign-method and enable email and password provider, look below at image below.

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172187194-f645d2f2-e2d6-4d1d-bf3f-cc12fdf7d976.png"></img>
  </kbd>
</p>

## Next goto firestore database from the side panel under authentication and click on create data base and click on start in test mode and click next and next. then you will see somthing like this.. look at image below.

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172188521-99306892-1c8c-4360-aea0-eb120573a2e0.png"></img>
  </kbd>
</p>

## Next do same with the Storage under firestore database and after creating click on rules like look at the image...! and edit the rules as i did..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/161072082-9d042768-0bd8-4007-8487-4b68e2f89129.png"></img>
  </kbd>
</p>


## Next goto project overview  and click on android ..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172189844-08699a38-d2fa-4998-92bc-2779d5c00119.png"></img>
  </kbd>
</p>

#Next you will see screen of registring app and they will ask you to write android package name , to find that android package name go into your project > android folder > app > src > build gradles and in this file you will find your project name, look at the image below..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/161643006-83afd412-8af3-4319-9364-e2299e9b1ef1.png"></img>
  </kbd>
</p>

# Copy and write that app name in your register name app field and click on next they will ask you to download config file u can ignore and next you have to add firebase SDK in your project for that goto project > build gradle file look at image..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172191713-93f2cff1-7f29-46e7-ad09-62de5f4133f8.png"></img>
  </kbd>
</p>

## Next just follow along with firebase instruction and you will be good..!

## Next goto project setting look at the image below..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/161636774-4b17a48a-b4d9-48d0-9db5-9fbc2fdcb529.png"></img>
  </kbd>
</p>

## and scroll down and you will see something like this ..!!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/161078438-b1eb3464-02da-4bb2-89bd-8ddbb6a7ea57.png"></img>
  </kbd>
</p>

## next you gotta add SHA fingerprints of your VS code so for that you can goto cmd and write these commands to get your SHA1 and SHA2 keys..!

```
# Command 1
$ set PATH=C:\Program Files\Android\Android Studio\jre\bin

# Command 2 and in here :\Users\computer you gotta write your computer name like mine is computer..! and this command will give you both keys.!
$ keytool -list -v -keystore "C:\Users\computer\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```
## after adding both keys your screen will look like this..!

<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/161079714-e9f7f2d0-0420-4f4f-9f93-85aebc3c75f7.png"></img>
  </kbd>
</p>

## next simple click on download  (google service.json file) ..!

## and keep this file in project > android > app look at image below..!


<p align="center">
  <kbd>
<img src="https://user-images.githubusercontent.com/62281201/172194978-0076dea6-7558-4b50-b41d-6cd42470c6fc.png"></img>
  </kbd>
</p>


# This is it , next simply start emulator and run this app :)

## and if you are having any trouble in ruuning this app just email us and we'll help you ASAP..!

```
# mr.mugy4@gmail.com
# abdullahayaz529@gmail.com

```














  
