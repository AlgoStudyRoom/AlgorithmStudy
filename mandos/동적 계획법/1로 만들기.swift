// Top Down
let n = Int(readLine()!)!
let INF = 1_234_567_890
var cache = [Int](repeating: INF, count: n + 1)

func makeOne(n: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    if cache[n] != INF {
        return cache[n]
    }
    
    cache[n] = makeOne(n: n - 1) + 1
    
    if n % 2 == 0 {
        let temp = makeOne(n: n / 2) + 1
        cache[n] = min(temp, cache[n])
    }
    
    if n % 3 == 0 {
        let temp = makeOne(n: n / 3) + 1
        cache[n] = min(temp, cache[n])
    }
    
    if n % 5 == 0 {
        let temp = makeOne(n: n / 5) + 1
        cache[n] = min(temp, cache[n])
    }
    return cache[n]
}
print(cache[n])

// Bottom Up
let n = Int(readLine()!)!
let INF = 1_234_567_890
var cache = [Int](repeating: INF, count: n + 1)

func makeOne(n: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    if cache[n] != INF {
        return cache[n]
    }
    
    cache[n] = makeOne(n: n - 1) + 1
    
    if n % 2 == 0 {
        let temp = makeOne(n: n / 2) + 1
        cache[n] = min(temp, cache[n])
    }
    
    if n % 3 == 0 {
        let temp = makeOne(n: n / 3) + 1
        cache[n] = min(temp, cache[n])
    }
    
    if n % 5 == 0 {
        let temp = makeOne(n: n / 5) + 1
        cache[n] = min(temp, cache[n])
    }
    return cache[n]
}
print(cache[n])
