import Foundation

struct Available_filters : Codable {
	let id : String?
	let name : String?
	let type : String?
	let values : [Values]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case type = "type"
		case values = "values"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		self.values = try values.decodeIfPresent([Values].self, forKey: .values)
	}

}
