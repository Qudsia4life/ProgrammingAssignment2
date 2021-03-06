## Caching the Inverse Matrix:
## Below are a pair of functions that are used to creat a special object that
##Stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix(x=matrix()){                             ##define the arguments with default mode of "matrix"
    inv<-NULL                                            ##initialize inv as NULL;will hold value of matrix inverse
    set<-function(y){                                    ##define the set function to assign new
    
         x<<-y                                         ##value of matrix in parent environment
       inv<<-NULL                                      ##if there is a new matrix, reset inv NULL
  }
             get<-function()x                          ##define the get function 
          
      setInverse<- function(Inverse)inv<<-Inverse      ##assign value of inv in parent environment
      getInverse<-function()inv                        ## get the value of inv where called
      list(set = set, get = get, setInverse = setInverse,
         getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" created by
## makeCacheMatrix above.If the inverse has already been calculated (and
## the matrix has not changed),then it should retrieve the inverse from the
## cache.
##CacheSolve will retrieve the inverse from the Cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
           inv<-x$getInverse()
           
             if(!is.null(inv)){
                  massage("getting cached data")
                   return(inv)
             
         }
             mat<-x$get()
             inv<-solve(mat, ...)
             x$setInverse(inv)
             inv
}
