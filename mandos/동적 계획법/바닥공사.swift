// Top Down
let n = Int(readLine()!)!
let MOD = 796_796
var cache = [Int](repeating: 0, count: n + 1)
cache[1] = 1
cache[2] = 3

@discardableResult
func tileFill(n: Int) -> Int {
    if n == 1 || n == 2 {
        return cache[n]
    }
    
    if cache[n] != 0 {
        return cache[n]
    }
    
    cache[n] = tileFill(n: n - 1) + tileFill(n: n - 2) * 2
    cache[n] %= MOD
    return cache[n]
}

tileFill(n: n)

print(cache[n])

// Bottom Up
let n = Int(readLine()!)!
let MOD = 796_796
var cache = [Int](repeating: 0, count: n + 1)
cache[1] = 1
cache[2] = 3

@discardableResult
func tileFill(n: Int) -> Int {
    if n == 1 || n == 2 {
        return cache[n]
    }
    
    if cache[n] != 0 {
        return cache[n]
    }
    
    cache[n] = tileFill(n: n - 1) + tileFill(n: n - 2) * 2
    cache[n] %= MOD
    return cache[n]
}

tileFill(n: n)

print(cache[n])

