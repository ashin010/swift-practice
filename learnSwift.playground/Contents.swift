import UIKit
import Darwin

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
