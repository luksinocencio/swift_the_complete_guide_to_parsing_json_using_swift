import UIKit

struct Customer: Codable {
    var firstName: String
    var lastName: String
    var age: Int
}

let json = """
    {
        "first_name": "Lucas",
        "last_name": "Inocencio",
        "age": 26
    }
""".data(using: .utf8)!


let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let customer = try! decoder.decode(Customer.self, from: json)
print(customer)
