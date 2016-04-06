//: Playground - noun: a place where people can play

import UIKit

var str = "Romildo"

var str1 = "Hello " + str


for i in str1.characters {
    print(i)
}

// Converter String to NSString
var newTypeString = NSString(string: str1)

newTypeString.substringFromIndex(5)

newTypeString.substringToIndex(5)

newTypeString.substringWithRange(NSRange(location: 3, length: 5))

if newTypeString.containsString("ildo") {
    print("SIM")
}else {
    print("Não")
}

newTypeString.componentsSeparatedByString(" ")

newTypeString.lowercaseString

newTypeString.uppercaseString







