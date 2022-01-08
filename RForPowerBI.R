#Vertical Barchart
# The following code to create a dataframe and remove duplicated rows is always executed and acts as a preamble for your script: 

#dataset <- data.frame(Amount, Date, Month, Product, Profit, Quantity, Year, Week)
# dataset <- unique(dataset)

# Paste or type your script code here:
#install.packages("ggplot2",repos = "http://cran.us.r-project.org")
library(ggplot2)
library(plotly)

# Create data

# Barplot
ggplot(dataset, aes(x=Product, y=Profit,fill=Product),position = "dodge") + geom_point()+ # Show dots
  geom_text(
    label=rownames(dataset), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )+ geom_smooth(method=lm , color="red", se=FALSE) +
  geom_bar(stat = "identity") + theme(plot.background = element_rect(fill = 'black')) + theme(axis.text = element_text(colour = "white")) + theme(axis.title.x = element_text(colour = "White", size=rel(2)))+ theme(axis.title.y = element_text(colour = "White",angle=45,size=rel(2)))+theme(panel.background = element_rect(fill="black"))+theme(panel.grid.minor.y = element_line(size=3))+theme(panel.grid.major = element_line(colour = "orange"))




#-------------------------------------------------------------------------------
#Pie Chart
cat <- table(dataset$Product)

# Pie
pie(cat,
    col = hcl.colors(length(cat), "BluYl"))

#---------------------------------------------------------------------------\#
#Stack chart
library(ggplot2)

# Paste or type your script code here:
ggplot(dataset, aes(x = Month, fill = Product)) + 
  geom_bar()
  #coord_polar(theta = "y") 
  
#----------------------------------------------------------------------------#
#Donut chart
library(ggplot2)
library(dplyr)
# Increase the value to make the hole bigger
# Decrease the value to make the hole smaller
hsize <- 9
# Paste or type your script code here:
ggplot(dataset, aes(x = hsize, y = ProductComposition, fill = Product)) +
  geom_col() +
 # geom_label(aes(label = ProductComposition),
  #           position = position_stack(vjust = 0.5),
  #           show.legend = FALSE) +
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize + 0.5))
  
  #-----------------------------------------------------------------------#
  #Scatter chart
  library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(viridis)
# The dataset is provided in the gapminder library

# Most basic bubble plot
dataset %>%
  arrange(desc(Profit)) %>%
  #mutate(country = factor(Product, Month)) %>%
  ggplot(aes(x=Quantity, y=Amount, size=Profit, color=Product)) +
    geom_point(alpha=0.5) +
    scale_size(range = c(.1, 24), name="Population (M)") +
    scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
    theme_ipsum() +
    theme(legend.position="bottom")  +
    ylab("Life Expectancy") +
    xlab("Gdp per Capita") +
    theme(legend.position = "none")
    
    #---------------------------------------Timeseries chart
    library(ggplot2)


# Create data

# Barplot
p<-ggplot(dataset, aes(x=as.Date(Date), y=Profit),position = "dodge") + geom_point()+ # Show dots
  geom_text(
    label=rownames(dataset), 
    nudge_x = 0.25, nudge_y = 0.25, 
    check_overlap = T
  )+ geom_smooth(method=lm , color="red", se=FALSE) +
  geom_bar(stat = "identity") + theme(plot.background = element_rect(fill = 'black')) + theme(axis.text = element_text(colour = "white")) + theme(axis.title.x = element_text(colour = "White", size=rel(2)))+ theme(axis.title.y = element_text(colour = "White",angle=45,size=rel(2)))+theme(panel.background = element_rect(fill="black"))+theme(panel.grid.minor.y = element_line(size=3))+theme(panel.grid.major = element_line(colour = "orange"))

p+scale_x_date(date_labels = "%b")
p+scale_x_date(date_labels = "%Y %b %d")
p+scale_x_date(date_labels = "%W")
p+scale_x_date(date_labels = "%m-%Y")

    
    
