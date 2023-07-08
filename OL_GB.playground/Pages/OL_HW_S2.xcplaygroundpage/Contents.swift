/* 1. Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок
 Функция возвращает сколько денег получит пользователь по итогу.*/

print("\n\t Task 1: Dividend Calculator\n")
var money = 10000
var annualPerc = 10
var period = 180
print("For \(money) on \(period) with rate \(annualPerc)")
print("Income = \(dividentCalc(money: 10000, annualPerc: 10, period: 183))\n")


func dividentCalc (money: Int, annualPerc: Int, period: Int) -> Int {
    var divident = money + (money * annualPerc * period)/365/100
    return divident
}


// 2. Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
print("\n\t Task 2: Pizza\n")
enum Pizza: String{
    case margherita = "Margherita"
    case peperonoini = "Peperonoini"
    case calzone = "Calzone"
}
let margheritaPizza = Pizza.margherita
let peperonoiniPizza = Pizza.peperonoini
let calzonePizza = Pizza.calzone

print(margheritaPizza, peperonoiniPizza, calzonePizza, separator:", ")


// 3. Добавить возможность получения названия пиццы через rawValue
print("\n\t Task 3: Pizza name\n")
let pizzaMargherita = margheritaPizza.rawValue
let pizzaPeperonoini = peperonoiniPizza.rawValue
let pizzaCalzone = calzonePizza.rawValue

print(pizzaMargherita, pizzaPeperonoini, pizzaCalzone, separator:", ")
