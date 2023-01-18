let INF = 1_234_567_890
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var coins: [Int] = []
for _ in 0..<n { coins.append(Int(readLine()!)!) }

var cache = [Int](repeating: INF, count: m + 1)
cache[0] = 0

for coin in coins where coin <= m {
    for i in coin...m {
        if cache[i - coin] != INF {
            cache[i] = min(cache[i - coin] + 1, cache[i])
        }
    }
}

cache[m] == INF ? print(-1) : print(cache[m])
