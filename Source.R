### Smooth image ###
Smooth <- function(z, ncol, nrow){
  z <- matrix(z, ncol = ncol)
  res <- matrix(z, nrow = nrow, ncol = ncol)
  for(i in 2:(nrow-1)){
    for(j in 2:(ncol-1)){
      res[i,j] <- mean(c(z[i,j],z[i,j], z[i+1,j], z[i, j+1], z[i,j-1]), na.rm = TRUE)
    }
  }
  return(res)
}

### Making Ratio ###
make_ratio <- function( C, M, threup,thredwn, lower, upper, ncol, nrow){
  C[C <20] <- NA   #background int = 20
  M[M  <20] <- NA   # background int = 20
  ratio <- (M/C)
  ratio[ratio > threup] <- threup  #upper threshold
  ratio[ratio < thredwn] <- thredwn    #lower threshold
  ratio[1] <- lower  #max value
  ratio[2] <- upper   #min value
  mat <- Smooth(ratio, ncol, nrow)
  return(mat)
}

