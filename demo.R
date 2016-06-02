library(twitteR)
load("~/learningr/api_auth.rda")
twitteR::setup_twitter_oauth(tw_consumer_key, tw_consumer_secret, tw_token, tw_token_secret)

tweets = searchTwitteR("#bigdata", resultType="recent", n = 100)
tweets = plyr::ldply(tweets, as.data.frame)

library(RTextTools)
library(corpustools)
dtm = create_matrix(tweets$text)
dtm.wordcloud(dtm, freq.fun = sqrt)
