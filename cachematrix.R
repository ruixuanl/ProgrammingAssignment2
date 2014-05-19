## [Put comments here that describe what your functions do]
install.packages("MASS")
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
    library(MASS)
    m<-NULL
    set<-function(y) {
        x<<- y
        m<<- NULL
    }
    get<-function() x
    setInv<- function (ginv) m <<- ginv
    getInv<- function() m
    list(set=set,get=get,setInv=setInv,getInv=getInv)
}


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m<- x$getInv()
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data<- x$get()
    library(MASS)
    m<- ginv(data, ...)
    x$setInv(m)
    m
       
}
