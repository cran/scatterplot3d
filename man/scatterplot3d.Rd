\name{scatterplot3d}
\alias{scatterplot3d}
\title{3D Scatter Plot}
\description{
  Plots a three dimensional (3D) point cloud perspectively.
}
\usage{
scatterplot3d(x, y=NULL, z=NULL, color=par("col"), main=NULL,
    sub=NULL, xlim=NULL, ylim=NULL, zlim=NULL, xlab=NULL,
    ylab=NULL, zlab=NULL, scale.y=1, angle=40, axis=TRUE,
    tick.marks=TRUE, label.tick.marks=TRUE, 
    x.ticklabs=NULL, y.ticklabs=NULL, z.ticklabs=NULL,
    y.margin.add=0, grid=TRUE, box=TRUE, lab=par("lab"),
    lab.z=mean(lab[1:2]), type=par("type"), highlight.3d=FALSE,
    mar=c(5,3,4,3)+0.1, col.axis=par("col.axis"),
    col.grid="grey", col.lab=par("col.lab"),
    cex.axis=par("cex.axis"), cex.lab=0.8 * par("cex.lab"),
    font.axis=par("font.axis"), font.lab=par("font.lab"),
    lty.axis=par("lty"), lty.grid=par("lty"), log="", ...)
}
\arguments{
 \item{x}{the coordinates of points in the plot.}
 \item{y}{the y coordinates of points in the plot, optional if \code{x} is an appropriate structure.}
 \item{z}{the z coordinates of points in the plot, optional if \code{x} is an appropriate structure.}
 \item{color}{colors of points in the plot, optional if \code{x} is an appropriate structure.  
Will be ignored if \code{highlight.3d = TRUE}.}
 \item{main}{an overall title for the plot.}
 \item{sub}{sub-title.}
 \item{xlim, ylim, zlim}{the x, y and z limits (min, max) of the plot.}
 \item{xlab, ylab, zlab}{titles for the x, y and z axis.}
 \item{scale.y}{scale of y axis related to x- and z axis.}
 \item{angle}{angle between x and y axis (Attention: result depends on scaling. 
For 180 < angle < 360  the returned functions \code{xyz.convert} and \code{points3d} will not work properly.).}
 \item{axis}{a logical value indicating whether axes should be drawn on the plot.}
 \item{tick.marks}{a logical value indicating whether tick marks should be drawn on the plot (only if \code{axis = TRUE}).}
 \item{label.tick.marks}{a logical value indicating whether tick marks should be labeled on the plot 
(only if \code{axis = TRUE} and \code{tick.marks = TRUE}).}
 \item{x.ticklabs, y.ticklabs, z.ticklabs}{vector of tick mark labels.}
 \item{y.margin.add}{add additional space between tickmark labels and
   axis label of the y axis}
 \item{grid}{a logical value indicating whether a grid should be drawn on the plot.}
 \item{box}{a logical value indicating whether a box should be drawn around the plot.}
 \item{lab}{a numerical vector of the form c(x, y, len).  
The values of x and y give the (approximate) number of tickmarks on the x and y axes.}
 \item{lab.z}{the same as \code{lab}, but for z axis.}
 \item{type}{character indicating the type of plot: "p" for points, "l" for lines, "h" for vertical lines to x-y-plane, etc.}
 \item{highlight.3d}{points will be drawn in different colors related to y coordinates 
(only if \code{type = "p"} or \code{type = "h"}, else \code{color} will be used).\cr
On some devices not all colors can be displayed. In this case try the postscript device or use \code{highlight.3d = FALSE}.}
 \item{mar}{A numerical vector of the form c(bottom, left, top, right) 
which gives the lines of margin to be specified on the four sides of the plot.}
 \item{col.axis, col.grid, col.lab}{the color to be used for axis / grid / axis labels.}
 \item{cex.axis, cex.lab}{the magnification to be used for axis annotation / labels relative to the current.}
 \item{font.axis, font.lab}{the font to be used for axis annotation / labels.}
 \item{lty.axis, lty.grid}{the line type to be used for axis / grid.}
 \item{log}{Not yet implemented!  A character string which contains "x" (if the x axis is to be logarithmic), 
"y", "z", "xy", "xz", "yz", "xyz".}
 \item{\dots}{more graphical parameters can be given as arguments, \code{pch = 16} or \code{pch = 20} may be nice.}
}
\value{
  \item{xyz.convert}{function which converts coordinates from 3D (x, y, z) to 2D-projection (x, y) of \code{scatterplot3d}.  
Usefull to plot objects into existing plot.}
  \item{points3d}{function which draws points or lines into the existing plot.}
}
\note{
Some graphical parameters can only be set as arguments in \code{scatterplot3d} but not in \code{par}, e.g. \code{mar}.
Other arguments in \code{par} may be splitted into several arguments in \code{scatterplot3d}, 
e.g. for specifying the line type.
And finally some of the arguments in \code{par} do not work, e.g. many of those for axis calculation.
So the recommended way is to try the specification of graphical parameters at first as arguments in \code{scatterplot3d}
and at last as arguments in \code{par}.
}
\author{
  Uwe Ligges \email{ligges@statistik.uni-dortmund.de};
  \url{http://www.statistik.uni-dortmund.de/leute/ligges.htm}.
}
\seealso{
  \code{\link{persp}}, \code{\link{plot}}, \code{\link{par}}.
}
\examples{
    ## On some devices not all colors can be displayed.
    ## Try the postscript device or use highlight.3d = FALSE.

    ## example 1
    z <- seq(-10, 10, 0.01)
    x <- cos(z)
    y <- sin(z)
    scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue",
        col.grid="lightblue", main="scatterplot3d -- example 1", pch=20)

    ## example 2
    temp <- seq(-pi, 0, length = 50)
    x <- as.vector(rep(1, 50) \%*\% t(cos(temp)))
    y <- as.vector(cos(temp) \%*\% t(sin(temp)))
    z <- as.vector(sin(temp) \%*\% t(sin(temp)))
    scatterplot3d(x, y, z, highlight.3d=TRUE, 
        col.axis="blue", col.grid="lightblue",
        main="scatterplot3d -- example 2", pch=20)

    ## example 3
    temp <- seq(-pi, 0, length = 50)
    x <- as.vector(rep(1, 50) \%*\% t(cos(temp)))
    y <- as.vector(cos(temp) \%*\% t(sin(temp)))
    z <- 10 * as.vector(sin(temp) \%*\% t(sin(temp)))
    color <- rep("green", length(x))
    temp <- seq(-10, 10, 0.01)
    x <- c(x, cos(temp))
    y <- c(y, sin(temp))
    z <- c(z, temp)
    color <- c(color, rep("red", length(temp)))
    scatterplot3d(x, y, z, color, pch=20, zlim=c(-2, 10),
        main="scatterplot3d -- example 3")

    ## example 4
    my.mat <- matrix(runif(25), nrow=5)
    dimnames(my.mat) <- list(LETTERS[1:5], letters[11:15])
    my.mat # the matrix we want to plot ...
    
    s3d.dat <- data.frame(cols=as.vector(col(my.mat)), 
        rows=as.vector(row(my.mat)), 
        value=as.vector(my.mat))
    scatterplot3d(s3d.dat, type="h", lwd=5, pch=" ", 
        x.ticklabs=colnames(my.mat), y.ticklabs=rownames(my.mat), 
        color=grey(25:1/40), main="scatterplot3d -- example 4")

    ## example 5
    data(trees)
    s3d <- scatterplot3d(trees, type="h", highlight.3d=TRUE, 
        pch=16, main="scatterplot3d -- example 5")
    # Now adding some points to the "scatterplot3d"
    s3d$points3d(seq(10,20,2), seq(85,60,-5), seq(60,10,-10), 
        col="blue", type="h", pch=16)        
}
\keyword{hplot}
