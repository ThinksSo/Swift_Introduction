// Урок 6. ARC и управление памятью

/*
 1. Создать структуру работника пиццерии.
 В ней должны быть такие свойства, как имя, зарплата и должность.
 Должностей пока может быть две: или кассир, или повар.
 Добавить в класс пиццерии массив с работниками.
 */


struct PizzeriaWorker {
    enum Position {
        case cashier
        case cook
    }
    
    var name: String
    var salary: Double
    var position: Position
    
    var employers: [PizzeriaWorker]
    
    //    init(name: String, salary: Double, position: String, employers: [PizzeriaWorker]){
    //        self.name = name
    //        self.salary = salary
    //        self.position = position
    //        self.employers = employers
    //    }
}


/*
 2. Создать класс столика. В нём должны быть свойство, в котором содержится количество мест,
 и функция, которая на вход принимает количество гостей, которое хотят посадить,
 возвращает true, если места хватает, и false, если места не хватает.
 Изначальное количество мест задаётся в инициализаторе.
 */

class Cafe {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


class Table {
    var seats: Int
    var cafe: Cafe
    
    func addGuest(guests: Int) -> Bool {
        if guests > 0 && guests < self.seats {
            return true
        }
        return false
    }
    
    init(seats: Int, cafe: Cafe) {
        self.seats = 6
        self.cafe = cafe
    }
}


/*
 3. Добавить в класс пиццерии свойство, в котором хранится массив столиков.
 У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик.
 Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.
 */

struct Pizza {
    enum PizzaType: String{
        case margherita = "Margherita"
        case peperonoini = "Peperonoini"
        case calzone = "Calzone"
    }
    
    var type: PizzaType
    var price: Double
}

class Pizzeria {
    var name: String
    private var pizza: [Pizza]
    private var tables: [Table]
    
    init(name: String, pizza: [Pizza], tables: [Table]) {
        self.name = name
        self.pizza = pizza
        self.tables = [Table(seats: 6, cafe: Cafe(name: "Cafe")), Table(seats: 4, cafe: Cafe(name: "Cafe")), Table(seats: 2, cafe: Cafe(name: "Cafe"))]
    }
}

