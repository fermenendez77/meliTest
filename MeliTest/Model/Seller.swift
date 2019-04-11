import Foundation

struct Seller : Codable {
	let id : Int?
	let power_seller_status : String?
	let car_dealer : Bool?
	let real_estate_agency : Bool?
	let tags : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case power_seller_status = "power_seller_status"
		case car_dealer = "car_dealer"
		case real_estate_agency = "real_estate_agency"
		case tags = "tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		power_seller_status = try values.decodeIfPresent(String.self, forKey: .power_seller_status)
		car_dealer = try values.decodeIfPresent(Bool.self, forKey: .car_dealer)
		real_estate_agency = try values.decodeIfPresent(Bool.self, forKey: .real_estate_agency)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
	}

}
