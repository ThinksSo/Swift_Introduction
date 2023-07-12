// Урок 3. Коллекции и замыкания

/*
 1. Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай
 (можно представить её в виде массива видов чая, которые хотят заказать).
 Необходимо последовательно выводить в консоль сколько заплатит покупатель
 (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).
 */

print("\n\t Task 1: Queue for tea\n")

var teaPrice: [String: Int] = ["black": 100, "green": 120, "fruit": 110]
var queue: [String] = ["green", "black", "black", "green", "fruit", "green"]

for (index, el) in queue.enumerated() {
    //    guard teaPrice[el] != nil else {
    //        print("No such tea")
    //        continue
    //    }
    var price = teaPrice[el]!
    print("№ \(index + 1): \(el) tea, price: \(price) RUR")
}


/*
 2. Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil].
 Необходимо создать новый массив, который будет состоять из элементов старого,
 но не должно быть nil, не должно быть 0 и 4, а
 также массив должен быть отсортирован по возрастанию.
 */

print("\n\t Task 2: New array\n")

let a = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
let b = a.filter { $0 != nil || $0 == 0 || $0 == 4}
b.sorted(by: { $0! > $1! })
print(a)
print(b)


//var a: Set = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
//var b: Set = [nil, 0, 4]
//print(a)
//let c = a.symmetricDifference(b)
//print(c)


/*
 3. Написать функцию, которая на вход принимает целое число, а возвращает массив,
 который сформирован по следующим правилам: количество элементов соответствует переданному числу,
 массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.
 */

print("\n\t Task 3: Array filling\n")

print(arrayFilling(d: 6))

func arrayFilling (d: Int) -> [Int] {
    var newArray = [1]
    
    guard d > 1 else {
        print ("Array index less 2")
        return []
    }
    
    for i in 0...d-2 {
        newArray.append((newArray[i] * 2))
    }
    return newArray
}
