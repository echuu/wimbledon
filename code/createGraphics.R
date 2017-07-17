library("dplyr")
library("reshape2")
library("ggplot2")
library("ggthemr")


# set theme
ggthemr('flat dark')
ggthemr_reset()

setwd("~/wimby")

wimb = read.csv("allwimbledon.csv", stringsAsFactors = FALSE);
r2f  = read.csv("pathToFinals.csv", stringsAsFactors = FALSE);
r2f_norm = read.csv("pathToFinalsNormalized.csv", stringsAsFactors = FALSE);

# visual 1-- double sided bar plot --------------------------------------------
    # side by side comparison of road to final match statistics
    # double-sided bar plot


r2f_long = melt(r2f_norm, by = "NAME") # NAME, variable, value


fed = ggplot(r2f_long, aes(x = variable)) + 
      geom_bar(data = r2f_long[r2f_long$NAME == "FEDERER",],
               aes(y = value, fill = value), stat = "identity")


fed + geom_bar(data = r2f_long[r2f_long$NAME == "CILIC",], 
               aes(y=-value, fill = -value), stat = 'identity') +
    scale_x_discrete(limits = rev(levels(r2f_long$variable))) +
    coord_flip() + labs(x = "", y = "") + theme_bw() +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + 
    scale_fill_gradient2(low = "darkorchid4", mid = "white", high = "green4", 
                         midpoint = 0, space = "rgb")



# visual 2 -- hour glass visual ~ # of hours -----------------------------------
    # hours spent on court
    # compare to previous years that he has won
    # distance covered -- person running along a line



# visual 3 --- line graph ------------------------------------------------------
    # FSPW over the years
    # RPW over years
    # BPC over years

wimb_sub = wimb[, c(1, 3:5)];

wimb_long = melt(wimb_sub, id = "year");

ggplot(wimb_long, aes(x = year, y = value, colour = variable)) + geom_point() +
    theme_bw() + geom_line() + scale_x_continuous(breaks = 2007:2017) +
    labs(x = "Year", y = "Percentage", 
         title = "Fed's Wimbledon Match Stats Over the Past Decade") +
    geom_vline(xintercept = c(2007, 2009, 2012), linetype = "dotted") +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank());


