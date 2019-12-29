import UIKit

class Car: Decodable {
    var make: String = ""
    var model: String = ""
    
    init() {
        
    }
}

class EletricCar: Car {
    var range: Double = 0.0
    var hasAutoPilot: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case range = "range"
        case hasAutoPilot = "hasAutoPilot"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.range = try container.decode(Double.self, forKey: .range)
        self.hasAutoPilot = try container.decode(Bool.self, forKey: .hasAutoPilot)
        try super.init(from: decoder)
    }
}

let json = """
{
    "make": "Honda",
    "model": "Accord",
    "range": 400,
    "hasAutoPilot": true
}
""".data(using: .utf8)!

let eletricCar = try! JSONDecoder().decode(EletricCar.self, from: json)
eletricCar.make
eletricCar.model
eletricCar.range
eletricCar.hasAutoPilot
