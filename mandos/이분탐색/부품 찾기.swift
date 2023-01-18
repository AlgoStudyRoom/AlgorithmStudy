let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let m = Int(readLine()!)!
let x = readLine()!.split(separator: " ").map { Int($0)! }

func binarySearch(target: Int) -> Bool {
    var start = 0
    var end = n - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == target {
            return true
        }
        
        if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return false
}

for x in x {
    binarySearch(target: x) ? print("yes", terminator: " ") : print("no", terminator: " ")
}

