# Insertion Sort 특징
두번째 인덱스부터 탐색을 시작하여 현재 값보다 바로 이전의 값을 먼저 비교하는 방식으로 진행된다.
오름차순으로 정렬한다고 가정했을 때, 이전의 값이 내 값보다 큰 경우 Swap 한다.
두 번째 탐색을 마친 후 세번째 값 부터는 앞의 두 값을 모두 비교한다.
구현하기는 쉽고 선택 정렬이나 버블 정렬보다는 빠르지만 여전히 비효율적인 정렬 방식이다.

# 진행 순서
// 0. 이 배열을 가지고 오름 차순을 한다고 가정해보자
var arr = [4, 2, 3, 1]

// 1. 2번째 인덱스인 [2]부터 탐색을 시작한다.
[4, [2], 3, 1]
idx : 1 = 2 // 현재 값
idx : 0 = 4 // idx - 1
이전의 값이 더 크기 때문에 swap한다.

결과: [2, 4, 3, 1]

// 2. 위 결과값을 가지고 3번째 인덱스인 [3]의 탐색을 시작한다.
[2, 4, [3], 1]
idx : 2 = 3 // 현재 값
idx : 1 = 4 // idx - 1
마찬가지로 앞의 값이 더 크기 때문에 swap한다.

결과: [2, [3], 4, 1]

아직 [3]의 탐색은 끝나지 않았기 때문에 이전 값인 2와 비교를 진행한다.
[2, [3], 4, 1]
idx : 1 = 3 // 현재 값
idx : 0 = 2 // 이번 탐색을 시작했던 idx - 2
이전 값이 나보다 작기 때문에 이동하지 않고 종료한다. (오름차순 완성)
결과: [2, 3, 4, 1]

// 3. 위 결과값을 가지고 4번째 인덱스인 [1]의 탐색을 시작한다.
[2, 3, 4, [1]]
idx : 4 = 1 // 현재 값
idx : 3 = 4 // idx - 1
앞의 값이 더 크기 때문에 swap한다.

결과: [2, 3, [1], 4]

위 결과에서 또 그 이전 값들을 차례로 모두 비교한다.
3과 2는 모두 1보다 크기 때문에 차례대로 swap을 진행하면 최종 결과는 [1, 2, 3, 4]이 된다.


## 시간 복잡도
모두 정렬되어 있다면 이동하지 않고 비교만 진행하기 때문에 O(n)이지만
반대로 역순의 자료를 정렬한다면 모든 값을 비교&이동 하기 때문에 O(n^2)만큼 소요된다.

- 최선 : O(n)
- 평균 : O(n^2)
- 최악 : O(n^2)

## 공간 복잡도
- Inplace : True
- 공간복잡도 : O(n)

## Stable vs Unstable
- Insertion Sort는 크거나 작은 경우에만 이동하므로 Stable 하다