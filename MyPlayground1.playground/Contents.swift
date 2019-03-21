//: Playground - noun: a place where people can play

import UIKit

enum ProductError: Error, CustomStringConvertible {
    case InvalidProductID
    case InvalidProductPrice(Int)

    var description: String {
        switch self {
        case .InvalidProductID:
            return "Invalid product id"
        case .InvalidProductPrice(let productID):
            return "Invalid product price for product id :: \(productID)"
        default:
            return "Unable to catch any specific reason"
        }
    }
}

class Person {
    let name: String
    var surname: String = "Botre"
    var age: Int?

    required init(name: String) {
        self.name = name
    }

    convenience init(surname: String) {
        self.init(name: "Santosh")
        self.surname = surname
    }
}

class Employer: Person {

    init(nme: String) {
        super.init(name: nme)
    }

    required init(name: String) {
        super.init(name: name)
    }

    convenience init(nme: String, surname: String) {
        self.init(nme: nme)
        self.surname = surname
    }

}

class Product {
    let productID: Int?
    let productDescription: String?
    let productPrice: Double?

    init?(productID: Int, productDescription: String, productPrice: Double)  {
        if productID <= 0 {
            return nil
        }
        self.productID = productID
        self.productDescription = productDescription
        self.productPrice = productPrice
    }
}

do {
    let product = try Product(productID: 1, productDescription: "Television", productPrice: 5000.0)
    print(product)

} catch {
    print("Error: \(error)")
}


//let product = Product(productID: 0, productDescription: "Television", prodcutPrice: 45000.0)
//print(product?.productID)
//
//let p = Employer(nme: "Santosh")
//print(p.name)

///////////////////           GENERICS          //////////////////

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// inout lets persist the changes in the variables after the scope of function has ended

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles (_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: "Hello, World")
}

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[1]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print(bounds)
let nilbounds = minMax(array: [])
print(nilbounds)

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers[0..<numbers.count] {
        total += number
    }
    return total / Double(numbers.count)
}

func call() {
    print(arithmeticMean(1,2,3,4,5))
    print(arithmeticMean(3,8.25,18.75))
}
call()

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result is \(mathFunction(2,3))")

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil: items[items.count - 1]
    }
}

/* Stored Properties /
Stored Properties can be variable stored(var) or constant properties(let)

 */


struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems)

/*
 You must always declare a lazy property as a variable
*/

import UIKit

enum Failure: Error {
    case badNetwork(message:String)
    case broken
}
func fetchRemote() throws -> String {
    // Complicated, failable work here
    throw Failure.badNetwork(message: "Firewall error.")
}
func fetChLocal() -> String {
    // This won't throw
    return "Taylor"
}

func fetchUserData(using closure: () throws -> String)
    throws {
        let userData = try closure()
        print("User data recieved: \(userData)")
}

do {
    try fetchUserData(using: fetChLocal)
} catch Failure.badNetwork(let message) {
    print(message)
} catch {
    print("Fetch error")
}


//Swift Optional Testing

var x: String? = "My name is"

if let y = x {
    print(y)
    print(type(of: x))
}

enum Optional<Wrapped> {
    
    /// The absence of a value
    case none
    
    // The presence of a value, stored as 'Wrapped'
    case some(Wrapped)
}

// OpenACC for Programmers concepts and strategies//

var HEIGHT: Int = 10
let WEIGHT: Int = 10

var Temperature_previous: [[Int]]
var Temperature: [[Int]]

for i in 1..<(HEIGHT+1) {
    for j in 1..<(WEIGHT+1) {
        Temperature[i][j] = 0.25 * (Temperature_previous[i+1][j]
                                    + Temperature_previous[i-1][j]
                                    + Temperature_previous[i][j+1]
                                    + Temperature_previous[i][j-1])
    }
}




