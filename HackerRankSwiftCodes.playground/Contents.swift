//: Playground - noun: a place where people can play

import UIKit
import Foundation


var checkString: String

// Reminder
// These are normal variables which are neither constant nor optionals
checkString = "checkString"
checkString = "checkString 2"
//endOfReminder


var stackString: String = "S"

func push(value: Character) {
    // Reminder
    //value = "newValue"    // Error since a argument variable inside function is a let constant
    //endOfReminder
    stackString.append(value)
    print("inside push \(stackString)")
    
}


func check() -> Int {
    if stackString.count <= 2 {
        return 0;
    }
    if stackString[stackString.index(before: stackString.endIndex)] == "U" && stackString[stackString.index(stackString.endIndex, offsetBy: -2)] != "U"  {
        if stackString[stackString.index(stackString.endIndex, offsetBy: -3)] == "S" {
            return 1
        } else {
            return 2
        }
    }
    else if stackString[stackString.index(before: stackString.endIndex)] == "D" && stackString[stackString.index(stackString.endIndex, offsetBy: -2)] != "D" {
        return 2;
    }
    else {
        return 0
    }
}

func pop() {
    let range = stackString.index(stackString.endIndex, offsetBy: -2)..<stackString.endIndex
    stackString.removeSubrange(range)
}

func countingValleys(n: Int, seq: String) -> Int? {
    stackString = "S"
    var count: Int = 0;
    print(seq)
    for i in 0..<n {
        push(value: seq[seq.index(seq.startIndex, offsetBy: i)])
        let checkValue = check()
        if checkValue == 1 {
            count += 1
        }
        if checkValue == 1 || checkValue == 2 {
            pop()
        }
        print("ffin \(seq[seq.index(seq.startIndex, offsetBy: i)])")
    }
    print("valleys count = \(count)")
    return 0
}

var ans: Int? = countingValleys(n: 6, seq: "DUDUDU")
