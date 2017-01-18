
#Discriminatory (*sp) Listing Finder
#Ted Kwartler @tkwartler
#License MIT

#libaries
library(rvest)
library(pbapply)
library(curl)

#Base URL
url.base<-'http://boston.craigslist.org/search/aap?s='
listing.urls<-paste0(url.base, seq(0,2500, 100))


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

#attribute extraction
extract.get<-function(x){
  ifelse(length(x)>=1,
         all<-data.frame(id=x[[1]][2], location=x[[1]][3],
                         rent_fee=x[[1]][4],available=x[[1]][6],
                         beds=x[[1]][7],baths=substring(x[[1]][8],1,5), text=x[[1]][8]),
         all<-data.frame(id='NA', location='NA', rent_fee='NA',available='NA',beds='NA',baths='NA', text='NA'))
  return(all)
}

#listing info
info.get<-function(info.url){
  x<-read_html(curl(info.url, handle = curl::new_handle("useragent" = "Mozilla/5.0")))
  Sys.sleep(10)
  x<-html_nodes(x, xpath = '//*[@id="postingbody"]')
  x<-html_text(x)
  x<-strsplit(x,':')
  x<-extract.get(x)
  return(x)
}

all.info<-pblapply(all.listings,info.get)
#End