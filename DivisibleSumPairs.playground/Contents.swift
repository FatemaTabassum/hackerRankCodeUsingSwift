import Foundation

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    var countOfPair: Int = 0
    for i in 0..<(ar.count-1) {
        for j in i+1..<ar.count {
            if (ar[i] + ar[j]) % k == 0 {
                countOfPair += 1;
            }
        }
    }
    return countOfPair
    
}

