import Foundation

struct Shipping : Codable {
	let free_shipping : Bool?
	let mode : String?
	let tags : [String]?
	let logistic_type : String?
	let store_pick_up : Bool?

	enum CodingKeys: String, CodingKey {

		case free_shipping = "free_shipping"
		case mode = "mode"
		case tags = "tags"
		case logistic_type = "logistic_type"
		case store_pick_up = "store_pick_up"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		free_shipping = try values.decodeIfPresent(Bool.self, forKey: .free_shipping)
		mode = try values.decodeIfPresent(String.self, forKey: .mode)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		logistic_type = try values.decodeIfPresent(String.self, forKey: .logistic_type)
		store_pick_up = try values.decodeIfPresent(Bool.self, forKey: .store_pick_up)
	}

}
