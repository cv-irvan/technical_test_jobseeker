# Technical Test Jobseeker

# Teknologi dan Manajemen State

Proyek ini dibangun dengan menggunakan beberapa teknologi utama dan mengadopsi pendekatan khusus untuk manajemen state.

## Teknologi:

### Flutter
Sebagai core framework untuk membangun UI dan logika aplikasi. Flutter menyediakan widget yang kaya dan customizable yang dapat digunakan untuk membuat tampilan aplikasi yang menarik dan responsif.

### Dart
Bahasa pemrograman yang digunakan oleh Flutter. Dart dirancang khusus untuk pengembangan front-end untuk web dan mobile, menawarkan performa yang tinggi dan fitur yang kaya untuk pengembangan aplikasi modern.

### Hive
Sebuah database NoSQL ringan dan cepat yang digunakan untuk penyimpanan lokal. Hive sangat cocok untuk Flutter dan memungkinkan penyimpanan data secara lokal di perangkat dengan efisiensi dan kecepatan yang tinggi.

### Hive Flutter
Plugin yang memudahkan integrasi Hive dengan Flutter, memungkinkan penyimpanan data secara efisien di aplikasi Flutter. Hive Flutter menyederhanakan proses penyimpanan dan pengambilan data lokal.

## Manajemen State:

Proyek ini menggunakan BLoC (Business Logic Component) sebagai metode manajemen state utama.

### BLoC
BLoC memisahkan logika bisnis dari antarmuka pengguna (UI) dan memungkinkan pengelolaan state yang lebih terorganisir dan mudah diuji. BLoC menggunakan konsep stream dan sink untuk mengelola state, dimana komponen UI mengirimkan event ke BLoC, dan BLoC merespons dengan state baru yang kemudian ditampilkan di UI. Pendekatan ini memungkinkan pemisahan yang jelas antara logika bisnis dan UI, serta memfasilitasi pengujian dan pemeliharaan kode.

# Struktur Direktori

Proyek ini memiliki dua direktori utama: `lib` dan `test`.

## lib

Direktori `lib` berisi kode sumber utama aplikasi. Berikut adalah struktur dari direktori `lib`:

- `/lib`
  - `/bloc`
  - `/models`
  - `/repositories`
  - `/screens`
  - `/services`
  - `/utils`

## test

Direktori `test` berisi kode untuk pengujian unit dan widget. Berikut adalah struktur dari direktori `test`:

- `/test`
  - `unit_test.dart`
  - `widget_test.dart`



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
