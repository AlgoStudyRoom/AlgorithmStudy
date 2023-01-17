//
//  12-Counting Sort.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/16.
//

/// 알고리즘 - 선택 정렬 / 두 배열의 원소 교체
/// 풀이 : https://zrr.kr/me2A

import Foundation

// 공통 input
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var b = readLine()!.split(separator: " ").map { Int(String($0))! }

// k번 바꾸기 연산 - 문제풀이 로직
func exchange(_ a: inout [Int], _ b: inout [Int], _ k: Int) -> [Int] {
    for i in 0 ..< k {
        if a[i] < b[i] {
            a[i] = b[i]
            b[i] = a[i]
        } else {
            break
        }
    }
    return a
}

// 계수 정렬 - 문제풀이

private func ascendingCountSort(_ array: inout [Int]) -> [Int] { // 오름차순
    let maxValue = array.max() ?? 0
    var countArray = [Int](repeating: 0, count: maxValue + 1)
    for value in array {
        countArray[value] += 1
    }
    var sortedArray = [Int]()
    for (index, count) in countArray.enumerated() {
        for _ in 0..<count {
            sortedArray.append(index)
        }
    }
    return sortedArray
}

private func descendingCountSort(_ array: inout [Int]) -> [Int] { // 내림차순
    let maxValue = array.max() ?? 0
    var countArray = [Int](repeating: 0, count: maxValue + 1)
    for value in array {
        countArray[value] += 1
    }
    var sortedArray = [Int]()
    for (index, count) in countArray.enumerated().reversed() {
        for _ in 0..<count {
            sortedArray.append(index)
        }
    }
    return sortedArray
}

a = ascendingCountSort(&a)
b = descendingCountSort(&b)
print("답 : \(exchange(&a, &b, k).reduce(0, +))")

/* ======================================================================= */

// 계수 정렬 - 기본
private func countSort(_ array: inout [Int]) -> [Int] {
    let maxValue = array.max() ?? 0
    var countArray = [Int](repeating: 0, count: maxValue + 1)
    for value in array {
        countArray[value] += 1
    }
    var sortedArray = [Int]()
    for (index, count) in countArray.enumerated() {
        for _ in 0..<count {
            sortedArray.append(index)
        }
    }
    return sortedArray
}
