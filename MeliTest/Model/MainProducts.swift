import Foundation
struct MainProducts : Codable {
	let site_id : String?
	let paging : Paging?
	let results : [Results]?
	

	enum CodingKeys: String, CodingKey {

		case site_id = "site_id"
		case paging = "paging"
        case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
