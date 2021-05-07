x <- seq(-pi,pi,0.1)
plot(x, sin(x))
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)")

plot(x, sin(x),
     main="The Sine ",
     ylab="sin(x)",
     type="l",
     col="gray")

plot(x, sin(x),
     main="Overlaying Graphs",
     ylab="",
     type="l",
     col="gray")

lines(x,cos(x), col="red")

legend("topleft",
       c("sin(x)","cos(x)"),
       fill=c("blue","red")
)