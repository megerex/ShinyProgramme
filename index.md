---
title       : "Shiny Programme Pitch"
subtitle    : "A long way down the route "
author      : "Quan"
job         : "Play God!"
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## A Shiny App that demonstrates function curves

- This Shiny application is for the assignment work in Data Products Course.
- The Course is online by John Hopkins University from Coursera.
- This presentation pitch is accompanying the Shiny APP published at
  https://quan.shinyapps.io/ShinyProgramme/
- The Author of this work is Quan.

---

## Ui.R is built with key features required

- Five critically important functions are arranged in "sidebarPanel".
- Three panels of curve, Summary and data are shown in the "mainPanel".
- Documents are integrated in the application sidebar to instruct users.

---

## Server.R is built with ggplot2

- The demonstrative figure was made with annotation of the function 
    equation as well as an adjustable range.


```r
    require(ggplot2)
    p <- ggplot(data.frame(x=c(-5,5)), aes(x=x, color="red")) +
             stat_function(fun=dnorm, geom = "line", size=1, n=1000) +
             annotate("text", x=-5+0.2, y=0.2, parse=TRUE, 
                      label="y==frac(1,sqrt(2*pi))*e^(frac(-x^2,2))", 
                      color="blue"
                     )
    p
```

---

## What you will see in the figure of the shiny app

- You should be expecting a demonstrative figure shown in my Shiny Programme as follows.

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

---
