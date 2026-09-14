library(tidyr)
library(dplyr)
library(readxl)

# Folder lokasi file .mdb
folder_path <- "D:/Kerjaan/Project P64180125 (k-Means, DBSCAN and TOPSIS in Python)/Data for Convert"

# List semua file .mdb
list_files <- list.files(folder_path, pattern = "\\.xlsx$", full.names = TRUE)

# Iterasi melalui setiap file .mdb
for (file in list_files) {
  # Membaca tabel utama
  data <- read_excel(file)
  
  # Menjalankan algoritma
  # Reshape the data into the desired format
  new_data <- data %>%
    pivot_longer(cols = starts_with("Tahun."),
                 names_to = "Tahun",
                 values_to = tools::file_path_sans_ext(basename(file))) %>%
    mutate(Tahun = as.numeric(gsub("Tahun.", "", Tahun)))
  
  # Simpan ke file excel
  writexl::write_xlsx(new_data,basename(file))
  print(file)
  }
