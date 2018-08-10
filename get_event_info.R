library(httr)
library(jsonlite)
library(magrittr)

events = GET('https://api.conflictchamber.com/events') %>% 
  content(as = 'text') %>% 
  fromJSON()

details = lapply(events$uid,function(x){
  GET(paste0('https://api.conflictchamber.com/event/',x)) %>% 
    content(as = 'text') %>% 
    fromJSON()
})
