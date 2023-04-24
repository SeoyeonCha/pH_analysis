#### Ratio Image Processing #####
source(file = "~/Users/Source.R")

library(tidyverse)
setwd("~/Users/")

dir = getwd()

name1 = list.files(path = "txt", pattern = "C.txt")
name2 = list.files(path = "txt", pattern = "M.txt")
name1

## Run iteration
start_time <- Sys.time()

for(i in seq_along(name1)){
  C <- read.table(paste0("txt/", name1[i]), header = FALSE) %>% unlist()
  M <- read.table(paste0("txt/", name2[i]), header = FALSE) %>% unlist()
  ncol = length(C)^(1/2); nrow = ncol
  name = substr(name1[i],1,nchar(name1[i])-6)
  write.table(make_ratio_bc(C, M, threup = 2.15, thredwn = 0.85, lower = 0.8, upper = 2.2, ncol, nrow), file = paste0("ratio/", name, ".txt") , 
              col.names = FALSE, row.names = FALSE)
}

end_time <- Sys.time()
end_time - start_time

