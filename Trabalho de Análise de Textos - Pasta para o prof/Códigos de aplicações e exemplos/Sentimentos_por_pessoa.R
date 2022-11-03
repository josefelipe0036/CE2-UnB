
#API gerada externamente
api <- "Acrescente aqui a API"


#Resgate dos dados no Twitter
pessoa <- "CamilaNogush" #Nome da conta do twitter desejado para a análise dos sentimentos
tweets_en <- get_timeline(user = "CamilaNoguch",n=100)

se <- function(x) sqrt(var(x)/length(x)) 


an_sentimentosEN <- tweets_en %>%
  unnest_tokens(word,text,token = "tweets") %>%
  select(user_id,status_id,created_at,screen_name,word) %>%
  translate("word", google.api.key = api, source.lang = "pt", target.lang = "en") %>%
  anti_join(stop_words) %>%
  inner_join(get_sentiments("nrc")) %>%
  group_by(sentiment) %>%
  tally()

plot <- ggplot(an_sentimentosEN, aes(sentiment, n, fill = sentiment)) +
  geom_bar(width = 1, stat = "identity", color = "white") +
  geom_errorbar(aes(ymin = n - se(an_sentimentosEN$n), 
                    ymax = n + se(an_sentimentosEN$n), 
                    color = sentiment), 
                width = .2) + 
  scale_y_continuous(breaks = 0:nlevels(an_sentimentosEN$sentiment)) +
  theme_gray() +
  theme(axis.ticks = element_blank(),
        axis.text = element_blank(),
        axis.title = element_blank(),
        axis.line = element_blank())

plot + coord_polar() 