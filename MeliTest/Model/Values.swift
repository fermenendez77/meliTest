import Foundation

struct Values : Codable {
	let id : String?
	let name : String?
	let results : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		results = try values.decodeIfPresent(Int.self, forKey: .results)
	}

}
