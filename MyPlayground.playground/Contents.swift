//: Playground - noun: a place where people can play

import UIKit

/*let str = "Hello, playground"
 
 
 //Closures, Map, Filter and Reduce
 
 //Use map to loop over a collection and apply the same operation to each element in the collection
 var states = ["California", "New York", "Texas", "Alaska"]
 let abbreviatedStates = states.map({ (state: String) -> String in
 let index = state.index(state.startIndex, offsetBy: 2)
 return state.substring(to: index).uppercased()
 })
 
 print(abbreviatedStates)
 
 let values = [2.0,4.0,5.0,7.0]
 var squares: [Double] = []
 for value in values {
 squares.append(value*value)
 }
 print(squares)
 
 let newValues = [2.0,4.0,5.0,7.0]
 let newSquares = newValues.map {$0 * $0}
 print(newSquares)
 
 let closurValues = [2.0,4.0,5.0,7.0]
 let closurSquares2 = values.map({
 (value: Double) -> Double in
 return value * value
 })
 print(closurSquares2)
 
 let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
 let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }
 print(kmToPoint)
 
 
 //Use filter to loop over a collection and return an Array containing only those elements that match an include condition.
 
 let digits = [1,4,10,15]
 let even = digits.filter { $0 % 2 == 0 }
 print(even)
 
 //Use reduce to combine all items in a collection to create a single new value.
 
 let items = [2.0,4.0,5.0,7.0]
 let total = items.reduce(10.0,+)
 print(total)
 
 //Generics
 func exchange<T>( a: inout T, b: inout T) {
 let temp = a
 a = b
 b = temp
 }
 var numb1 = 100
 var numb2 = 200
 
 print("Before Swapping Int values are: \(numb1) and \(numb2)")
 exchange(a: &numb1, b: &numb2)
 print("After Swapping Int values are: \(numb1) and \(numb2)")
 
 var str1 = "Generics"
 var str2 = "Functions"
 
 print("Before Swapping String values are: \(str1) and \(str2)")
 exchange(a: &str1, b: &str2)
 print("After Swapping String values are: \(str1) and \(str2)")*/

//Approach 1
/*let numbersArray = [1, 2, 5,7, 9 ,23, 21, 65, 32, 76, 24, 43, 26]
 func getIndices(array:[Int], targetValue:Int) -> [Int]{
 var indices:[Int] = [Int]()
 
 for value in array {
 let index = array.index(of: value)
 if let substractionResultIndex = array.index(of: targetValue - value){
 indices.append(index!)
 indices.append(substractionResultIndex)
 break
 }
 }
 return indices
 }
 let resultIndices = getIndices(array: numbersArray,targetValue: 44)
 print(resultIndices)*/


//Approach 2
let numbersArray = [1, 2, 5,7, 9 ,23, 21, 65, 32, 76, 24, 43, 26]
func getIndices(array:[Int], targetValue:Int) -> [Int]{
    var indices:[Int] = [Int]()
    var map:[Int:Int] = [Int:Int]()
    for value in array {
        
        let index = array.index(of: value)
        let substractionResult = targetValue - value
        if  map.keys.contains(substractionResult){
            indices.append(map[substractionResult]!)
            indices.append(index!)
            return indices
        }
        
        //Value is saved as Key
        map[value] = index
        
        
        
    }
    return indices
}
let resultIndices = getIndices(array: numbersArray,targetValue: 69)
print(resultIndices)
