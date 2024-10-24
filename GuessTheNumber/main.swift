import Foundation

func main() {
    while true {
        game()
        print("Хотите сыграть еще?")
        
        if let input = readLine()?.lowercased(), input != "да" {
            break
        }
    }
}

main()
