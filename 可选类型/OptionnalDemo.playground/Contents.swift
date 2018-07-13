//: Playground - noun: a place where people can play

import UIKit
import Foundation

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号”


struct Person {
    var name: String?
    var nickName: String?
    var home: Home?
    var pets: [Pet]?
}

struct Home {
    var address: String?
    var treasure: Float?
    
    func treasureDecription() -> String? {
        if (treasure != nil) {
            return "the treausure is \(treasure ?? 0)"
        }
        return nil
    }
}
struct Pet {
    var name: String?
}

//定义可选模型
var jack: Person = Person()
jack.name = "jack"
var home = Home()
jack.home = home

//可选链式调用访问属性
jack.home?.address = "北京市朝阳区百子湾国际2号"
jack.home?.treasure = 100000000

//可选链式调用访问方法
if  let name = jack.name, jack.home?.treasureDecription() != nil{
    print(name + " has a lagre of money")
}

//可选链式调用访问下标
var p1 = Pet()
p1.name = "mick"
var p2 = Pet()
p2.name = "soso"
jack.pets = [p1,p2]
if let jackPetName = jack.pets?[0].name {
    print("jack has a pet whick name is ",jackPetName)
}

//多层可选链式调用
if let jackHomeAddress = jack.home?.address?.hasPrefix("北京") {
    print(jackHomeAddress)
}

//方法可选返回值上进行可选链式调用

if let has = jack.home?.treasureDecription()?.hasPrefix("the") {
    print("jack is rich")
}else{
    print("jack has no money")
}




extension Dictionary {
    func valuesForKeys(keys: [Key]) -> [Value?] {
        return keys.map { self[$0] }
    }
    
    func valuesForKeys(keys: [Key], notFoundMarker: Value) -> [Value] {
        return self.valuesForKeys(keys: keys).map { $0 ?? notFoundMarker }
    }
}

let dict = ["A": "Amir", "B": "Bertha", "C": "Ching"]
dict.valuesForKeys(keys: ["B","1"], notFoundMarker: "NULL")

