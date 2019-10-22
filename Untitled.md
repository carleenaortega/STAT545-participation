Untitled
================

library(“tidyverse”) library(“gapminder”)

gapminder write\_csv(gapminder,‘./gapminder.csv’) view(gapminder)

# Calculate mean life Exp per continent

gapminder\_sum \<- gapminder %\>% + group\_by(continent) %\>% +
summarize(ave\_lifeExp=mean(lifeExp))

view(gapminder\_sum) write\_csv(gapminder\_sum,‘./gapminder\_sum.csv’)

gapminder\_sum %\>% ggplot

\#Part II

library(“tidyverse”)

gapminder\_csv \<- read\_csv(‘./gampinder\_sum.csv’) \#on windows, it is
.\_sum.csv

\#another way of using here \#is platform agnostic, dir-structure
agnostic read\_csv(here::here(“test”,“tes”,“te”,“t”,gapminder\_sum.csv))

\#couple more things about here set\_here()

view(gapminder\_csv)

\#in here: write\_csv(gapminder\_sum, here::here(“gapminder\_sum.csv”))

ls() list=ls() remove(list=ls())

ls() \#only removes the variables, the packages are still not detached

library(“tidyverse”) library(“here”)

## read Excel file

### Datafiles from this tutorial: <https://beanumber.github.io/sds192>

data\_url \<-
“<http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls>”

# read\_csv can directly import URLs but read\_excel requires you to download it first.

read\_csv(url) download.file(url=data\_url, destfile =
paste(‘./datasets/’,file\_name))

\#CLS files may not work on windows \# Task: change above to use the
“here::here” package: download.file(url=data\_url, destfile =
here::here(“test”,“greatestGiver.xls”))

install.packages(“readxl”) library(readxl) philanthropists
\<-read\_excel(here::here)

xls\_url \<-
“<http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls>”
download.file(xls\_url,here::here(“data”,“cm011\_data”,“some\_file.xls”))

file\_name \<- basename(xls\_url)
download.file(xls\_url,here::here(“data”,“cm011\_data”,file\_name))

read\_excel(here::here(“data”,“cm011\_data”,file\_name))

mri\_file = here::here(“data”,“cm011\_data”,“Firas-MRI.xlsx”) mri \<-
read\_excel(mri\_file, range = “A1:K12”)

mri\_file = here::here(“data”,“cm011\_data”,“Firas-MRI.xlsx”) mri \<-
read\_excel(mri\_file, range = “A1:L12”)

mri \<- mri %\>% tidyr::pivot\_longer(cols = `Slice 1`:`Slice 8`,
names\_to = ‘slice\_no’, values\_to = ‘value’) mri

\#assign the imported data to excel file: view(philanthropists)

head(philanthropists)

\#Part III

install.packages(“here”) library(“here”)
