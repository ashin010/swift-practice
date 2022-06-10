import UIKit
import Darwin
import Foundation

//下划线表示函数外部参数名 此处为省略写法
func join(_ string1: String, _ string2: String) -> String{
    string1 + string2
}

join("lo","ve")


class Animal {
    func move( ) -> String{
        "move"
    }
    
    func eat( ) -> String{
        "eat"
    }
}

class Bird:Animal {
    override func move() -> String {
        "fly"
    }
    
    override func eat() -> String {
        super.eat() + " bugs"
    }
}

let animal = Animal( )
animal.move()
animal.eat()

let bird = Bird()
bird.move()
bird.eat()

//协议 规定某些类型必须有哪些属性和方法
protocol flyable{
    func fly( ) -> String
}

extension Bird: flyable{
    func fly() -> String {
        move()
    }
}

class Airplane: flyable{
    func fly() -> String {
        "飞机飞行"
    }
}

let airplane = Airplane()
airplane.fly()



var array:[String] = ["A","B","c"]

var emptyArray :[Int] = []

var nums:[Int] = [34,56,78]
nums.append(96)
nums.insert(79, at: 4)
nums.isEmpty
nums.count

var sum = 0
for i in nums{
    sum += i
}
sum

protocol SomeProtocol {
    func sampleFunc()
    func secondFunc()
}


class SomeClass: SomeProtocol {
    func sampleFunc() {
        //
    }
    func secondFunc() {
        //
    }
}

extension SomeClass{
    func thirdFunc() {
        //
    }
}

// return 2nd highest from arr

func secondHighest(nums: [Int]) -> Int {

    var high1: Int = Int.min
    var high2: Int = Int.min

    guard nums.count > 2 else { return high1 }

    for num in nums {
        if (num > high1) {
            high2 = high1
            high1 = num
        } else if (num > high2) {
            high2 = num
        }
    }
    return high2
}

print(secondHighest(nums: [1,22,13,15,55,32,55]))


func secondGeneric<T:Numeric & Comparable >(nums: [T]) -> T {
    var high1:T = 0
    var high2:T = 0

    for num in nums {
        if (num > high1) {
            high2 = high1
            high1 = num
        } else if (num > high2) {
            high2 = num
        }
    }
    return high2
}
print(secondGeneric(nums: [1,22.7,13,15,55,32, 55.5]))

func Math(x: Int , y: Int) -> (plus: Int, minus: Int, multi: Int, divide: Double){
    return(x+y, x-y, x*y, Double(x/y))
}

let result = Math(x: 10, y: 20)
print("Plus = \(result.plus)")

print("minus = \(result.minus)")

print("Multi = \(result.multi)")

print("Devide = \(result.divide)")



var numbers = [5,2,3,4,1]

var mylist = numbers.map({num in num * num})
print(mylist)

mylist = numbers.sorted{$0 < $1}
print(mylist)


struct Expense {
    let name : String
    let type : String
    let amount : Int
}

var arr1 = [1,2,3]
var arr2 = [3,4,2]

let res = (arr1 + arr2).sorted {$0 < $1}
print(result)
