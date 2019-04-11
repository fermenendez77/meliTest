import Foundation

struct Attributes : Codable {
	let attribute_group_id : String?
	let attribute_group_name : String?
	let source : Int?
	let id : String?
	let name : String?
	let value_id : String?
	let value_name : String?

	enum CodingKeys: String, CodingKey {

		case attribute_group_id = "attribute_group_id"
		case attribute_group_name = "attribute_group_name"
		case source = "source"
		case id = "id"
		case name = "name"
		case value_id = "value_id"
		case value_name = "value_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		attribute_group_id = try values.decodeIfPresent(String.self, forKey: .attribute_group_id)
		attribute_group_name = try values.decodeIfPresent(String.self, forKey: .attribute_group_name)
		source = try values.decodeIfPresent(Int.self, forKey: .source)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
		value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
	}

}
