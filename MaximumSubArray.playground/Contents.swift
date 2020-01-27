func findMaxCrossingSubArray(array: [Int], low: Int, mid: Int, high: Int) -> (Int, Int, Int) {
    
    var leftSum = -Int.max
    var sum = 0
    var maxLeft = mid
    for i in stride(from: mid, through: low, by: -1) {
        sum = sum + array[i]
        if sum > leftSum {
            leftSum = sum
            maxLeft = i
        }
    }
    var rightSum = -Int.max
    sum = 0
    var maxRight = mid + 1
    for i in mid+1...high {
        sum = sum + array[i]
        if sum > rightSum {
            rightSum = sum
            maxRight = i
        }
    }
    return (maxLeft: maxLeft, maxRight: maxRight, sum: leftSum + rightSum)
}

func findMaximumSubarray(array: [Int], low: Int, high: Int) -> (Int, Int, Int) {
    if high == low {
        return (low: low, high: high, maximumSum: array[low])
    } else {
        let mid: Int = (low + high) / 2
        let leftSubArray = findMaximumSubarray(array: array, low: low, high: mid)
        let rightSubArray = findMaximumSubarray(array: array, low: mid + 1, high: high)
        let crossSubArray = findMaxCrossingSubArray(array: array, low: low, mid: mid, high: high)
        
        if leftSubArray.2 > rightSubArray.2 && leftSubArray.2 > crossSubArray.2 {
            return (low: leftSubArray.0, high: leftSubArray.1, maximumSum: leftSubArray.2)
        } else if rightSubArray.2 > leftSubArray.2 && rightSubArray.2 > crossSubArray.2 {
            return (low: rightSubArray.0, high: rightSubArray.1, maximumSum: rightSubArray.2)
        } else {
            return (low: crossSubArray.0, high: crossSubArray.1, maximumSum: crossSubArray.2)
        }
    }
}

let array = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]

findMaximumSubarray(array: array, low: 0, high: array.count - 1)
