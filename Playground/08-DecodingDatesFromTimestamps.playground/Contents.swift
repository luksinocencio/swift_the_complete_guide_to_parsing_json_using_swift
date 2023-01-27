import UIKit

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyy"
        return formatter
    }()
}

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
      "dateCreated": "08/05/2018",
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

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

let customerResponse = try! decoder.decode(CustomersResponse.self, from: json)
print(customerResponse)

