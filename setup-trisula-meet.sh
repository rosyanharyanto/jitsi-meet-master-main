#!/bin/bash

# Script Setup Trisula-Meet Development Environment
# Dibuat untuk TNI AL

echo "=========================================="
echo "    TRISULA-MEET SETUP SCRIPT"
echo "    TNI AL - Angkatan Laut Indonesia"
echo "=========================================="

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[INFO]${NC} Memulai setup environment Trisula-Meet..."

# Cek apakah Node.js terinstall
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERROR]${NC} Node.js tidak terinstall!"
    echo -e "${YELLOW}[INFO]${NC} Silakan install Node.js terlebih dahulu"
    exit 1
fi

# Cek apakah npm terinstall
if ! command -v npm &> /dev/null; then
    echo -e "${RED}[ERROR]${NC} npm tidak terinstall!"
    echo -e "${YELLOW}[INFO]${NC} Silakan install npm terlebih dahulu"
    exit 1
fi

echo -e "${YELLOW}[STEP 1]${NC} Menginstall dependensi Node.js..."
npm install

if [ $? -ne 0 ]; then
    echo -e "${RED}[ERROR]${NC} Gagal menginstall dependensi Node.js!"
    exit 1
fi

echo -e "${YELLOW}[STEP 2]${NC} Memberikan permission pada gradlew..."
chmod +x android/gradlew

echo -e "${YELLOW}[STEP 3]${NC} Memberikan permission pada script build..."
chmod +x build-trisula-meet.sh

echo -e "${GREEN}[SUCCESS]${NC} Setup environment berhasil!"
echo ""
echo "Langkah selanjutnya:"
echo -e "${BLUE}1.${NC} Untuk build APK: ./build-trisula-meet.sh"
echo -e "${BLUE}2.${NC} Untuk development web: npm start"
echo -e "${BLUE}3.${NC} Untuk testing: npm test"
echo ""
echo -e "${YELLOW}[INFO]${NC} Pastikan Android SDK sudah terinstall untuk build APK"
echo -e "${GREEN}Setup Trisula-Meet selesai!${NC}"
