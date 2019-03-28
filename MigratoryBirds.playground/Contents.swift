//: Playground - noun: a place where people can play

func migratoryBirds(arr: [Int]) -> Int {
    var countSighting: [Int : Int] = [1:0,2:0,3:0,4:0,5:0]
    var maxFreqCount: Int = -1
    var minFreqNumber: Int = 10
    for i in 0..<arr.count {
        countSighting[arr[i]]? += 1
        if maxFreqCount < countSighting[arr[i]]! {
            maxFreqCount = countSighting[arr[i]]!
            minFreqNumber = arr[i]
        } else if maxFreqCount == countSighting[arr[i]]! {
            if minFreqNumber > arr[i] {
                minFreqNumber = arr[i]
            }
        }
    }
    return minFreqNumber
}

var ans: Int = migratoryBirds(arr: [3,2,2,5,1,5,5,5,5,5,3,3,3,3,3,3])


