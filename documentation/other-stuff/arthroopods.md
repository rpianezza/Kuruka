Kuruka
================

``` r
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(knitr))
suppressPackageStartupMessages(library(kableExtra))
suppressPackageStartupMessages(library(ggpubr))
suppressPackageStartupMessages(library(svglite))
library(ggrepel)
theme_set(theme_bw())
```

    for i in /mnt/data2/riccardo/dmel-longreads/*.fasta; do /home/riccardo/repeatannotation/RepeatMasker/RepeatMasker -pa 20 -no_is -s -nolow -dir . -lib ../ref/kuruka.fasta $i;done

``` r
columns_RM <- c("SWscore", "pdiv", "pdel", "pins", "contig", "qstart", "qend", "qleft",  "strand", "te", "class", "position_in_repeat_begin", "position_in_repeat_end", "position_in_repeat_left", "ID")

folder_path <- "/Volumes/Storage/kuruka/RM-arthropods/oriout/"
file_list <- list.files(path = folder_path, pattern = "\\.ori\\.out$", full.names = TRUE)

read_and_process <- function(file) {
  df <- read_table(file, col_names = columns_RM) %>%
    mutate(across(everything(), as.character)) %>%
    mutate(sample = basename(file))  # Add sample column with filename
  return(df)
}

combined_data <- map_dfr(file_list, read_and_process) %>% mutate(name = gsub(".fasta.ori.out", "", sample))
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_double(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_double(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_double(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_double(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_double(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )

``` r
write_tsv(combined_data, "/Volumes/Storage/kuruka/RM-arthropods/kuruka-arthropods-RM.tsv")
```

``` r
defragmented <- combined_data %>% type_convert() %>% select(pdiv, name, contig, qstart, qend, strand, position_in_repeat_begin, position_in_repeat_end, position_in_repeat_left) %>%
   arrange(name, contig, qstart) %>%
   mutate(to_merge = ifelse(name == lead(name) & contig == lead(contig) & strand == lead(strand) & qend >= lead(qstart) - 250, TRUE, FALSE), match_len = qend-qstart)
```

    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical(),
    ##   sample = col_character(),
    ##   name = col_character()
    ## )

``` r
merged <- defragmented %>%
  mutate(
    qend = ifelse(to_merge, coalesce(lead(qend), qend), qend),  # Avoids NA issues in last row
    pdiv = ifelse(to_merge, (pdiv/100) * (match_len/(qend-qstart)) + (lead(pdiv)/100) * (lead(match_len)/(qend-qstart)), pdiv),
    match_len = qend-qstart,
    pdiv = pdiv * 100) %>%
  filter(to_merge == TRUE) %>%
  select(name, contig, qstart, qend, match_len, pdiv, strand)
```

``` r
(plottable <- merged %>%
  mutate(name = gsub(".fna.ori.out", "", name)) %>%
  group_by(name) %>%
  filter(pdiv == min(pdiv), !(str_detect(name, "Drosophila")), !(str_detect(name, "TOM008"))) %>%
  filter(match_len == max(match_len)) %>%
  arrange(desc(match_len)) %>%
  ungroup())
```

    ## # A tibble: 1,245 × 7
    ##    name                   contig        qstart     qend match_len  pdiv strand
    ##    <chr>                  <chr>          <dbl>    <dbl>     <dbl> <dbl> <chr> 
    ##  1 Tinea_semifulvella     OU342608.1   8251834  8253765      1931  33.3 +     
    ##  2 Meganola_albula        OW388147.1   7213872  7215657      1785  29.4 +     
    ##  3 Eupithecia_vulgata     OX297867.1  15961303 15962874      1571  28.8 C     
    ##  4 Dascillus_cervinus     OX458323.1   4290730  4292267      1537  28.8 C     
    ##  5 Ennomos_fuscantarius   HG992034.1   3818880  3820313      1433  30.7 C     
    ##  6 Rhopalosiphum_padi     NC_083598.1 16478192 16479609      1417  32.1 +     
    ##  7 Heliconius_charithonia CM060828.1   6370250  6371666      1416  29.8 +     
    ##  8 Petrophora_chlorosata  OX621215.1   1385253  1386624      1371  26.7 C     
    ##  9 Micropterix_aruncella  OX155968.1   2937335  2938647      1312  31.6 +     
    ## 10 Malthinus_flaveolus    OX467285.1  91004657 91005954      1297  30.6 +     
    ## # ℹ 1,235 more rows

``` r
# Create a data frame for the custom label
label_data <- data.frame(x = 8650, y = 65, label = "Length of Kuruka consensus", realm1 = NA)

# Plot
ggplot(plottable, aes(x = match_len, y = 100 - pdiv)) + 
  geom_point(shape = 21, size = 3, alpha = 0.5, color = "black", fill = "grey") +  # Shape 21 = dots with border
  geom_vline(xintercept = 8833, linetype = "longdash") +  # Vertical line at 8833
  geom_text(data = label_data, aes(x = x, y = y, label = label), angle = 90, hjust = 0, size = 3.5) +  # Custom label
  labs(x = "Match length (bp)", y = "Sequence similarity (%)") + 
  geom_text_repel(data = plottable %>% filter(match_len > 5000 | (pdiv < 10 & match_len > 1000)), 
                  aes(label = name), size = 2.8, box.padding = 0.6, max.overlaps = 18) + 
  scale_x_continuous(breaks = c(seq(0, 8000, by = 1000), 8833), limits = c(0, 8833)) +
  ylim(60, 100)
```

![](arthroopods_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
