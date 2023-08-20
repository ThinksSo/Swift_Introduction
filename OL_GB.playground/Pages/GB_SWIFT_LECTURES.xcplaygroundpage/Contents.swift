

// Создание кофе
var latte = Coffee(name: "Latte", isSugar: true, isIce: false)
var cappuccino = Coffee(name: "Cappuccino", isSugar: false, isIce: false)
latte.getCoffee()
cappuccino.getCoffee()



// Создание экземпляров класса
let firstCafe = FirstCafe()
let secondCafe = SecondCafe()
let thirdCafe = ThirdCafe()


firstCafe.addCoffee(coffee: espresso) // в массив coffee класса FirstCafe добавлен espresso
print(secondCafe.coffee) // в консоль будет выведен массив кофе класса SecondCafe
thirdCafe.addCoffee(coffee: espresso) // в массив coffee класса ThirdCafe будет добавлен espresso

// Пприменение переопределение метода добавления кофе для классов
firstCafe.addCoffee(coffee: cappuccino)
secondCafe.addCoffee (coffee: cappuccino) // будет распечатан с номером, по переопределению в классе
thirdCafe.addCoffee(coffee: cappuccino)


// Объединение кафе в один массив по протоколу
var cafe: [CafeProtocol] = [firstCafe, secondCafe, thirdCafe]

// Добавление всем кофе всем кафе из массива
for oneCafe in cafe {
    oneCafe.addCoffee(cofee: capuchino)
}


// экземпляры витрин с дессертами
var firstShowcase = Showcase<Cake>()
var secondShowcase = Showcase<Eclair>()





// СТРУКТУРЫ
// Структура кофе
struct Coffee {
    var name: String
    var isSugar: Bool
    var isIce: Bool
    var cost: Double = 110
    func getCoffee() {
        print("Название: \(name), стоимость: \(cost)")
    }
    
    mutating func changeName(name: String) {
        self.name = name
    }
}

enum CoffeeSize {
    case s
    case m
    case l
    
    init(size: String) {
        switch size {
        case "small": self = .s
        case "medium": self = .m
        case "large": self = .l
        default: self = .m
        }
    }
    
    init?(newSize: String) {
        switch newSize {
        case "small": self = .s
        case "medium": self = .m
        case "large": self = .l
        default: return nil
        }
    }
}

// КЛАССЫ
// Класс КАФЕ Добавление к классу Cafe протокола добавления кофе
class Cafe: CafeProtocol {
    var coffee: [Coffee]
    required init(coffee: [Coffee]) {
        self.coffee = coffee
    }
    convenience init() {
        let latte = Coffee(name: "Latte", isSugar: true, isIce: false, size: .l)
        let cappuccino = Coffee(name: "Cappuccino", isSugar: false, isIce: false, size: .m)
        self.init(coffee: [latte, cappuccino])
    }
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
}



// Протокол добавления кофе с ининциализацией
protocol CafeProtocol {
    var coffee: [Coffee] { get }
    func addCoffee(coffee: Coffee)
    init(coffee: [Coffee])
}

// Расширение протокола добавления кофе выводом наименования кофе
extension CafeProtocol {
    func addCoffee(coffee: Coffee) {
        print(coffee.name)
    }
}


class FirstCafe: CafeProtocol {
    private var coffee: [Coffee]
    
    init(coffee: [Coffee]) {
        self.coffee = coffee
    }
    convenience init() {
        let latte = Coffee(name: "Latte", isSugar: true, isIce: false, size: .l)
        let cappuccino = Coffee(name: "Cappuccino", isSugar:false, isIce: false, size: .m)
        self.init(coffee: [latte, cappuccino])
    }
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
}

class SecondCafe: CafeProtocol {
    private var coffee: [Coffee]
    init(coffee: [Coffee]) {
        self.coffee = coffee
    }
    convenience init() {
        let latte = Coffee(name: "Latte", isSugar: true, isIce: false, size: .l)
        let cappuccino = Coffee(name: "Cappuccino", isSugar: false, isIce: false, size: .m)
        self.init(coffee: [latte, cappuccino])
    }
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
    }
}

class ThirdCafe: CafeProtocol {
    private var coffee: [Coffee]
    init(coffee: [Coffee]) {
        self.coffee = coffee
}
    convenience init() {
        let latte = Coffee(name: "Latte", isSugar: true, isIce:
false, size: .l)
        let cappuccino = Coffee(name: "Cappuccino", isSugar:
false, isIce: false, size: .m)
        self.init(coffee: [latte, cappuccino])
}
    func addCoffee(coffee: Coffee) {
        self.coffee.append(coffee)
} }


// Классы наследники Cafe
class FirstCafe: Cafe {}
class SecondCafe: Cafe {}
class ThirdCafe: Cafe {}

// Переопределение метода добавления кофе в классе
class SecondCafe: Cafe {
//    override func addCoffee( coffee: Coffee) {
//        self.coffee.append(coffee)
//        print(self.coffee.count)
//    }

    override func addCoffee(coffee: Coffee) {
        super.addCoffee(coffee: coffee)
        print(self.coffee.count)
    }
}



// Структура Cake
struct Cake {
    var name: String
    var cost: Double
}
protocol CakeProtocol {
    func addCake(cake: Cake)
}


struct Eclair {
    var taste: String
    var cost: Double
}



// Класс витрины с десертами
class Showcase<T> {
    var desserts: [T] = []
}


// Протокол для витрины
protocol ShowcaseProtocol {
    associatedtype Dessert
    func addDessert(dessert: Dessert)
    func isEmpty() -> Bool
}

class Showcase<T>: ShowcaseProtocol {
    typealias Dessert = T
    var desserts: [T] = []
    func addDessert(dessert: T) {
        desserts.append(dessert)
    }
    func isEmpty() -> Bool {
        desserts.isEmpty
    }
}
