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

folder_path <- "/Volumes/Storage/kuruka/RM-285/"
file_list <- list.files(path = folder_path, pattern = "\\.ori\\.out$", full.names = TRUE)

read_and_process <- function(file) {
  df <- read_table(file, col_names = columns_RM) %>%
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
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
    ##   qleft = col_character(),
    ##   strand = col_character(),
    ##   te = col_character(),
    ##   class = col_character(),
    ##   position_in_repeat_begin = col_character(),
    ##   position_in_repeat_end = col_double(),
    ##   position_in_repeat_left = col_character(),
    ##   ID = col_logical()
    ## )
    ## 
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   SWscore = col_double(),
    ##   pdiv = col_double(),
    ##   pdel = col_double(),
    ##   pins = col_double(),
    ##   contig = col_character(),
    ##   qstart = col_double(),
    ##   qend = col_double(),
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
combined_data %>% arrange(desc(SWscore))
```

    ## # A tibble: 140,068 × 17
    ##    SWscore  pdiv  pdel  pins contig       qstart   qend qleft strand te    class
    ##      <dbl> <dbl> <dbl> <dbl> <chr>         <dbl>  <dbl> <chr> <chr>  <chr> <chr>
    ##  1   72430  4.01  0.94  1.05 JAEIGO01000… 1.47e7 1.47e7 (580… C      Kuru… Unsp…
    ##  2   63390  3.03  0.33  0.25 JAEIGO01000… 1.26e5 1.33e5 (216… C      Kuru… Unsp…
    ##  3   57298  4.27  0.12  0.09 JAEIGO01000… 5.59e5 5.66e5 (407… C      Kuru… Unsp…
    ##  4   56765  7.89  1.45  0.67 JAEIGO01000… 3.64e5 3.72e5 (807… C      Kuru… Unsp…
    ##  5   53098 10.7   1.28  0.88 JAEIGJ01000… 2.47e4 3.23e4 (200… C      Kuru… Unsp…
    ##  6   52353 10     2.01  0.86 JAEIGK01000… 1.61e4 2.35e4 (0)   +      Kuru… Unsp…
    ##  7   52330 10.4   1.63  0.95 JAEIGK01000… 5.20e4 5.94e4 (490… C      Kuru… Unsp…
    ##  8   49650  5.37  2.07  1.8  JAEIGO01000… 5.50e5 5.57e5 (382… C      Kuru… Unsp…
    ##  9   45189  9.44  0.56  0.21 JAEIGJ01000… 8.48e4 9.08e4 (102… +      Kuru… Unsp…
    ## 10   43854  9     1.2   0.24 JAEIGJ01000… 2.91e4 3.49e4 (384… +      Kuru… Unsp…
    ## # ℹ 140,058 more rows
    ## # ℹ 6 more variables: position_in_repeat_begin <chr>,
    ## #   position_in_repeat_end <dbl>, position_in_repeat_left <chr>, ID <lgl>,
    ## #   sample <chr>, name <chr>

``` r
(defragmented <- combined_data %>% select(pdiv, name, contig, qstart, qend, strand, position_in_repeat_begin, position_in_repeat_end, position_in_repeat_left) %>%
   arrange(name, contig, qstart) %>%
   mutate(to_merge = ifelse(name == lead(name) & contig == lead(contig) & strand == lead(strand) & qend >= lead(qstart) - 250, TRUE, FALSE), match_len = qend-qstart))
```

    ## # A tibble: 140,068 × 11
    ##     pdiv name         contig          qstart  qend strand position_in_repeat_b…¹
    ##    <dbl> <chr>        <chr>            <dbl> <dbl> <chr>  <chr>                 
    ##  1  19.7 A.albilabris JBANCV01000003…  34873 34950 C      (1395)                
    ##  2  29.8 A.albilabris JBANCV01000004…   5747  6125 +      2124                  
    ##  3  34.0 A.albilabris JBANCV01000004…   6147  6668 +      2564                  
    ##  4  27.9 A.albilabris JBANCV01000004…    233   368 +      2579                  
    ##  5  27.0 A.albilabris JBANCV01000009…  61641 61729 C      (5115)                
    ##  6  34.1 A.albilabris JBANCV01000018…  22345 22633 +      4056                  
    ##  7  26.0 A.albilabris JBANCV01000018…  52400 52500 +      4275                  
    ##  8  34.7 A.albilabris JBANCV01000023…  29060 29712 +      2412                  
    ##  9  31.6 A.albilabris JBANCV01000023…  29787 30151 +      3514                  
    ## 10  33.4 A.albilabris JBANCV01000023…  30189 30819 +      3972                  
    ## # ℹ 140,058 more rows
    ## # ℹ abbreviated name: ¹​position_in_repeat_begin
    ## # ℹ 4 more variables: position_in_repeat_end <dbl>,
    ## #   position_in_repeat_left <chr>, to_merge <lgl>, match_len <dbl>

``` r
(merged <- defragmented %>%
  mutate(
    qend = ifelse(to_merge, coalesce(lead(qend), qend), qend),  # Avoids NA issues in last row
    pdiv = ifelse(to_merge, (pdiv/100) * (match_len/(qend-qstart)) + (lead(pdiv)/100) * (lead(match_len)/(qend-qstart)), pdiv),
    match_len = qend-qstart,
    pdiv = pdiv * 100) %>%
  filter(to_merge == TRUE) %>%
  select(name, contig, qstart, qend, match_len, pdiv, strand))
```

    ## # A tibble: 15,304 × 7
    ##    name         contig            qstart  qend match_len  pdiv strand
    ##    <chr>        <chr>              <dbl> <dbl>     <dbl> <dbl> <chr> 
    ##  1 A.albilabris JBANCV010000042.1   5747  6668       921  31.5 +     
    ##  2 A.albilabris JBANCV010000233.1  29060 30151      1091  31.3 +     
    ##  3 A.albilabris JBANCV010000233.1  29787 30819      1032  31.6 +     
    ##  4 A.albilabris JBANCV010000271.1  35055 35370       315  29.0 +     
    ##  5 A.albilabris JBANCV010000271.1  36012 36630       618  29.0 +     
    ##  6 A.albilabris JBANCV010000571.1  15169 15933       764  30.7 C     
    ##  7 A.albilabris JBANCV010000598.1  25654 26398       744  26.4 +     
    ##  8 A.albilabris JBANCV010001095.1  17982 18529       547  33.6 C     
    ##  9 A.albilabris JBANCV010001095.1  18131 18826       695  28.6 C     
    ## 10 A.albilabris JBANCV010001125.1  14573 15401       828  28.7 C     
    ## # ℹ 15,294 more rows

``` r
(biogeo <- read_tsv("/Volumes/Storage/kuruka/metadata/metadata-biogeography.tsv"))
```

    ## New names:
    ## Rows: 286 Columns: 13
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "\t" chr
    ## (12): name, genus, species, subspecies, species_group, species_subgroup,... lgl
    ## (1): ...12
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...12`

    ## # A tibble: 286 × 13
    ##    name     genus species subspecies species_group species_subgroup group group2
    ##    <chr>    <chr> <chr>   <chr>      <chr>         <chr>            <chr> <chr> 
    ##  1 A.albil… Amio… albila… <NA>       <NA>          <NA>             othe… other…
    ##  2 A.commu… Amio… commun… <NA>       <NA>          <NA>             othe… other…
    ##  3 A.mariae Amio… mariae  <NA>       <NA>          <NA>             othe… other…
    ##  4 A.minor  Amio… minor   <NA>       <NA>          <NA>             othe… other…
    ##  5 C.amoena Chym… amoena  <NA>       <NA>          <NA>             othe… other…
    ##  6 C.cauda… Chym… caudat… <NA>       <NA>          <NA>             othe… other…
    ##  7 C.costa… Chym… costata <NA>       <NA>          <NA>             othe… other…
    ##  8 C.indag… Caco… indaga… <NA>       <NA>          <NA>             othe… other…
    ##  9 C.indag… Caco… indaga… <NA>       <NA>          <NA>             othe… other…
    ## 10 C.kiris… Coll… kirish… <NA>       <NA>          <NA>             othe… other…
    ## # ℹ 276 more rows
    ## # ℹ 5 more variables: realm1 <chr>, realm2 <chr>, region <chr>, ...12 <lgl>,
    ## #   notes <chr>

``` r
plottable <- merged %>%
  mutate(match_len = qend - qstart) %>%
  group_by(name) %>%
  filter(pdiv == min(pdiv)) %>%
  filter(match_len == max(match_len)) %>%
  inner_join(biogeo, by = "name") %>%
  arrange(desc(match_len)) %>%
  ungroup()

# Create a data frame for the custom label
label_data <- data.frame(x = 8650, y = 65, label = "Length of Kuruka consensus", realm1 = NA)

# Plot
ggplot(plottable, aes(x = match_len, y = 100 - pdiv, fill = realm1)) + 
  geom_point(shape = 21, size = 3, alpha = 0.5, color = "black") +  # Shape 21 = dots with border
  scale_fill_manual(values = c("red", "violet", "orange", "lightblue", "darkgreen", "purple", "blue")) + 
  geom_vline(xintercept = 8833, linetype = "longdash") +  # Vertical line at 8833
  geom_text(data = label_data, aes(x = x, y = y, label = label), angle = 90, hjust = 0, size = 3.5) +  # Custom label
  labs(x = "Match length (bp)", y = "Sequence similarity (%)", fill = "Realm") + 
  geom_text_repel(data = plottable %>% filter(match_len > 5000), 
                  aes(label = name), size = 3, box.padding = 0.8, max.overlaps = 15) + 
  scale_x_continuous(breaks = c(seq(0, 8000, by = 1000), 8833), limits = c(0, 8833))  # Set custom x-axis breaks
```

![](285-longreads_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
