import Foundation

struct Paging : Codable {
	let total : Int?
	let offset : Int?
	let limit : Int?
	let primary_results : Int?

	enum CodingKeys: String, CodingKey {

		case total = "total"
		case offset = "offset"
		case limit = "limit"
		case primary_results = "primary_results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
		primary_results = try values.decodeIfPresent(Int.self, forKey: .primary_results)
	}

}
