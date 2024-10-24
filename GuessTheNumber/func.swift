import Foundation

func generateRandomNumber(range: (Int, Int)) -> Int {
    return Int.random(in: range.0...range.1)
}


func getRange() -> (Int, Int)? {
    print("Введите нижнюю границу диапазона:")
    guard let lowerBoundInput = readLine(), let lowerBound = Int(lowerBoundInput) else  {
        print("Введите корректное число")
        return nil
    }
    
    print("Введите верхнюю границу диапазона:")
    guard let upperBoundInput = readLine(), let upperBound = Int(upperBoundInput) else  {
        print("Введите корректное число")
        return nil
    }
    
    return (lowerBound, upperBound)
}


func getAttempts() -> Int {
    print("Введите желаемое количество попыток")
    
    while true {
        if let input = readLine(), let attempts = Int(input), attempts > 0 {
            return attempts
        } else {
            print("Введите корректное число")
        }
    }
}


func getGuess() -> Int? {
    print("Введите ваше число:")
    if let input = readLine(), let guess = Int(input) {
        return guess
    } else {
        print("Введите корректное число")
        return nil
    }
}


func game() {
    guard let range = getRange() else {
        print("Ошибка в вводе диапазона. Попробуйте снова.")
        return
    }
    
    let attempts = getAttempts()
    let correctNumber = generateRandomNumber(range: range)
    var attemptsLeft = attempts
    
    print("Я загадал число в диапазоне от \(range.0) до \(range.1). У вас \(attempts) попыток, чтобы его угадать.")
    
    repeat {
        if let guess = getGuess() {
            if guess < correctNumber {
                print("Загаданное число больше вашего")
            } else if guess > correctNumber {
                print("Загаданное число меньше вашего")
            } else {
                print("Поздравляю! Вы угадали число!")
                break
            }
            attemptsLeft -= 1
            if attemptsLeft > 0 {
                print("У вас осталось \(attemptsLeft) попыток. Поднажмите!")
            }
            
            if attemptsLeft == 0 {
                print("Попытки кончились! Загаданное число: \(correctNumber)")
            }
        }
        
    } while attemptsLeft > 0
}
