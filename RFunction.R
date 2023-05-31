library(ctmm)

rFunction = function(data, zoom = 1) {
  
  
  svf <- lapply(data, variogram)
  par(mfrow=c(length(svf) / 2, 2))
  
  pdf(appArtifactPath("variogram.pdf"))
  lapply(svf, function(x){plot(x, level=c(0.5,0.95), fraction=zoom, bty="n")})
  dev.off()
  
  return(data)
  
}