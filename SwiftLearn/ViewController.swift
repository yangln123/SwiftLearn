//
//  ViewController.swift
//  SwiftLearn
//
//  Created by yangln on 2020/8/21.
//  Copyright © 2020 yangln. All rights reserved.
//

import UIKit

enum RequestType {
    case Get
    case Post
    case Put
    case Delete
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        let str = "字符串"
        print(str)
        let num:Int = 100
        print(num)
        
        var num1:Int
        num1 = 10
        print(num1)
        
        let httpError = (404, "网页不存在1")
        print(httpError.0, httpError.1)
        
        let httpError1 = (code:404, str:"网页不存在2")
        print(httpError1.code, httpError1.str)
        
        let (code, string) = (404, "网页不存在3")
        print(code, string)
        
        let (code1, _) = (404, "网页不存在3")
        print(code1)
        
        
        var age = 30
        if age == 30 {
            print("my age is \(age)")
        }
        while age <= 35 {
            age += 1
        }
        
        var count = 0
        while count <= 5 {
            print("num is \(count)")
            count += 1
        }
        
        for num in 1...10 {
            print(num)
        }
        
        for var num11 in 1...10 {
            num11 += 10
            print(num11)
        }
        
        let arr = ["my", "name", "is", "Swift"]
        for str1 in arr {
            print(str1)
        }
        for str2 in arr[2...] {
            print(str2)
        }
        
        //从50开始，每次循环加10，小于100
        let number = 10
        for num2 in stride(from: 50, to: 100, by: number) {
            print(num2)
        }
        
        enum Answer {case right, wrong}
        let answer = Answer.right
        switch answer {
        case .right:
            print("right")
        case .wrong:
            print("wrong")
        }
        
        let name = "name"
        switch name {
        case "name", "your":
            print("name/your")
        default:
            break
        }
        //区间匹配
        let count_num = 29
        switch count_num {
        case 1...10:
            print("1...10")
        case 11...20:
            print("11...20")
        case 21..<30:
            print("21..<30")
        case 30...:
            print(count_num)
        default:
            break
        }
        
        // 值绑定
        let point1 = (1, 10)
        switch point1 {
        case (let x, 0):
            print("the origin is\(x)")
        case (let x, let y):
            print("x is \(x), y is \(y)")
        case let (x, y):
            print("xxxx is \(x), yyyy is \(y)")
        default:
            print("outside of the box")
        }
        
        for num11 in 1 ... 100 where num11 % 10 == 0 {
            print(num11)
        }
        
        // switch
        let point2 = (1, 2)
        switch point2 {
        case let (x, y) where x == y:
            print("x is \(x) y is \(y)")
        case let (x, y) where x != y:
            print("xx is \(x) yy is \(y)")
        default:
            break
        }
        
        print(greet(person: "yi"))
        print("sum", sum(v1: 2, v2: 3))
        print("sum", sum(2, 3))
        print(caculator(v1: 5, v2: 2))
        
        gotowork(atqqq: "8:00")
        gotowork1(time: "9:00")
        
        var v1 = 10
        var v2 = 20
        swapeValue(v1: &v1, v2: &v2)
        print(v1, v2)
        
        // 原始值,不写默认是枚举值
        enum Grade: String {
            case perfect = "A"
            case great = "B"
            case good = "C"
            case bad = "D"
        }
        print(Grade.perfect)
        print(Grade.perfect.rawValue)
        
        //如果枚举的原始值类型是Int、String，Swift会自动分配原始值
        enum Season : Int {
            case spring, summer, autumn, winter
        }
        print(Season.spring)
        print(Season.spring.rawValue)
        
        //MemoryLayout获取数据类型占用的内存大小
        enum Password {
            case number(Int, Int, Int, Int)
            case other
        }
        
        print(MemoryLayout<Password>.stride)//分配占用的空间大小
        print(MemoryLayout<Password>.size)//实际用到的空间大小
        print(MemoryLayout<Password>.alignment)//对齐参数
        
        var a1: Int? = 10
        var b: Int = a1 ?? 1
        
        let array = NSMutableArray()
        array.add(1)
        
        
        arrayFunc()
        dictFunc()
        setFunc()
        tupleFunc()
        stringFunc()
        copyFunc()
        closureFunc()
    }
}


// MARK: function
func greet(person: String) -> String {
    let greeting = "hello " + person + " !"
    return greeting
}

func sum(_ v1: Int, _ v2: Int) -> Int {//隐式返回
    v1 + v2
}

func sum(v1: Int, v2: Int) -> Int {//隐式返回
    v1 + v2
}

func caculator(v1: Int, v2: Int) -> (sum: Int, average: Double, substract: Int) {
    let sum = v1 + v2
    let average = Double(sum) / 2
    let substract = v1 - v2
    return (sum, average, substract)
}

func gotowork(atqqq time: String) {//atqqq为参数标签
    print("this time is \(time)")
}

func gotowork1(time: String) {
    print("this time is \(time)")
}

func swapeValue(v1: inout Int, v2: inout Int) {
    let temp = v1
    v1 = v2
    v2 = temp
}

func arrayFunc() {
    print("Array Example")
    
//    let array1 = [2, 3, 4, 5, 6]
//    let array2 = [3, 6, 7]
//    var array3 = array1 + array2
//    array3.append(9)
//
//    print(array3)
    
    
//    var array0 = [Int]()
    var array1 :[Int] = [1, 3, 5, 7, 9]
    var array3 :Array<Int> = array1

    array1.append(1)
    array1.insert(0, at: 0)
    if array1.isEmpty {
        print("Empty")
    }
    else {
        print(array1.count)
        array1 += [2, 5, 4, 1]
        print(array1)
        array1[1] = 10
        print(array1)
        print(array1[0])
        for (index, value) in array1.enumerated() {
            print(index, value)
        }
    }
}

func dictFunc() {
    print("Dictionary Example")
    var dict1 = ["key1" : 1, "key2" : 2, "key3" : 3, "key4" : 4]
    let dict2: Dictionary<String, Int> = dict1
    let dict3: [String: Int] = dict1
    print(dict1)
    print(dict2)
    print(dict3)
    
    dict1["key3"] = 4
    dict1["key2"] = nil
    print(dict1)
    
    for (key, value) in dict1 {
        print("\(key)=\(value)")
    }
    //常量数组或字典编译器会对其进行优化，所以尽量把不可变的数组定义为常量数组
}

func setFunc() {//Set集合用于存放无序不重复的对象，用法与数组类似，重复的项会被忽略
    print("Set Example")
    var s1: Set<Int> = [1, 2, 3, 4, 2, 5, 7, 3]
    print(s1)
    s1.insert(9)
    print(s1)
    print("\(s1.contains(3))")
    
    let s2: Set = [1, 3, 5, 7, 9]
    let s3: Set = [0, 2, 4, 6, 8]
    let s4: Set = [2, 3, 5, 7]
    //合操作
    print(s2.union(s3).sorted())
    //交操作
    print(s2.intersection(s3).sorted())
    //减操作
    print(s2.subtracting(s4).sorted())
    //不重叠集合(过滤掉重复元素)
    print(s2.symmetricDifference(s4).sorted())
    for (value) in s4.enumerated() {
        print(value)
    }
}

func tupleFunc() {
    let httpError = (404, "Error")
    let point = (10, 20)
    let (x, y) = point
    print(x, y)
    print(httpError.0, httpError.1)
    
    let httpError2 = (code:404, message:"Error")
    print(httpError2.code, httpError2.message)
}

func stringFunc() {
    //与NSString不同，声明不需要@前缀，支持转译字符
    let name1 = "bamboo\n"
    //空串
    let name2 = ""
    let name3 = String()
    //字符串由字符Character组成，定义字符
    let character1: Character = "!"
    //属性
    print(name1.isEmpty, name2.isEmpty, name3.isEmpty)
    print(name1.count, name1.lowercased(), name1.uppercased())
    print(name1.hasPrefix("ba"), name1.hasSuffix("\n"))
    //加法运算
    let name4 = "hello" + name1
    print(name4)
    //比较（比较值，不是地址）
    let name5 = "ba" + "mboo\n"
    print(name1 == name5)
    //插值
    let name6 = "I am \(name1)"
    print(name6)
    //格式化字符串
    let f = 12.332323
    let s = String(format: "%.2f", f)
    print(s)
}

func copyFunc() {
    var dict1 = ["a" : 1, "b" : 2]
    var dict2 = dict1
    print(dict1 == dict2)
    dict2["a"] = 1
    print(dict1 == dict2)
    dict2["a"] = 2
    print(dict1 == dict2)
    
    var array1 = [1, 2]
    var array2 = array1
    print(array1 == array2)
    array2[0] = 1
    print(array1 == array2)
    array2[0] = 3
    print(array2 == array1)
}

func canChooseTypeFunc() {
    var obj1: NSObject?
    obj1 = NSObject()
    obj1 = "1111" as NSObject
    obj1 = nil
    
    var obj2 = NSObject()
    obj2 = 1 as NSObject
    
    
    var a: Int?
    var b: Int?
    a = 1
    b = 2
    let c = a! + b!
    print(c)
    
    
    outerLoop1: for i in 1...10 {
        outerLoop2: for j in 1...10 {
            outerLoop3: for k in 1...10 {
                if j > 5 {
                    break//退出outerLoop3
//                    break outerLoop2//退出outerLoop2
//                    break outerLoop1//退出outerLoop1
                    
                }
            }
        }
    }
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }

    print(add(a: 2, b: 3))
}

func closureFunc() {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    //函数作为变量
    let someFunc:(Int, Int) -> Int = add
    print(someFunc(10, 20))
    
    //函数作为参数
    func logAdd(a: Int, b: Int, function:(Int, Int) -> Int) {
        print("begin")
        print(function(a, b))
        print("end")
    }
    logAdd(a: 10, b: 20, function: add)
    
    //函数作为返回值（包装一个函数，在执行前后输出信息），函数作为参数又作为返回值
    func addWrapper(addFunc:@escaping (Int, Int) -> Int) -> ((Int, Int) -> Int) {
        // 函数内容
        func wrapper(a: Int, b: Int) -> Int {
            print("begin")
            let res = addFunc(a, b)
            print("end")
            return res
        }
        return wrapper
    }
    let newAdd = addWrapper(addFunc: add)
    print(newAdd(12, 32))
    
}

class Person {                      // 默认为internal
    public var age: Int = 0         // 为public，比类访问级别高，会有警告
    private var gender: Int = 10
    private func sayHello() {
          print("hello")
    }
}

public class PrivatePerson {
    private var age: Int = 0
    var gender: Int = 10          // 报警告

    private func sayHello() {

    }
}

public class Test {
    public func test(person:PrivatePerson) {    //若PrivatePerson为private则报编译错误：这里参数访问级别为private，所以函数访问级别不能高于private，则只能为private
    }
}



