## Creates a list of getters and setters to allow the caching 
## of matrix inverses

## usage example: mat <- makeCacheMatrix((matrix(c(1:3,5,5:9),3,3))  


makeCacheMatrix <- function(x = matrix()) {
        
        inv <- NULL       # clear inverse matrix
        
        set <- function(y) {
                # Sets the value of the matrix and clears the cache
                # e.g mat$set(matrix(c(1:3,5,5:9),3,3)
                x <<- y
                inv <<- NULL
        }
        get <- function(){
                ## Returns the value of the matrix
                x
        }
        setinv <- function(inverse) {
                ## Stores the inverse of the matrix in the cache
                inv <<- inverse
        }
        getinv <- function(){
                ## Returns the value of the inverse from the cache
                inv
        }
        list(set = set,
             get = get,
             setinv = setinv,
             getinv = getinv)

}


## Calculates the inverse of the matrix created by makeCacheMatrix and
## caches the result in 'inv'.
## If the inverse has already been cached then that value is returned
## rather then recalculating the inverse.

## Usage example: matinv <- cacheSolve(mat)
## As a check:    mat$get()%*%matinv should return the identity matrix

cacheSolve <- function(x, ...) {

        inv <- x$getinv()       # Try to get the cached inverse
        
        if (!is.null(inv)) {    # inverse already cached
                message("Inverse retrieved from cache")
                return(inv)
        }
        
        matx <- x$get()         # get the matrix
        
        if (det(matx) == 0) {                              # If the determinant of the matrix 
                message("This matrix has no inverse")      # is zero then this is a singular
                return(NA)                                 # matrix with no inverse. 
        }                                                  # e.g. matrix(1:9,3,3)
        
        inv <- solve(matx,...)  # calculate the inverse
        x$setinv(inv)           # cache it
        inv                     # return the result
}
