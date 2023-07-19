// 1. Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).

enum PizzaType: String{
    case margherita = "Margherita"
    case peperonoini = "Peperonoini"
    case calzone = "Calzone"
    case carbonara = "Carbonara"
    case fourCheeses = "Four cheeses"
}


/* 2. Создать структуру пиццы.Она должна содержать стоимость, вид пиццы,
 толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр).
 Вид пиццы должен быть вложенным типом для структуры пиццы.
 Подсказка: добавки лучше также сделать перечислением.
 */

struct Pizza {
    var type: PizzaType
    var price: Double
    var size: DougSize
    var filling: Ingredients
    
    enum Ingredients {
        case tomatoes
        case chees
        case olives
        case mushrooms
        case ham
        
        //        init(filling: String) {
        //            switch filling {
        //            case "tomatoes": self = .tomatoes
        //            case "chees": self = .chees
        //            case "olives": self = .olives
        //            case "mushrooms": self = .mushrooms
        //            case "ham": self = .ham
        //            default: nil
        //            }
        //        }
    }
    
    enum DougSize {
        case thick
        case thin
        
        init(size: String) {
            switch size {
            case "thick": self = .thick
            case "thin": self = .thin
            default: self = .thick
            }
        }
    }
    
}

/* 3. Создать класс пиццерии, добавить массив с возможными видами пиццы.
 Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.
 */

class Pizzeria {
    var name: String
    private var pizza: [Pizza]
    
    
    init(name: String, pizza: [Pizza]) {
        self.name = name
        self.pizza = pizza
    }
    
}

/* 4. Написать в классе пиццерии функции для добавления нового вида пиццы
 и для получения всех доступных пицц.
 */

extension Pizzeria {
    func add (pizza: Pizza) {
        self.pizza.append(pizza)
    }
    
    func getPizza() {
        for el in pizza {
            print("Type: \(el.type) \t Size: \(el.size) \t Price: \(el.price)")
        }
    }
}


// Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.

print("\n\t Task: Pizza\n")

var pizzaMargherita = Pizza(type: PizzaType.margherita, price: 100.00, size: .thin, filling: Pizza.Ingredients.tomatoes)
var pizzaMPeperonoini = Pizza(type: PizzaType.peperonoini, price: 120.00, size: .thin, filling: Pizza.Ingredients.mushrooms)
var pizzaCalzone = Pizza(type: PizzaType.calzone, price: 110.00, size: .thick, filling: Pizza.Ingredients.ham)

var pizzeria = Pizzeria(name: "PizzaHutt", pizza: [pizzaMargherita, pizzaMPeperonoini, pizzaCalzone])


print(pizzeria.name,"\n")
print(pizzeria.getPizza())
