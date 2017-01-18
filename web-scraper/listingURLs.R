#Discriminatory (*sp) Listing Finder
#Ted Kwartler @tkwartler
#License MIT

#libaries
library(rvest)
library(pbapply)
library(curl)

#Base URL
url.base<-'http://boston.craigslist.org/search/aap?s='
# listing.urls<-paste0(url.base, seq(0,2500, 100))
listing.urls<-paste0(url.base, seq(0,200, 100))



#link collector
link.get<-function(link.url){
  x<-read_html(link.url)
  #Sys.sleep(5)
  x<-html_attr(html_nodes(x, "a"), "href")
  listings<-grep('*gbs*', x)
  x<-x[listings]
  x<-paste0('http://boston.craigslist.org',x)
  x<-unique(x)
  return(x)
}

#get all listing urls
all.listings<-unlist(pblapply(listing.urls, link.get))

#End