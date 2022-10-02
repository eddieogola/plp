# Frontend
## Technical Requirements:
- [Dart](https://dart.dev/  "Dart") 
- [Flutter Framework](https://flutter.dev/  "Flutter framework") 

## Architecture
Most of the apps major architectural design is in the **lib** folder

The lib folder contains common, data and ui modules

### common
Contains apiUrl which needs to be configured for the app to communicate with the backend server

### data
Contains models which serve as Data Transfer Objects for api communication and services that have methods to call the api

### ui
contains all the user interface code


## Start

Open the static_values.dart file located in [plp/frontend/lib/common](https://github.com/eddieogola/plp/tree/master/frontend/lib/common)
Edit the `IP_ADDRESS:PORT_NUMBER` to match those of the [backend](https://github.com/eddieogola/plp/tree/master/backend#start-server).

On the terminal navigate to plp/frontend/

Execute the commands

`flutter pub get`

`flutter run`

## The app should now be running and consuming data from the api
