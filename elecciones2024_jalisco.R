library(pacman)
p_load(readr,tidyverse,here,xml2,rio)




url_zip <- "https://prep2024.iepcjalisco.mx/assets/data_zip/PREP_AYUN_JAL.zip"

temp <- tempfile()
download.file(url_zip, temp, method = "curl")
file_list <- unzip(temp, list = TRUE)
lista_csv <- purrr::map(file_list$Name, ~ readr::read_csv(unz(temp, .x),skip=5))
votaciones_jalisco <- lista_csv %>% pluck(3)
#votaciones_jalisco %>% rio::export(str_c(here("elecciones","jalisco"),now(),".rds"))

votaciones_jalisco %>% filter(MUNICIPIO=="UNION DE TULA") %>% view
votaciones_jalisco %>% filter(MUNICIPIO=="AUTLAN DE NAVARRO") %>% view
