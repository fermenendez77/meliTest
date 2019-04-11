import Foundation

struct Results : Codable {
	let id : String?
	let site_id : String?
	let title : String?
	let seller : Seller?
	let price : Double?
	let currency_id : String?
	let available_quantity : Int?
	let sold_quantity : Int?
	let buying_mode : String?
	let listing_type_id : String?
	let stop_time : String?
	let condition : String?
	let permalink : String?
	let thumbnail : String?
	let accepts_mercadopago : Bool?
	let installments : Installments?
	let address : Address?
	let shipping : Shipping?
	let attributes : [Attributes]?
	let original_price : Double?
	let category_id : String?
	let catalog_product_id : String?
	let reviews : Reviews?
	let tags : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case site_id = "site_id"
		case title = "title"
		case seller = "seller"
		case price = "price"
		case currency_id = "currency_id"
		case available_quantity = "available_quantity"
		case sold_quantity = "sold_quantity"
		case buying_mode = "buying_mode"
		case listing_type_id = "listing_type_id"
		case stop_time = "stop_time"
		case condition = "condition"
		case permalink = "permalink"
		case thumbnail = "thumbnail"
		case accepts_mercadopago = "accepts_mercadopago"
		case installments = "installments"
		case address = "address"
		case shipping = "shipping"
		case attributes = "attributes"
		case original_price = "original_price"
		case category_id = "category_id"
		case catalog_product_id = "catalog_product_id"
		case reviews = "reviews"
		case tags = "tags"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		seller = try values.decodeIfPresent(Seller.self, forKey: .seller)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
		available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
		sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
		buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
		listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
		stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
		condition = try values.decodeIfPresent(String.self, forKey: .condition)
		permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
		installments = try values.decodeIfPresent(Installments.self, forKey: .installments)
		address = try values.decodeIfPresent(Address.self, forKey: .address)
		shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
		attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
		original_price = try values.decodeIfPresent(Double.self, forKey: .original_price)
		category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
		catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
		reviews = try values.decodeIfPresent(Reviews.self, forKey: .reviews)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
	}

}
