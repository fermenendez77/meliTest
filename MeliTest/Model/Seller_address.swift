import Foundation

struct Seller_address : Codable {
	let id : Int?
	let comment : String?
	let address_line : String?
	let zip_code : String?
	let country : Country?
	let state : State?
	let city : City?
	let latitude : Double?
	let longitude : Double?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case comment = "comment"
		case address_line = "address_line"
		case zip_code = "zip_code"
		case country = "country"
		case state = "state"
		case city = "city"
		case latitude = "latitude"
		case longitude = "longitude"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
		address_line = try values.decodeIfPresent(String.self, forKey: .address_line)
		zip_code = try values.decodeIfPresent(String.self, forKey: .zip_code)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		state = try values.decodeIfPresent(State.self, forKey: .state)
		city = try values.decodeIfPresent(City.self, forKey: .city)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
	}

}
