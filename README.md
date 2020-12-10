---
title: Traveller Helper
---

# Traveller Helper
Saat berlibur ke luar negeri, turis-turis akan mengabadikan momen dengan mengambil gambar dengan kamera ataupun gawai yang mereka miliki. 

Dalam proses pengambilan foto tidak jarang terdapat masalah seperti baterai gawai habis, atau storage dari gawai habis. Hal ini diperburuk dengan sulitnya akses internet bagi turis sehingga storage yang tadinya penuh tidak bisa di-upload ke cloud. Jika hal-hal ini terjadi, turis tidak akan dapat melakukan apa-apa untuk mengabadikan momen mereka. 

Permasalahan di atas yang memicu untuk dibuatnya suatu aplikasi berbasis blockchain untuk turis dapat meminta tolong orang setempat untuk membantu mengabadikan momen mereka dan penolong akan diberikan insentif.


## Menjalankan Traveller Helper
terdapat tiga komponen dari Traveller Helper, yaitu:

1. HTTP Server
2. Smart Contract
3. Mobile Apps

Berikut adalah cara untuk menjalankan Traveller-Helper secara lokal.

### HTTP Server
Jalankan script berikut untuk menjalankan HTTP server.
```
npm install
npm start
```

### Smart Contracts
Jalankan script berikut untuk melakukan *deployment* smart contract pada jaringan blockchain.
```
truffle migrate --network infura
```

### Mobile Apps
Jalankan script dibawah ini untuk membangun file apk mobile apps.
```
flutter build apk --split-per-abi --dart-define=IP_ADDRESS={local http server address}
```
install app via apk pada perangkat android