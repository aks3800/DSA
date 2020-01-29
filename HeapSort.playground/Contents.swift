func getParentIndex(ofElement i: Int) -> Int {
    return (i - 1) / 2
}

func getLeftChildIndex(ofElement i: Int) -> Int {
    return (2 * i) + 1
}

func getRightChildIndex(ofElement i: Int) -> Int {
    return (2 * i) + 2
}

func swapElementsOfArray(array: inout [Int], index1: Int, index2: Int) {
    let temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
}

func printArray(array: [Int]) {
    for item in array {
        print("\(item) ", terminator: "")
    }
    print()
}

func maxHeapify(array: inout [Int], index: Int) {
    printArray(array: array)
    let leftIndex: Int = getLeftChildIndex(ofElement: index)
    let rightIndex: Int = getRightChildIndex(ofElement: index)
    var largest: Int
    if leftIndex < array.count && array[leftIndex] > array[index] {
        largest = leftIndex
    } else {
        largest = index
    }
    if rightIndex < array.count && array[rightIndex] > array[largest] {
        largest = rightIndex
    }
    if largest != index {
        swapElementsOfArray(array: &array, index1: index, index2: largest)
        maxHeapify(array: &array, index: largest)
    }
}


func buildMaxHeap(array: inout [Int]) {
    
    for i in stride(from: array.count / 2 - 1, through: 0, by: -1) {
        maxHeapify(array: &array, index: i)
    }
    
}


var array = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]


buildMaxHeap(array: &array)

printArray(array: array)
