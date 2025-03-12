Kuruka
================

``` r
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(knitr))
suppressPackageStartupMessages(library(kableExtra))
suppressPackageStartupMessages(library(ggpubr))
suppressPackageStartupMessages(library(svglite))
theme_set(theme_bw())
```

    RepeatMasker -pa 20 -no_is -s -nolow -dir ../RM-derecta -lib ../before-longreads/ref/kuruka-derecta.fasta TG_ND_dmel.fasta

``` r
columns_paf <- c("query","qlen","qstart","qend","strand","ref","reflen","refstart","refend","matching_bases","matching_including_gaps","quality")

(paf_derecta <- read_tsv("/Volumes/Storage/kuruka/minimap-derecta/minimap-output.paf", col_names = columns_paf) %>% filter(strand %in% c("+", "-")) %>% type_convert())
```

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 12 Columns: 18
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (9): query, strand, ref, X13, X14, X15, X16, X17, X18
    ## dbl (9): qlen, qstart, qend, reflen, refstart, refend, matching_bases, match...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## 
    ## ── Column specification ────────────────────────────────────────────────────────
    ## cols(
    ##   query = col_character(),
    ##   strand = col_character(),
    ##   ref = col_character(),
    ##   X13 = col_character(),
    ##   X14 = col_character(),
    ##   X15 = col_character(),
    ##   X16 = col_character(),
    ##   X17 = col_character(),
    ##   X18 = col_character()
    ## )

    ## # A tibble: 12 × 18
    ##    query    qlen qstart  qend strand ref   reflen refstart refend matching_bases
    ##    <chr>   <dbl>  <dbl> <dbl> <chr>  <chr>  <dbl>    <dbl>  <dbl>          <dbl>
    ##  1 JAEIGZ…  8738     64  8723 -      27e9…  27804    17875  26717           7097
    ##  2 JAEIGZ…  8738    106  8711 +      01d9…  26450        3   8788           7045
    ##  3 JAEIGZ…  8738     64  8717 -      2dd7…  13949     2227  11013           7031
    ##  4 JAEIGZ…  8738     64  8723 +      d566…  11770      566   9033           7039
    ##  5 JAEIGZ…  8738     64  8723 -      3327…  31631    22376  31189           6981
    ##  6 JAEIGZ…  8738     64  8723 +      8f0d…  47585    19905  28379           6994
    ##  7 JAEIGZ…  8738     69  8722 -      c2e4…  41569     6345  15580           6905
    ##  8 JAEIGZ…  8738     64  8581 -      80d3…  37412        7   8702           6687
    ##  9 JAEIGZ…  8738     75  8723 +      5257…  10878      912   9261           6725
    ## 10 JAEIGZ…  8738     64  8722 +      d94c…  13673     4459  13319           6665
    ## 11 JAEIGZ…  8738     64  8722 -      1584…  15181     4430  12977           6679
    ## 12 JAEIGZ…  8738     64  8723 -      5b9b…  29434    17657  26131           6670
    ## # ℹ 8 more variables: matching_including_gaps <dbl>, quality <dbl>, X13 <chr>,
    ## #   X14 <chr>, X15 <chr>, X16 <chr>, X17 <chr>, X18 <chr>

``` r
paf_derecta %>% select(ref) %>% write_tsv("/Volumes/Storage/kuruka/minimap-derecta/reads_with_kuruka.txt", col_names = FALSE)

#grep -F -f ../minimap-derecta/reads_with_kuruka.txt tg_nd_dmel.fastq > ../minimap-derecta/reads_with_kuruka.fastq
#Manually convert to fasta

paf_derecta %>% select(ref, refstart, refend, query, qlen, strand) %>% write_tsv("/Volumes/Storage/kuruka/minimap-derecta/reads_with_kuruka.bed", col_names = FALSE)

#bedtools getfasta -fi /Volumes/Storage/kuruka/minimap-derecta/reads_with_kuruka.fasta -fo /Volumes/Storage/kuruka/minimap-derecta/matches-kuruka.fasta -s -bed /Volumes/Storage/kuruka/minimap-derecta/reads_with_kuruka.bed
#mafft -auto /Volumes/Storage/kuruka/minimap-derecta/matches-kuruka.fasta > /Volumes/Storage/kuruka/minimap-derecta/matches-kuruka.MSA
#python MSA2consensus.py /Volumes/Storage/kuruka/minimap-derecta/matches-kuruka.MSA /Volumes/Storage/kuruka/minimap-derecta/matches-kuruka.consensus.fasta
```

8833 bp consensus. 514 bp LTR, perfect match.
