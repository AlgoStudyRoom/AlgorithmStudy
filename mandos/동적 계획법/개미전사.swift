// Top Down
let n = Int(readLine()!)!
let array = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var cache = [Int](repeating: 0, count: n + 1)
cache[1] = array[1]
cache[2] = max(array[1], array[2])

@discardableResult
func selectSugar(n: Int) -> Int {
    if n == 1 || n == 2 {
        return cache[n]
    }
    
    if cache[n] != 0 {
        return cache[n]
    }
    
    cache[n] = max(selectSugar(n: n - 1), selectSugar(n: n - 2) + array[n])
    
    return cache[n]
}

selectSugar(n: n)

print(cache[n])

// Bottom Up
let n = Int(readLine()!)!
let array = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var cache = [Int](repeating: 0, count: n + 1)
cache[1] = array[1]
cache[2] = max(array[1], array[2])

@discardableResult
func selectSugar(n: Int) -> Int {
    if n == 1 || n == 2 {
        return cache[n]
    }
    
    if cache[n] != 0 {
        return cache[n]
    }
    
    cache[n] = max(selectSugar(n: n - 1), selectSugar(n: n - 2) + array[n])
    
    return cache[n]
}

selectSugar(n: n)

print(cache[n])

