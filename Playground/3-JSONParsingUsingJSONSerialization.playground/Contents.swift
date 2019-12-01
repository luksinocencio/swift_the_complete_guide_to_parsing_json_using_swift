import UIKit

struct Place: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    var visited: Bool
}

let json = """
[
  {
    "name": "Lucas",
    "latitude": 23,
    "longitude": 45,
    "visited": true
  },
  {
    "name": "Puerto Rico",
    "latitude": 23,
    "longitude": 45,
    "visited": true
  },
  {
    "name": "Mexico City",
    "latitude": 23,
    "longitude": 45,
    "visited": true
  },
  {
    "name": "Iceland",
    "latitude": 23,
    "longitude": 45,
    "visited": true
  }
]
""".data(using: .utf8)!

let places = try! JSONDecoder().decode([Place].self, from: json)
print(places)
