import UIKit

struct Customer: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    
//    private enum CodingKeys: String, CodingKey {
//        case firstName
//        case lastName
//        case age
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.firstName =  try container.decode(String.self, forKey: .firstName)
//        self.lastName =  try container.decode(String.self, forKey: .lastName)
//        self.age = try container.decode(Int.self, forKey: .age)
//    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.firstName, forKey: .firstName)
//        try container.encode(self.lastName, forKey: .lastName)
//        try container.encode(self.age, forKey: .age)
//    }
}

let json = """
{
    "firstName": "John",
    "lastName": "Doe",
    "age": 34
}
""".data(using: .utf8)!

//let customer = try! JSONDecoder().decode(Customer.self, from: json)
//print(customer)

let customer = Customer(firstName: "Lucas", lastName: "Inocencio", age: 26)
let coder =  try! JSONEncoder().encode(customer)

print("* \( customer)")
print("* \( coder)")
print(String(data: coder, encoding: .utf8))
