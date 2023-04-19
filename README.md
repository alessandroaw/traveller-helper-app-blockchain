# Traveller Helper
Traveller Helper is a blockchain-based mobile application designed to assist tourists in capturing their vacation memories. While traveling abroad, tourists often take pictures with their cameras or mobile devices. However, these devices may experience problems such as low battery or limited storage space. To make matters worse, tourists often have limited access to the internet, making it difficult for them to upload their photos to the cloud. If these problems occur, tourists may be unable to capture their memorable moments.

To address this issue, Traveller Helper allows tourists to request assistance from local residents in capturing their vacation photos. In return, the local residents receive an incentive in the form of cryptocurrency.


## Running Traveller Helper
There are three component for this project:

1. HTTP Server
2. Smart Contract
3. Mobile Apps

To run Traveller Helper locally, follow these steps:

### HTTP Server
Run this script to start HTTP server.
```
npm install
npm start
```

### Smart Contracts
Run the following script to deploy the smart contract on the blockchain network:
```
truffle migrate --network infura
```

### Mobile Apps
Run the following script to build the mobile app APK file:
```
flutter build apk --split-per-abi --dart-define=IP_ADDRESS={local http server address}
```
After building the APK file, you can install the app on your Android device.
