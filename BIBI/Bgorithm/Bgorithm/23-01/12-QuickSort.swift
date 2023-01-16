//
//  12-QuickSort.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/16.
//

import Foundation

/// 알고리즘 - 선택 정렬 / 두 배열의 원소 교체
/// 풀이 : https://zrr.kr/aBEo

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

// 퀵 정렬 - 문제풀이
func ascendingQuickSort(_ array: inout [Int], start: Int, end: Int) { // 오름차순
    if start >= end { return }
    
    let pivot = start
    var left = start + 1
    var right = end
    
    while left <= right {
        while (left <= end) && (array[left] <= array[pivot]) {
            left += 1
        }
        while (right > start) && (array[right] >= array[pivot]) {
            right -= 1
        }
        if left > right {
            array.swapAt(right, pivot)
        } else {
            array.swapAt(left, right)
        }
        ascendingQuickSort(&array, start: start, end: right - 1)
        ascendingQuickSort(&array, start: right + 1, end: end)
    }
}

func descendingQuickSort(_ array: inout [Int], start: Int, end: Int) { // 내림차순
    if start >= end { return }
    
    let pivot = start
    var left = start + 1
    var right = end
    
    while left <= right {
        while (left <= end) && (array[left] >= array[pivot]) {
            left += 1
        }
        while (right > start) && (array[right] <= array[pivot]) {
            right -= 1
        }
        if left > right {
            array.swapAt(right, pivot)
        } else {
            array.swapAt(left, right)
        }
        descendingQuickSort(&array, start: start, end: right - 1)
        descendingQuickSort(&array, start: right + 1, end: end)
    }
}

ascendingQuickSort(&a, start: 0, end: a.count - 1)
descendingQuickSort(&b, start: 0, end: b.count - 1)
print("답 : \(exchange(&a, &b, k).reduce(0, +))")

/* ======================================================================= */

// 퀵 정렬 - 기본
func quickSort(_ array: inout [Int], low: Int, high: Int) {
    if low < high {
        let pivot = partition(&array, low: low, high: high)
        quickSort(&array, low: low, high: pivot)
        quickSort(&array, low: pivot + 1, high: high)
    }
}

func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
    let pivot = array[low]
    var i = low - 1
    var j = high + 1
    while true {
        repeat { i += 1 } while array[i] < pivot
        repeat { j -= 1 } while array[j] > pivot
        if i >= j { return j }
        array.swapAt(i, j)
    }
}
