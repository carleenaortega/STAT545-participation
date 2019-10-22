---
title: "cm010 Exercises: Tibble Joins"
output: 
  html_document:
    keep_md: true
    theme: paper
---

## Requirements

You will need Joey's `singer` R package for this exercise. And to install that, you'll need to install `devtools`. Running this code in your console should do the trick:

```
# cannot load so will open the link below instead..
install.packages("devtools")
devtools::install_github("JoeyBernhardt/singer")
```

If you can't install the `singer` package, we've put the singer data on the `STAT545-UBC/Classroom` repo, and you can load those in instead by running the following lines of code:


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
## ✔ tidyr   1.0.0     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
songs <- read_csv("https://raw.githubusercontent.com/STAT545-UBC/Classroom/master/data/singer/songs.csv")
```

```
## Parsed with column specification:
## cols(
##   title = col_character(),
##   artist_name = col_character(),
##   year = col_double()
## )
```

```r
locations <- read_csv("https://raw.githubusercontent.com/STAT545-UBC/Classroom/master/data/singer/loc.csv")
```

```
## Parsed with column specification:
## cols(
##   artist_name = col_character(),
##   city = col_character(),
##   release = col_character(),
##   title = col_character()
## )
```

Load required packages (skip this because did not download the package):

``{r, echo = FALSE, warning = FALSE, message = FALSE allow errors}
library(tidyverse)
library(singer)
knitr::opts_chunk$set(fig.width=4, fig.height=3, warning = FALSE, fig.align = "center")
```

<!---The following chunk allows errors when knitting--->



## Exercise 1: `singer`

The package `singer` comes with two smallish data frames about songs. Let's take a look at them (after minor modifications by renaming and shuffling):


```r
(time <- as_tibble(songs) %>% 
   rename(song = title))
```

```
## # A tibble: 22 x 3
##    song                             artist_name      year
##    <chr>                            <chr>           <dbl>
##  1 Corduroy                         Pearl Jam        1994
##  2 Grievance                        Pearl Jam        2000
##  3 Stupidmop                        Pearl Jam        1994
##  4 Present Tense                    Pearl Jam        1996
##  5 MFC                              Pearl Jam        1998
##  6 Lukin                            Pearl Jam        1996
##  7 It's Lulu                        The Boo Radleys  1995
##  8 Sparrow                          The Boo Radleys  1992
##  9 Martin_ Doom! It's Seven O'Clock The Boo Radleys  1995
## 10 Leaves And Sand                  The Boo Radleys  1993
## # … with 12 more rows
```


```r
(album <- as_tibble(locations) %>% 
   select(title, everything()) %>% 
   rename(album = release,
          song  = title))
```

```
## # A tibble: 14 x 4
##    song                        artist_name   city        album             
##    <chr>                       <chr>         <chr>       <chr>             
##  1 Grievance                   Pearl Jam     Seattle, WA Binaural          
##  2 Stupidmop                   Pearl Jam     Seattle, WA Vitalogy          
##  3 Present Tense               Pearl Jam     Seattle, WA No Code           
##  4 MFC                         Pearl Jam     Seattle, WA Live On Two Legs  
##  5 Lukin                       Pearl Jam     Seattle, WA Seattle Washingto…
##  6 Stuck On Amber              The Boo Radl… Liverpool,… Wake Up!          
##  7 It's Lulu                   The Boo Radl… Liverpool,… Best Of           
##  8 Sparrow                     The Boo Radl… Liverpool,… Everything's Alri…
##  9 High as Monkeys             The Boo Radl… Liverpool,… Kingsize          
## 10 Butterfly McQueen           The Boo Radl… Liverpool,… Giant Steps       
## 11 My One and Only Love        Carly Simon   New York, … Moonlight Serenade
## 12 It Was So Easy  (LP Versio… Carly Simon   New York, … No Secrets        
## 13 I've Got A Crush On You     Carly Simon   New York, … Clouds In My Coff…
## 14 "Manha De Carnaval (Theme … Carly Simon   New York, … Into White
```


1. We really care about the songs in `time`. But, which of those songs do we know its corresponding album?


```r
time %>% 
  inner_join(album, by=song)
```

```
## Error in common_by(by, x, y): object 'song' not found
```

2. Go ahead and add the corresponding albums to the `time` tibble, being sure to preserve rows even if album info is not readily available.


```r
time %>% 
  full_join(album, by ="song")
```

```
## # A tibble: 23 x 6
##    song          artist_name.x   year artist_name.y  city     album        
##    <chr>         <chr>          <dbl> <chr>          <chr>    <chr>        
##  1 Corduroy      Pearl Jam       1994 <NA>           <NA>     <NA>         
##  2 Grievance     Pearl Jam       2000 Pearl Jam      Seattle… Binaural     
##  3 Stupidmop     Pearl Jam       1994 Pearl Jam      Seattle… Vitalogy     
##  4 Present Tense Pearl Jam       1996 Pearl Jam      Seattle… No Code      
##  5 MFC           Pearl Jam       1998 Pearl Jam      Seattle… Live On Two …
##  6 Lukin         Pearl Jam       1996 Pearl Jam      Seattle… Seattle Wash…
##  7 It's Lulu     The Boo Radle…  1995 The Boo Radle… Liverpo… Best Of      
##  8 Sparrow       The Boo Radle…  1992 The Boo Radle… Liverpo… Everything's…
##  9 Martin_ Doom… The Boo Radle…  1995 <NA>           <NA>     <NA>         
## 10 Leaves And S… The Boo Radle…  1993 <NA>           <NA>     <NA>         
## # … with 13 more rows
```

3. Which songs do we have "year", but not album info?


```r
time %>% 
 left_join(album,by="year")
```

```
## `by` can't contain join column `year` which is missing from RHS
```

4. Which artists are in `time`, but not in `album`?


```r
time %>% 
  anti_join(album, by = "artist_name")
```

```
## # A tibble: 5 x 3
##   song                  artist_name   year
##   <chr>                 <chr>        <dbl>
## 1 Mine Again            Mariah Carey  2005
## 2 Don't Forget About Us Mariah Carey  2005
## 3 Babydoll              Mariah Carey  1997
## 4 Don't Forget About Us Mariah Carey  2005
## 5 Vision Of Love        Mariah Carey  1990
```


5. You've come across these two tibbles, and just wish all the info was available in one tibble. What would you do?


```r
time %>% 
  full_join(album, by = "song")
```

```
## # A tibble: 23 x 6
##    song          artist_name.x   year artist_name.y  city     album        
##    <chr>         <chr>          <dbl> <chr>          <chr>    <chr>        
##  1 Corduroy      Pearl Jam       1994 <NA>           <NA>     <NA>         
##  2 Grievance     Pearl Jam       2000 Pearl Jam      Seattle… Binaural     
##  3 Stupidmop     Pearl Jam       1994 Pearl Jam      Seattle… Vitalogy     
##  4 Present Tense Pearl Jam       1996 Pearl Jam      Seattle… No Code      
##  5 MFC           Pearl Jam       1998 Pearl Jam      Seattle… Live On Two …
##  6 Lukin         Pearl Jam       1996 Pearl Jam      Seattle… Seattle Wash…
##  7 It's Lulu     The Boo Radle…  1995 The Boo Radle… Liverpo… Best Of      
##  8 Sparrow       The Boo Radle…  1992 The Boo Radle… Liverpo… Everything's…
##  9 Martin_ Doom… The Boo Radle…  1995 <NA>           <NA>     <NA>         
## 10 Leaves And S… The Boo Radle…  1993 <NA>           <NA>     <NA>         
## # … with 13 more rows
```


## Exercise 2: LOTR

Load in the three Lord of the Rings tibbles that we saw last time:


```r
fell <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")
```

```
## Parsed with column specification:
## cols(
##   Film = col_character(),
##   Race = col_character(),
##   Female = col_double(),
##   Male = col_double()
## )
```

```r
ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")
```

```
## Parsed with column specification:
## cols(
##   Film = col_character(),
##   Race = col_character(),
##   Female = col_double(),
##   Male = col_double()
## )
```

```r
retk <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")
```

```
## Parsed with column specification:
## cols(
##   Film = col_character(),
##   Race = col_character(),
##   Female = col_double(),
##   Male = col_double()
## )
```

1. Combine these into a single tibble.


```r
full_join(fell, ttow, retk)
```

```
## `by` must be a (named) character vector, list, or NULL for natural joins
## (not recommended in production code), not a `spec_tbl_df/tbl_df/tbl/
## data.frame` object
```

2. Which races are present in "The Fellowship of the Ring" (`fell`), but not in any of the other ones?


```r
fell %>% 
  anti_join(ttow, by = "Race") %>% 
  anti_join(retk, by = "Race")
```

```
## # A tibble: 0 x 4
## # … with 4 variables: Film <chr>, Race <chr>, Female <dbl>, Male <dbl>
```



## Exercise 3: Set Operations

Let's use three set functions: `intersect`, `union` and `setdiff`. We'll work with two toy tibbles named `y` and `z`, similar to Data Wrangling Cheatsheet


```r
(y <-  tibble(x1 = LETTERS[1:3], x2 = 1:3))
```

```
## # A tibble: 3 x 2
##   x1       x2
##   <chr> <int>
## 1 A         1
## 2 B         2
## 3 C         3
```


```r
(z <- tibble(x1 = c("B", "C", "D"), x2 = 2:4))
```

```
## # A tibble: 3 x 2
##   x1       x2
##   <chr> <int>
## 1 B         2
## 2 C         3
## 3 D         4
```

1. Rows that appear in both `y` and `z`


```r
inner_join(y, z)
```

```
## Joining, by = c("x1", "x2")
```

```
## # A tibble: 2 x 2
##   x1       x2
##   <chr> <int>
## 1 B         2
## 2 C         3
```

2. You collected the data in `y` on Day 1, and `z` in Day 2. Make a data set to reflect that.


```r
full_join(
  mutate(y, day = "Day 1"),
  mutate(z, day = "Day 2")
)
```

```
## Joining, by = c("x1", "x2", "day")
```

```
## # A tibble: 6 x 3
##   x1       x2 day  
##   <chr> <int> <chr>
## 1 A         1 Day 1
## 2 B         2 Day 1
## 3 C         3 Day 1
## 4 B         2 Day 2
## 5 C         3 Day 2
## 6 D         4 Day 2
```

3. The rows contained in `z` are bad! Remove those rows from `y`.


```r
y %>% 
antijoin(z)
```

```
## Error in antijoin(., z): could not find function "antijoin"
```
