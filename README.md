# Swenson-He-Challenge
IOS Engineer Challenge



## Questions
## I. Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions true. You can use any parentheses you’d like.
( 3% (1+3) +9)

## II. Write a function/method utilizing Swift to determine whether two strings are anagrams or not (examples of anagrams: debit card/bad credit, punishments/nine thumps, etc.)
```
  func areAnagrams(str1: String, str2: String) -> Bool {
        guard str1.count > 0 && str2.count > 0 else { return false }
        
        // make a lower-case character array to compare
        let chArr1 = Array(str1.lowercased())
        let chArr2 = Array(str2.lowercased())
        
        if (chArr1 == chArr2) {
            return false
        }
        let sorted1 = chArr1.sorted()
        let sorted2 = chArr2.sorted()
        
        if sorted1 == sorted2 {
            return true
        }
    }
```
## III. Write a method in Swift to generate the nth Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34)

## A.recursive approach
```
 func generateFib (n: Int) -> [Int]  {
        guard n > 1 else { return [] }
        var fibonacciArray = [Int]()
        for n in 0 ... n {

            if n == 0 {
                fibonacciArray.append(0)
            }
            else if n == 1 {
                fibonacciArray.append(1)
            }
            else {
                fibonacciArray.append (fibonacciArray[n-1] + fibonacciArray[n-2] )
            }
        }
        return fibonacciArray
    }
```


## B.iterative approach

```
   func generateFib (_ n: Int) -> Int {
        guard n > 1 else {return n}
        return fib(n - 1) + fib(n - 2)
    }
```

## IV. Which architecture would you use for the required task below? Why?

Mvvm Because this was the required archetecture in this Challenge.
