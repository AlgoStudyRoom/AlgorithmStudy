let INF = 1_234_567_890

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

for i in 1...n {
    graph[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    graph[a][b] = 1
    graph[b][a] = 1
}

let xk = readLine()!.split(separator: " ").map { Int($0)! }
let x = xk[0], k = xk[1]

for k in 1...n {
    for a in 1...n {
        for b in 1...n {
            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
        }
    }
}

let distance = graph[1][k] + graph[k][x]

if distance >= INF {
    print(-1)
} else {
    print(distance)
}

