NanoStockUrl <-"https://fubon-ebrokerdj.fbs.com.tw/z/ze/zeg/zega_EBTW50E_I.djhtm"
NanoStockName <- read_html(NanoStockUrl) %>% 
    html_nodes("#oAddCheckbox") %>% html_text()
NanoStockPrice<-read_html(NanoStockUrl) %>% 
    html_nodes(".t3n1") %>% html_text()
head(NanoStockName)
head(NanoStockPrice)
NanoStockPriceTable<-
    matrix(NanoStockPrice, ncol=6, byrow=TRUE)
NanoStockNameClean<-gsub('\\r|<|!|\\n|\\t|GenLink2stk|;|/|-|>',
                         '',
                         NanoStockName)
NanoStockData <- 
    data.frame(name = NanoStockNameClean,
               NanoStockPriceTable)

pptUrl <- "https://www.ptt.cc/bbs/Tech_Job/index.html"
pptTitle <- read_html(pptUrl) %>% html_nodes(".title") %>% html_text()
pptCleanTitle <- gsub('\n\t',
                      '', pptTitle)
pptTitle[1:3]
