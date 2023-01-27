import UIKit

struct Geo: Codable {
    var latitude: Double
    var longitude: Double
}

enum AddressType: String, Codable {
    case apartment = "apartment"
    case house = "house"
    case condo = "condo"
    case townHouse = "townHouse"
}

struct Address: Codable {
    var street: String
    var city: String
    var state: String
    var geo: Geo
    var addressType: AddressType
}

struct Customers: Codable {
    var firstName: String
    var lastName: String
    var dateCreated: Date
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
      "dateCreated": "1996-12-19T16:39:57-08:00",
      "address": {
        "street": "1200 Richmond Ave",
        "city": "Huston",
        "state": "TX",
        "geo": {
          "latitude": 34.56,
          "longitude": 35.65
        },
        "addressType": "house"
      }
    }
  ]
}
""".data(using: .utf8)!

let customersResponse = try! JSONDecoder().decode(CustomersResponse.self, from: json)
print(customersResponse)
print(customersResponse.customers[0].address.addressType.rawValue)
