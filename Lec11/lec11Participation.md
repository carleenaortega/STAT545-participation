library("tidyverse")
library("gapminder")

gapminder
write_csv(gapminder,'./gapminder.csv')
view(gapminder)

# Calculate mean life Exp per continent
gapminder_sum <- gapminder %>% 
  + group_by(continent) %>% 
  + summarize(ave_lifeExp=mean(lifeExp))


view(gapminder_sum)
write_csv(gapminder_sum,'./gapminder_sum.csv')

gapminder_sum %>% 
  ggplot


#Part II

library("tidyverse")

gapminder_csv <- read_csv('./gampinder_sum.csv') #on windows, it is .\gapminder_sum.csv


#another way of using here #is platform agnostic, dir-structure agnostic
read_csv(here::here("test","tes","te","t",gapminder_sum.csv))

#couple more things about here
set_here()


view(gapminder_csv)

#in here:
write_csv(gapminder_sum, here::here("gapminder_sum.csv"))

ls()
list=ls()
remove(list=ls())

ls() #only removes the variables, the packages are still not detached


library("tidyverse")
library("here")


## read Excel file

### Datafiles from this tutorial: https://beanumber.github.io/sds192

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

# read_csv can directly import URLs but read_excel requires you to download it first.

read_csv(url)
download.file(url=data_url, destfile = paste('./datasets/',file_name))

#CLS files may not work on windows
# Task: change above to use the "here::here" package:
download.file(url=data_url, destfile = here::here("test","greatestGiver.xls"))

install.packages("readxl")
library(readxl)
philanthropists <-read_excel(here::here)

xls_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"
download.file(xls_url,here::here("data","cm011_data","some_file.xls"))

file_name <- basename(xls_url)
download.file(xls_url,here::here("data","cm011_data",file_name))

read_excel(here::here("data","cm011_data",file_name))

mri_file = here::here("data","cm011_data","Firas-MRI.xlsx")
mri <- read_excel(mri_file, range = "A1:K12")

mri_file = here::here("data","cm011_data","Firas-MRI.xlsx")
mri <- read_excel(mri_file, range = "A1:L12")

mri <- mri %>% 
  tidyr::pivot_longer(cols = `Slice 1`:`Slice 8`,
    names_to = 'slice_no',
    values_to = 'value')
mri



#assign the imported data to excel file:
view(philanthropists)

head(philanthropists)


#Part III

install.packages("here")
library("here")





