

library("dplyr")
library("reshape2")
library("ggplot2")

setwd("~/wimby")

wimb = read.csv("allwimbledon.csv", stringsAsFactors = FALSE);
r2f  = read.csv("pathToFinals.csv", stringsAsFactors = FALSE);



# visual 1-- double sided bar plot --------------------------------------------
    # side by side comparison of road to final match statistics
    # double-sided bar plot




# visual 2 -- hour glass visual ~ # of hours -----------------------------------
    # hours spent on court
    # compare to previous years that he has won




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
    geom_vline(xintercept = c(2007, 2009, 2012), linetype = "dotted");


