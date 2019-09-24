---
title: "cm007 Exercises: Practice with `dplyr`"
output: 
  html_document:
    keep_md: true
    theme: paper
---

<!---The following chunk allows errors when knitting--->




```r
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(gapminder))
suppressPackageStartupMessages(library(tsibble))
```


This worksheet contains exercises aimed for practice with `dplyr`. 


1. (a) What's the minimum life expectancy for each continent and each year? (b) Add the corresponding country to the tibble, too. (c) Arrange by min life expectancy.


```r
gapminder %>% 
  group_by(continent,year) %>% 
  summarize(min_life = min(lifeExp),
            country=country[lifeExp==min_life])%>%
  arrange(min_life)
```

```
## # A tibble: 60 x 4
## # Groups:   continent [5]
##    continent  year min_life country     
##    <fct>     <int>    <dbl> <fct>       
##  1 Africa     1992     23.6 Rwanda      
##  2 Asia       1952     28.8 Afghanistan 
##  3 Africa     1952     30   Gambia      
##  4 Asia       1957     30.3 Afghanistan 
##  5 Asia       1977     31.2 Cambodia    
##  6 Africa     1957     31.6 Sierra Leone
##  7 Asia       1962     32.0 Afghanistan 
##  8 Africa     1962     32.8 Sierra Leone
##  9 Asia       1967     34.0 Afghanistan 
## 10 Africa     1967     34.1 Sierra Leone
## # … with 50 more rows
```

2. Calculate the growth in population since the first year on record _for each country_ by rearranging the following lines, and filling in the `FILL_THIS_IN`. Here's another convenience function for you: `dplyr::first()`. 

```
mutate(rel_growth = FILL_THIS_IN) %>% 
arrange(FILL_THIS_IN) %>% 
gapminder %>% 
DT::datatable()
group_by(country) %>% 
```




3. Determine the country that experienced the sharpest 5-year drop in life expectancy, in each continent, sorted by the drop, by rearranging the following lines of code. Ensure there are no `NA`'s. Instead of using `lag()`, use the convenience function provided by the `tsibble` package, `tsibble::difference()`:

```
drop_na() %>% 
ungroup() %>% 
arrange(year) %>% 
filter(inc_life_exp == min(inc_life_exp)) %>% 
gapminder %>% 
mutate(inc_life_exp = FILL_THIS_IN) %>% 
arrange(inc_life_exp) %>% 
group_by(country) %>% 
group_by(continent) %>% 
knitr::kable()
```



gapminder %>% 
  summarize(mu    = mean(lifeExp),
            sigma = sd(lifeExp))

