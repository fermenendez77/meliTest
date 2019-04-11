import Foundation

struct Reviews : Codable {
	let rating_average : Double?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case rating_average = "rating_average"
		case total = "total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rating_average = try values.decodeIfPresent(Double.self, forKey: .rating_average)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}

}
