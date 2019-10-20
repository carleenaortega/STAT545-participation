#Class 3 Sept 10 2019

#AUTHORING
#integrating the code into thesis or paper so it runs simultaneously there

#OUTPUT FORMATS
#PDF is confined to the page and is not editable;good to typeset; if you want to add something that does not need to be printed, do not use PDF
#html is used when websites are made; not good to typeset but the rendered version is visually appealing; not confined on the page; view only as output file because not very easy to edit;
#output is like the cake and the code is the recipe
#the source we're using is MARKDOWN, (R)MARKDOWN is different

#MARKDOWN
#extension for markdown: .md
# # makes it into a header
# __ text __ or ** text ** bolds the text; any works but _ is also used italics
# [displayed text](text link)
# switched to "navigating_github.md"
# the file saves as soon as you preview
# need to DL MacTex to provide PDF

#return to this source
#install.packages('rmarkdown')
install.packages('gapminder')
install.packages('tibble')
install.packages('DT')
browseVignettes(package="rmarkdown") # mini lesson on the package "rmarkdown"
install.packages('rmarkdown')
install.packages('gapminder')
install.packages('tibble')
install.packages('DT')
browseVignettes(package="rmarkdown") #this works
browseVignettes(package="gapminder")
browseVignettes(package="tibble") #this works
browseVignettes(package="DT") #this works too

#EXPLORING CODE CHUNKS
#made the "untitled1" markdown file
#YAML is lines 1-4 of that doc; it provides metadata on the file (e.g. format, etc)
#code chunks start with ''' and ends with it too; everything inside it is r code
#knit integrates the code by running it and then making the html output
#R markdown does not interfere with the currently opened R docs since it opens and closes right away; tf it is not in the environment
# can skip loading the library by using DT::datatable(); it can be useful if you have a heavyset data

#TOC in YAML
#need to ensure that indenting is properly executed to avoid error when knitting

#EXPLORING CHUNK OPTIONS
#r,warning=FALSE hides the warnings
#echo=FALSE hides the code
#name the chunk by r name
#the stacked lines directs you to the headings that you have

#RMD Presentations
