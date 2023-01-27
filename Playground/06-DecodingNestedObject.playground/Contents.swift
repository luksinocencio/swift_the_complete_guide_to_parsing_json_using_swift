import UIKit

struct Geo: Codable {
    var latitude: Double
    var longitude: Double
}

struct Address: Codable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
}

struct Customers: Codable {
    var firstName: String
    var lastName: String
    var address: Address
}

struct CustomersResponse: Codable {
    var customers: [Customers]
}

let json = """
{
  "customers": [
    {
      "firstName": "John",
      "lastName": "Doe",
      "address": {
        "street": "1200 Richmond Ave",
        "city": "Huston",
        "state": "TX",
        "geo": {
          "latitude": 34.56,
          "longitude": 35.65
        }
      }
    }
  ]
}
""".data(using: .utf8)!

let customersTest = try! JSONDecoder().decode(CustomersResponse.self, from: json)
print(customersTest)
print(customersTest.customers[0].address.geo.latitude)
