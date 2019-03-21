//: Playground - noun: a place where people can play

import UIKit
import Foundation


var checkString: String

// Reminder
// These are normal variables which are neither constant nor optionals
checkString = "checkString"
checkString = "checkString 2"
//endOfReminder

enum LevelOfPosition {
    case noChangeOfPosition
    case changeOfPositionToValley
    case changeOfPositionToMountain
    case changeOfPosition
}


var stackString: String = "S"

func push(value: Character) {
    // Reminder
    //value = "newValue"    // Error since a argument variable inside function is a let constant
    //endOfReminder
    stackString.append(value)
}


func check() -> LevelOfPosition {
    if stackString.count <= 2 {
        return .noChangeOfPosition;
    }
    if stackString[stackString.index(before: stackString.endIndex)] == "U" && stackString[stackString.index(stackString.endIndex, offsetBy: -2)] != "U"  {
        if stackString[stackString.index(stackString.endIndex, offsetBy: -3)] == "S" {
            return .changeOfPositionToValley
        } else {
            return .changeOfPosition
        }
    }
    else if stackString[stackString.index(before: stackString.endIndex)] == "D" && stackString[stackString.index(stackString.endIndex, offsetBy: -2)] != "D" {
        return .changeOfPosition;
    }
    else {
        return .noChangeOfPosition
    }
}

func pop() {
    let range = stackString.index(stackString.endIndex, offsetBy: -2)..<stackString.endIndex
    stackString.removeSubrange(range)
}

func countingValleys(n: Int, seq: String) -> Int? {
    stackString = "S"
    var countOfNoOfValley: Int = 0;
    print(seq)
    for i in 0..<n {
        push(value: seq[seq.index(seq.startIndex, offsetBy: i)])
        let checkValue = check()
        if checkValue == .changeOfPositionToValley {
            countOfNoOfValley += 1
        }
        if checkValue == .changeOfPositionToValley || checkValue == .changeOfPosition || checkValue == .changeOfPositionToMountain {
            pop()
        }
    }
    return countOfNoOfValley
}

var ansCountOfNoOfValley = countingValleys(n: 6, seq: "DUDUDU")
print("\(ansCountOfNoOfValley!)")
