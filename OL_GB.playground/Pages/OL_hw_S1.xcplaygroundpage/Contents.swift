// Tasks S1

// 1. Вывести в консоль все чётные числа от 0 до 100, включая 0.
print("\n\t Task 1: Even numbers\n")
for i in 0...100 where i % 2 == 0 {
    print (i)
}


/*  2. Создать две переменных: одна равна 7, другая 20.
 Если результат перемножения этих переменных больше 10,
 то вывести в консоль первую переменную, в противном случае вывести вторую.
 */
print("\n\t Task 2: Number comparison\n")
var a = 7
var b = 20

if a * b > 10 {
    print("a = \(a)")
} else {
    print("b = \(b)")
}


/*  3. Создайте переменную “k”, равную 9.
 В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k” — чётное,
 то увеличьте “k” на 2, в противном случае выведите в консоль “Next”
 и перейдите к следующей итерации.
 */
print("\n\t Task 3: Sum in range\n")
var k: Int = 9
for i in 10...50 where i % 2 != 0 {
    if ((i + k) % 2 == 0 ){
        print("\(k) + \(i) = \(i + k)")
        k += 2
    } else {
        print("Next")
    }
}


/* 4. Создайте переменную “k”, равную 9.
 В диапазоне от 10 до 50, но только по нечётным числам, если текущее число плюс “k” — чётное, то увеличьте “k” на 1, в противном случае выведите в консоль “Next” прекратите выполнение цикла.
 */
print("\n\t Task 4: Sum even in range\n")
k = 9
for i in 10...50 where i % 2 != 0 {
    if ((i + k) % 2 == 0 ){
        print("\(k) + \(i) = \(i + k)")
        k += 1
    } else {
        print("\(k) + \(i) = \(i + k) -> Next (out)")
        break
    }
}


