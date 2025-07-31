#!/bin/bash

# Script untuk build Trisula-Meet Android App
# Dibuat untuk TNI AL

echo "=========================================="
echo "    TRISULA-MEET BUILD SCRIPT"
echo "    TNI AL - Angkatan Laut Indonesia"
echo "=========================================="

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[INFO]${NC} Memulai proses build Trisula-Meet..."

# Cek apakah direktori android ada
if [ ! -d "android" ]; then
    echo -e "${RED}[ERROR]${NC} Direktori android tidak ditemukan!"
    exit 1
fi

# Masuk ke direktori android
cd android

echo -e "${YELLOW}[STEP 1]${NC} Membersihkan build sebelumnya..."
./gradlew clean

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR]${NC} Gagal membersihkan build sebelumnya!"
    exit 1
fi

echo -e "${YELLOW}[STEP 2]${NC} Membangun APK Debug..."
./gradlew assembleDebug

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR]${NC} Gagal membangun APK Debug!"
    exit 1
fi

echo -e "${YELLOW}[STEP 3]${NC} Membangun APK Release..."
./gradlew assembleRelease

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR]${NC} Gagal membangun APK Release!"
    exit 1
fi

echo -e "${GREEN}[SUCCESS]${NC} Build berhasil!"
echo ""
echo "APK yang dihasilkan:"
echo -e "${BLUE}Debug APK:${NC} android/app/build/outputs/apk/debug/app-debug.apk"
echo -e "${BLUE}Release APK:${NC} android/app/build/outputs/apk/release/app-release-unsigned.apk"
echo ""
echo -e "${YELLOW}[INFO]${NC} Untuk menandatangani APK release, gunakan:"
echo "jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore your-keystore.keystore app-release-unsigned.apk your-key-alias"
echo ""
echo -e "${GREEN}Build Trisula-Meet selesai!${NC}"
