# Install dan load package yang diperlukan
install.packages("readxl")
install.packages("dplyr")

library(readxl)
library(dplyr)

# Baca file Excel
data <- read_excel("Data Taraf Desa/Data-POI.xlsx")

# Install dan load paket yang diperlukan
library(tidyr)

# Membuat pivot table
pivot_data <- data %>%
  group_by(KABKOT, SUBCLASS) %>%          # Mengelompokkan berdasarkan Kabkot dan Subclass
  summarise(count = n(), .groups = "drop") %>%  # Menghitung jumlah
  pivot_wider(names_from = SUBCLASS,      # Membuat kolom baru berdasarkan Subclass
              values_from = count,        # Mengisi nilai dengan count
              values_fill = list(count = 0)) # Mengisi nilai kosong dengan 0

# Melihat hasil
print(pivot_data)

writexl::write_xlsx(pivot_data,"Data POI Summarize.xlsx")

