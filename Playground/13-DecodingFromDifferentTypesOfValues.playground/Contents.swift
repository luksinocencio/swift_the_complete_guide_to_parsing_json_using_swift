import UIKit

struct Place: Decodable {
    var latitude: Double
    var longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
    init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.latitude = try container.decode(Double.self, forKey: .latitude)
            self.longitude = try container.decode(Double.self, forKey: .longitude)
        } else if var container = try? decoder.unkeyedContainer() {
            self.latitude = try container.decode(Double.self)
            self.longitude = try container.decode(Double.self)
        } else if let container = try? decoder.singleValueContainer() {
            let string = try container.decode(String.self)
            let values = string.components(separatedBy: ",")
            
            guard values.count == 2,
                let latitude = Double(values[0]),
                let longitude = Double(values[0]) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode coordinates")
            }
            
            self.latitude = latitude
            self.longitude = longitude
        } else {
            self.latitude = 0
            self.longitude = 0
        }
    }
}

let playload1 = """
{
    "coordinates": [
        {
            "latitude": 37.332,
            "longitude": -122.011
        }
    ]
}
""".data(using: .utf8)!

let playload2 = """
{
    "coordinates": [
        [37.332, -122.011]
    ]
}
""".data(using: .utf8)!

let playload3 = """
{
    "coordinates": [
        "37.332, -122.011"
    ]
}
""".data(using: .utf8)!

let placesDictionary = try! JSONDecoder().decode([String:[Place]].self, from: playload1)
if let places = placesDictionary["coordinates"] {
    places[0].latitude
    places[0].longitude
}

let placesDictionary2 = try! JSONDecoder().decode([String:[Place]].self, from: playload2)
if let places2 = placesDictionary2["coordinates"] {
    places2[0].latitude
    places2[0].longitude
}

let placesDictionary3 = try! JSONDecoder().decode([String:[Place]].self, from: playload3)
if let places3 = placesDictionary3["coordinates"] {
    places3[0].latitude
    places3[0].longitude
}
