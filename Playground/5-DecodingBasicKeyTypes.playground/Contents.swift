import UIKit

struct PlacesResponse: Codable {
    var places: [Place]
}

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

let places = try! JSONDecoder().decode(PlacesResponse.self, from: json)
print(places)

