# Install dan load paket dplyr
library(readxl)
library(dplyr)

# Baca file Excel
data <- read_excel("Data for Convert/Data Penduduk Berdasarkan Pendidikan.xlsx")

# Mengelompokkan dan menjumlahkan data
summary_data <- data %>%
  group_by(KAB_KOTA) %>%              # Ganti dengan nama kolom "Kab_Kota" yang sesuai
  summarise(across(everything(), sum, na.rm = TRUE))  # Menjumlahkan semua kolom kecuali kolom grup

# Melihat hasil
print(summary_data)

writexl::write_xlsx(summary_data,"Data After Convert/Data Penduduk Berdasarkan Pendidikan.xlsx")

# Baca file Excel
data <- read_excel("Data for Convert/Data Penduduk Berdasarkan Usia.xlsx")

# Mengelompokkan dan menjumlahkan data
summary_data <- data %>%
  group_by(KAB_KOTA) %>%              # Ganti dengan nama kolom "Kab_Kota" yang sesuai
  summarise(across(everything(), sum, na.rm = TRUE))  # Menjumlahkan semua kolom kecuali kolom grup

# Melihat hasil
print(summary_data)

writexl::write_xlsx(summary_data,"Data After Convert/Data Penduduk Berdasarkan Usia.xlsx")
