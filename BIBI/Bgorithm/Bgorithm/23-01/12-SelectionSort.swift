//
//  12-SelectionSort.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/16.
//

/// 알고리즘 - 선택 정렬 / 두 배열의 원소 교체
/// 풀이 : https://zrr.kr/F37l

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

// 선택 정렬 - 문제풀이
func selectionSort(_ array: inout [Int], _ oper: String) {
    if (oper == "<") || (oper == "") { // 오름차순
        for i in 0..<array.count {
            var minIndex = i
            for j in i+1..<array.count {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                array.swapAt(i, minIndex)
            }
        }
    } else if oper == ">" { // 내림차순
        for i in 0..<array.count {
            var minIndex = i
            for j in i+1..<array.count {
                if array[j] > array[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                array.swapAt(i, minIndex)
            }
        }
    }
}

selectionSort(&a, "<")
selectionSort(&b, ">")
print("답 : \(exchange(&a, &b, k).reduce(0, +))")
