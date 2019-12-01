import UIKit

struct Place: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
}

let json = """
{
  "places": [
    {
      "name": "Lucas",
      "latitude": 23,
      "longitude": 45
    },
    {
      "name": "Puerto Rico",
      "latitude": 23,
      "longitude": 45
    }
  ]
}
""".data(using: .utf8)!

let placeDictinary = try! JSONDecoder().decode([String:[Place]].self, from: json)
let places = placeDictinary["places"]
print(placeDictinary)
print(places)
