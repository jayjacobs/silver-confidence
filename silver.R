silver <- read.csv("silver.csv", header=T)
silver$wrong.obama <- ifelse(silver$result.obama >= silver$obama.min & silver$result.obama <= silver$obama.max, 0, 1)
silver$wrong.romney <- ifelse(silver$result.romney >= silver$romney.min & silver$result.romney <= silver$romney.max, 0, 1)

par(mar=c(0,0,0,0))
plot(NULL, xlim=c(-30,100), ylim=c(-1,54), yaxt="n", ann=FALSE, xaxt="n", bty="n")

text(50, 53, "Comparison of Nate Silver Forecasts and Results", pos=3)
for(i in seq(from=1, to=51, by=2)) {
  rect(-26, i-0.5, 100, i+0.5, col="#DDDDDD33", border=NA)
}
for(i in seq(from=10, to=90, by=10)) {
  segments(i, 0.5, i, 51.5, col="#CCCCCC66")
  text(i, 51, paste(i, "%", sep=""), cex=.4, pos=3)
}
segments(50, -0.5, 50, 51.5, col="#00FF0033")

for(i in seq_along(silver$State)) {
  j <- 52-i
  segments(silver$obama.min[i], j-0.3, silver$obama.max[i], j-0.3, col="blue")
  segments(silver$romney.min[i], j-0.1, silver$romney.max[i], j-0.1, col="red")
  text(0 ,j, silver$State[i], cex=0.7, pos=2)
  if (silver$wrong.obama[i]) {
    text(2, j, "*", col="blue", cex=0.7, pos=2)    
  }
  if (silver$wrong.romney[i]) {
    text(4, j, "*", col="red", cex=0.7, pos=2)    
  }
  points(silver$result.obama[i], j+0.0, cex=0.6, pch=25, col="#0000FFAA", bg="#0000FFAA")
  points(silver$result.romney[i], j+0.2, cex=0.6, pch=25, col="#FF0000AA", bg="#FF0000AA")
}

segments(12, -1, 22, -1, col="blue")
segments(12, -0.8, 22, -0.8, col="red")
text(22, -1, "Forecasts", pos=4, cex=0.7)
points(60, -0.7, cex=0.6, pch=25, col="#FF0000AA", bg="#FF0000AA")
points(62, -0.7, cex=0.6, pch=25, col="#0000FFAA", bg="#0000FFAA")
text(63, -1, "Election Results", pos=4, cex=0.7)
par(mar=c(5.1,4.1,4.1,2.1))
        