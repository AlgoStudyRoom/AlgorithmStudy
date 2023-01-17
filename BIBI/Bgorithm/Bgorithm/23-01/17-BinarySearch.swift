//
//  17-BinarySearch.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/17.
//

/// 알고리즘 - 이진탐색 & 파라메트릭 서치 / 떡볶이 떡 만들기
/// 풀이 : https://zrr.kr/71JM

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, target) = (input[0], input[1]) // 떡 개수 : n, 요청한 길이 : m
let array = readLine()!.split(separator: " ").map { Int(String($0))! }

print(parametricSearch(array, target))

func parametricSearch(_ array: [Int], _ target: Int) -> Int {
    var result = 0
    var start = 0
    var end = array.max()!
    
    while start <= end {
        var total = 0
        let mid = (start + end) / 2
        
        for ddeok in array {
            if ddeok > mid { // 떡이 지금 자를 높이보다 크다면
                total += ddeok - mid // 잘라진 떡을 누적한다
            }
        }
        if total < target {     // 누적된 떡의 양이 부족하다면
            end = mid - 1       // 높이를 더 낮게 설정한다 (떡이 더 많이 잘리도록)
        } else {                // 누적된 떡의 양이 충분하다면
            result = mid        // 결과를 초기화하고 (최적해)
            start = mid + 1     // 높이를 더 높게 설정한다 (떡이 덜 잘리도록)
        }
    }
    return result
}
