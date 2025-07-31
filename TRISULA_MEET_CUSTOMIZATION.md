# Kustomisasi Trisula-Meet

## Ringkasan Perubahan

Dokumen ini merangkum semua perubahan yang telah dilakukan untuk mengkustomisasi aplikasi Jitsi Meet menjadi Trisula-Meet untuk TNI AL.

## Perubahan yang Dilakukan

### 1. Nama Aplikasi
- **File**: `android/app/src/main/res/values/strings.xml`
- **Perubahan**: Mengubah nama aplikasi dari "Jitsi Meet" menjadi "Trisula-Meet"
- **Deskripsi**: Juga mengubah deskripsi server URL ke bahasa Indonesia

### 2. Logo dan Branding
- **File**: `android/app/src/main/res/drawable/ic_trisula_logo.xml`
- **Perubahan**: Membuat logo kustom dengan simbol Trisula (trident) untuk TNI AL
- **Warna**: Menggunakan skema warna biru navy (#1E3A8A) dan putih

### 3. Splash Screen
- **File**: `android/app/src/main/res/layout/launch_screen.xml`
- **Perubahan**: 
  - Menggunakan logo Trisula kustom
  - Mengubah background menjadi biru navy
  - Menambahkan teks "Trisula Meet"

### 4. Tema Warna
- **File**: `android/app/src/main/res/values/colors.xml`
- **Perubahan**: Mengubah skema warna ke tema TNI AL (biru navy)
- **File**: `android/app/src/main/res/values/ic_launcher_background.xml`
- **Perubahan**: Mengubah background launcher icon

### 5. Icon Launcher
- **File**: `android/app/src/main/res/drawable/ic_trisula_foreground.xml`
- **Perubahan**: Membuat foreground icon dengan simbol Trisula
- **File**: `android/app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml`
- **File**: `android/app/src/main/res/mipmap-anydpi-v26/ic_launcher_round.xml`
- **Perubahan**: Menggunakan foreground Trisula kustom

### 6. Konfigurasi Server
- **File**: `config.js`
- **Perubahan**: Mengubah semua URL server dari jitsi-meet.example.com ke trisula-meet.tnial.mil.id
- **Mencakup**: domain, muc, bosh, websocket

### 7. Interface Configuration
- **File**: `interface_config.js`
- **Perubahan**: 
  - Menonaktifkan generator nama room random (`GENERATE_ROOMNAMES_ON_WELCOME_PAGE: false`)
  - Mengubah APP_NAME menjadi 'Trisula-Meet'
  - Mengubah PROVIDER_NAME menjadi 'TNI AL'

### 8. Package ID
- **File**: `android/app/build.gradle`
- **Perubahan**: Mengubah applicationId dari 'org.jitsi.meet' menjadi 'id.mil.tnial.trisula.meet'

### 9. MainActivity
- **File**: `android/app/src/main/java/org/jitsi/meet/MainActivity.java`
- **Perubahan**: Menambahkan fallback URL ke https://trisula-meet.tnial.mil.id

### 10. Deep Linking
- **File**: `android/app/src/main/AndroidManifest.xml`
- **Perubahan**: 
  - Mengubah host deep linking ke trisula-meet.tnial.mil.id
  - Mengubah scheme menjadi id.mil.tnial.trisula.meet

## Fitur yang Dinonaktifkan

1. **Generator Nama Room Random**: Pengguna sekarang harus memasukkan nama room secara manual
2. **Multiple Server Support**: Aplikasi sekarang hanya terhubung ke server Trisula-Meet

## Konfigurasi Server

- **Domain**: trisula-meet.tnial.mil.id
- **BOSH URL**: https://trisula-meet.tnial.mil.id/http-bind
- **WebSocket URL**: wss://trisula-meet.tnial.mil.id/xmpp-websocket
- **MUC Domain**: conference.trisula-meet.tnial.mil.id

## Branding

- **Nama Aplikasi**: Trisula-Meet
- **Provider**: TNI AL
- **Warna Utama**: #1E3A8A (Biru Navy)
- **Logo**: Simbol Trisula (trident) dengan background biru navy

## Cara Build

1. Pastikan semua dependensi Android sudah terinstall
2. Jalankan `cd android && ./gradlew assembleRelease`
3. APK akan tersedia di `android/app/build/outputs/apk/release/`

## Testing

Sebelum deployment, pastikan untuk menguji:
1. Nama aplikasi muncul sebagai "Trisula-Meet"
2. Logo dan splash screen menggunakan branding Trisula
3. Aplikasi terhubung ke server trisula-meet.tnial.mil.id
4. Generator nama room random tidak aktif
5. Deep linking berfungsi dengan domain baru

## Catatan Keamanan

- Pastikan server trisula-meet.tnial.mil.id sudah dikonfigurasi dengan benar
- Verifikasi sertifikat SSL untuk domain tersebut
- Test koneksi BOSH dan WebSocket sebelum deployment
