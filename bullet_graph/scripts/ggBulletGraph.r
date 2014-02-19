#'  h_bullet: Horizontal Bullet Graph
#'  
#'  @author Tony Fujs
#'  
#'  @param df:  data.frame with 1 rows and the following 7 columns
#'                     measure  : label of what's being measured
#'                     unit     : label of units of the measure
#'                     high     : the high value for the measure
#'                     mean     : the mean value for the measure
#'                     low      : the low value for the measure
#'                     target   : the target value for the measure
#'                     value    : the actual value of the measure
#'

### Horizontal Bullet Chart----
h_bullet <- function(df) {
df$label <- paste0(df$measure, '\n', df$units)
p <- ggplot(df, aes(x = label)) + 
  coord_flip() +
  geom_bar(aes(y = high), fill = "#E0E0E0", stat = "identity") +
  geom_bar(aes(y = mean), fill = "#C8C8C8", stat = "identity") +
  geom_bar(aes(y = low), fill = "#989898", stat = "identity") +
  geom_bar(aes(y = value), width = 0.3, fill = "black", stat = "identity") +
  geom_point(aes(y = target), shape = "|", size = 12, color = "red") +
  scale_x_discrete(expand = c(0,0)) +
  xlab("") +
  ylab("") +
  theme(aspect.ratio = 1/18,
        panel.border = element_blank(),
        axis.text.x = element_text(size = 14, face = 'bold', color = 'black'),
        axis.text.y = element_text(size = 20, face = 'bold', color = 'black'),
        axis.ticks.y = element_blank(),
        plot.margin = unit(c(1.1, 0, 0, 0), units = "cm"),
        panel.background = element_blank())
p
}

#'  v_bullet: Vertical Bullet Graph
#'  
#'  @author Tony Fujs
#'  
#'  @param df:  data.frame with 1 rows and the following 7 columns
#'                     measure  : label of what's being measured
#'                     unit     : label of units of the measure
#'                     high     : the high value for the measure
#'                     mean     : the mean value for the measure
#'                     low      : the low value for the measure
#'                     target   : the target value for the measure
#'                     value    : the actual value of the measure
#'

### Vertical Bullet Chart----
v_bullet <- function(df) {
  df$label <- paste0(df$measure, '\n', df$units)
  p <- ggplot(df, aes(x = label)) + 
    geom_bar(aes(y = high), fill = "#E0E0E0", stat = "identity") +
    geom_bar(aes(y = mean), fill = "#C8C8C8", stat = "identity") +
    geom_bar(aes(y = low), fill = "#989898", stat = "identity") +
    geom_bar(aes(y = value), width = 0.3, fill = "black", stat = "identity") +
    geom_point(aes(y = target), shape = "-", size = 16, color = "red") +
    scale_x_discrete(expand = c(0,0)) +
    xlab("") +
    ylab("") +
    theme(aspect.ratio = 6/1,
          panel.border = element_blank(),
          axis.text.x = element_text(size = 20, face = 'bold', color = 'black'),
          axis.text.y = element_text(size = 14, face = 'bold', color = 'black'),
          axis.ticks.x = element_blank(),
          plot.margin = unit(c(1.1, 0, 0, 0), units = "cm"),
          panel.background = element_blank())
  p
}
