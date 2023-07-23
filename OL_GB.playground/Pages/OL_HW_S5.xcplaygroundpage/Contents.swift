// Урок 5. Протоколы, классы и расширения

// 1. Создать протокол для меню. Протокол должен содержать стоимость и наименование.
// Стоимость и название должны быть get-only.

protocol MenuProtocol {
    var name: String {get}
    var price: Double {get}
}


/*
 2. Создайте класс кафе, в нём должен быть массив с наименованиями меню и инициализатор.
 Подпишите структуру чая с прошлого занятия на протокол из первого пункта.
 В качестве name должен быть вид чая и “tea”.
 Например, для чёрного чая должно быть black tea, а для зелёного green tea.
 
 
 4. Добавить в родительский класс функцию (add) по добавлению новой позиции в меню.
 Саму переменную меню сделать приватной, если она ещё таковой не является.
 */

class Cafe {
    private var menu: [MenuProtocol]
    
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
    
    func add(_ new: MenuProtocol) {
        menu.append(new)
    }
}

struct Tea: MenuProtocol {
    enum TeaType {
        case black
        case green
        case fruit
    }
    
    var name: String {
        return "\(TeaType.self) + tea"
    }
    var price: Double
    var type: TeaType
}


/*
 3. Создайте ещё 3 кафе, для которых класс Cafe будет родительским.
 
 5. Сделать так, чтобы в первом из трёх классов наследников (например, FirstCafe)
 функция add помимо того, что выполняла всё тоже самое, что и в родительском классе,
 печатала в консоль стоимость добавляемой позиции.
 */

class FirstCafe: Cafe {
    override func add(_ new: MenuProtocol) {
        super.add(new)
        print(new.price)
    }
}

class SecondCafe: Cafe {}
class ThirdCafe: Cafe {}


/*
 6. Создать класс автомата с едой, не реализовывать в нём ни методов,
 ни свойств, однако, этот класс должен уметь делать всё тоже самое, что и FirstCafe.
 
 7. Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.
 */

final class VendingMachine: FirstCafe {}
