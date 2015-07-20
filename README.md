# RProgrammingWK3
Contains code submitted for the R Programming Course Week 3

Sample results: sorry about the proportional spacing

> mat <- makeCacheMatrix((matrix(c(1:3,5,5:9),3,3)))  
> mat$get()  
     [,1] [,2] [,3]  
[1,]    1    5    7  
[2,]    2    5    8  
[3,]    3    6    9  

> matinv <- cacheSolve(mat)  
> matinv  
     [,1] [,2]       [,3]  
[1,] -0.5 -0.5  0.8333333  
[2,]  1.0 -2.0  1.0000000  
[3,] -0.5  1.5 -0.8333333  

> matinv2 <- cacheSolve(mat)  
Inverse retrieved from cache  
> matinv2  
     [,1] [,2]       [,3]  
[1,] -0.5 -0.5  0.8333333  
[2,]  1.0 -2.0  1.0000000  
[3,] -0.5  1.5 -0.8333333  

> mat$get()%*%matinv2  
     [,1] [,2] [,3]  
[1,]  1.000000e+00    0    0  
[2,] -4.440892e-16    1    0  
[3,]  0.000000e+00    0    1  
> 
