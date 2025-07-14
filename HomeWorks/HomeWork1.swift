
import Foundation
// Пункт 1
class Car {
    let color: String
    let brand: String
    let year: Int
    let model: String
    let enginePower: Int
    
    init(brand: String, model: String, color: String, year: Int, enginePower: Int) {
        self.color = color
        self.year = year
        self.brand = brand
        self.model = model
        self.enginePower = enginePower
    }
    
    func printCarInfo() {
        print("Brand: \(brand)")
        print("Car Model: \(model)")
        print("Car Color: \(color)")
        print("Car Year: \(year)")
        print("Engine Power: \(enginePower)")
    }
}

// Пункт 2
class BMW: Car {
    let fuelConsumption: Double
    let hasMpackage: Bool
    
    init(model: String, color: String, year: Int, enginePower: Int, fuelConsumption: Double, hasMpackage: Bool) {
        self.fuelConsumption = fuelConsumption
        self.hasMpackage = hasMpackage
        super.init(brand: "BMW", model: model, color: color, year: year, enginePower: enginePower)
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print("Fuel Consumption: \(fuelConsumption) L/100km")
        print("M Package: \(hasMpackage ? "Yes" : "No")")
        print("--------------------")
    }
}

class Mercedes: Car {
    let engineType: String
    let hasNightPackage: Bool
    
    init(model: String, color: String, year: Int, enginePower: Int, engineType: String, hasNightPackage: Bool) {
        self.engineType = engineType
        self.hasNightPackage = hasNightPackage
        super.init(brand: "Mercedes", model: model, color: color, year: year, enginePower: enginePower)
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print("Engine Type: \(engineType)")
        print("Night Package: \(hasNightPackage ? "Yes" : "No")")
        print("--------------------")
    }
}

class Audi: Car {
    let quattro: Bool
    let virtualCockpit: Bool
    
    init(model: String, color: String, year: Int, enginePower: Int, quattro: Bool, virtualCockpit: Bool) {
        self.quattro = quattro
        self.virtualCockpit = virtualCockpit
        super.init(brand: "Audi", model: model, color: color, year: year, enginePower: enginePower)
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print("Quattro: \(quattro ? "Yes" : "No")")
        print("Virtual Cockpit: \(virtualCockpit ? "Yes" : "No")")
        print("--------------------")
    }
}

class Buick: Car {
    let doorQuantity: Int
    let hasPanoramicRoof: Bool
    
    init(model: String, color: String, year: Int, enginePower: Int, doorQuantity: Int, hasPanoramicRoof: Bool) {
        self.doorQuantity = doorQuantity
        self.hasPanoramicRoof = hasPanoramicRoof
        super.init(brand: "Buick", model: model, color: color, year: year, enginePower: enginePower)
    }
    
    override func printCarInfo() {
        super.printCarInfo()
        print("Door Quantity: \(doorQuantity)")
        print("Panoramic Roof: \(hasPanoramicRoof ? "Yes" : "No")")
        print("--------------------")
    }
}

// Пункт 3
extension Car {
    static func createCars() -> [Car] {
        return [
            BMW(model: "X6", color: "Red", year: 2020, enginePower: 450, fuelConsumption: 7.5, hasMpackage: true),
            Mercedes(model: "E200", color: "Black", year: 2019, enginePower: 250, engineType: "V8", hasNightPackage: false),
            Buick(model: "GSX", color: "White", year: 2018, enginePower: 200, doorQuantity: 4, hasPanoramicRoof: true),
            Audi(model: "RS6", color: "Gray", year: 2021, enginePower: 500, quattro: true, virtualCockpit: false),
            Buick(model: "Envision", color: "Silver", year: 2017, enginePower: 150, doorQuantity: 4, hasPanoramicRoof: false),
            Audi(model: "A4", color: "Blue", year: 2016, enginePower: 180, quattro: false, virtualCockpit: true),
            Mercedes(model: "A-Class", color: "Green", year: 2015, enginePower: 220, engineType: "Inline-4", hasNightPackage: true),
            BMW(model: "3 Series", color: "Yellow", year: 2014, enginePower: 270, fuelConsumption: 8.5, hasMpackage: false)
        ]
    }
}

// Пункт 4
func race(car1: Car, car2: Car) -> Car {
    return car1.enginePower > car2.enginePower ? car1 : car2
}

// Пункт 5
func competition() {
let cars = Car.createCars()
var shuffledCars = cars.shuffled()
var winners: [Car] = []

    for i in stride(from: 0, to: cars.count - 1, by: 2) {
        let car1 = shuffledCars[i]
        let car2 = shuffledCars[i+1]
        
        print("\nГонка #\(i/2+1) между авто:")
        car1.printCarInfo()
        car2.printCarInfo()
        
        let winner = race(car1: car1, car2: car2)
        winners.append(winner)
        print("ПОБЕДИТЕЛЬ: \(winner.brand) \(winner.model) с мощностью \(winner.enginePower) л.с.")
    }
    
var overallWinner = winners[0]
    for i in stride(from: 1, to: winners.count, by: 1) {
        if overallWinner.enginePower < winners[i].enginePower {
            overallWinner = winners[i]
        }
    }
    print("--------------------")
    print("ОБЩИЙ ПОБЕДИТЕЛЬ: \(overallWinner.brand) \(overallWinner.model) с мошностью \(overallWinner.enginePower) л.с.")
    
    
}
@main
struct App {
    static func main() {
        competition()
    }
}
