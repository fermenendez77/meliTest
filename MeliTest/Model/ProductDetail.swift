/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ProductDetail : Codable {
	let id : String?
	let site_id : String?
	let title : String?
	let subtitle : String?
	let seller_id : Int?
	let category_id : String?
	let price : Double?
	let base_price : Double?
	let original_price : String?
	let currency_id : String?
	let initial_quantity : Int?
	let available_quantity : Int?
	let sold_quantity : Int?
	let buying_mode : String?
	let listing_type_id : String?
	let start_time : String?
	let stop_time : String?
	let condition : String?
	let permalink : String?
	let thumbnail : String?
	let secure_thumbnail : String?
	let pictures : [Pictures]?
	let video_id : String?
	let descriptions : [Descriptions]?
	let accepts_mercadopago : Bool?
	let shipping : Shipping?
	let international_delivery_mode : String?
	let seller_address : Seller_address?
	let seller_contact : String?
	let geolocation : Geolocation?
	let coverage_areas : [String]?
	let attributes : [Attributes]?
	let warnings : [String]?
	let listing_source : String?
	let status : String?
	let sub_status : [String]?
	let tags : [String]?
	let warranty : String?
	let catalog_product_id : String?
	let domain_id : String?
	let parent_item_id : String?
	let differential_pricing : String?
	let deal_ids : [String]?
	let automatic_relist : Bool?
	let date_created : String?
	let last_updated : String?
	let health : Double?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case site_id = "site_id"
		case title = "title"
		case subtitle = "subtitle"
		case seller_id = "seller_id"
		case category_id = "category_id"
		case price = "price"
		case base_price = "base_price"
		case original_price = "original_price"
		case currency_id = "currency_id"
		case initial_quantity = "initial_quantity"
		case available_quantity = "available_quantity"
		case sold_quantity = "sold_quantity"
		case buying_mode = "buying_mode"
		case listing_type_id = "listing_type_id"
		case start_time = "start_time"
		case stop_time = "stop_time"
		case condition = "condition"
		case permalink = "permalink"
		case thumbnail = "thumbnail"
		case secure_thumbnail = "secure_thumbnail"
		case pictures = "pictures"
		case video_id = "video_id"
		case descriptions = "descriptions"
		case accepts_mercadopago = "accepts_mercadopago"
		case international_delivery_mode = "international_delivery_mode"
		case seller_address = "seller_address"
		case seller_contact = "seller_contact"
		case geolocation = "geolocation"
        case shipping = "shipping"
		case coverage_areas = "coverage_areas"
		case attributes = "attributes"
		case warnings = "warnings"
		case listing_source = "listing_source"
		case status = "status"
		case sub_status = "sub_status"
		case tags = "tags"
		case warranty = "warranty"
		case catalog_product_id = "catalog_product_id"
		case domain_id = "domain_id"
		case parent_item_id = "parent_item_id"
		case differential_pricing = "differential_pricing"
		case deal_ids = "deal_ids"
		case automatic_relist = "automatic_relist"
		case date_created = "date_created"
		case last_updated = "last_updated"
		case health = "health"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
		seller_id = try values.decodeIfPresent(Int.self, forKey: .seller_id)
		category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		base_price = try values.decodeIfPresent(Double.self, forKey: .base_price)
		original_price = try values.decodeIfPresent(String.self, forKey: .original_price)
		currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
		initial_quantity = try values.decodeIfPresent(Int.self, forKey: .initial_quantity)
		available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
		sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
		buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
		listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
		start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
		stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
		condition = try values.decodeIfPresent(String.self, forKey: .condition)
		permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
		thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
		secure_thumbnail = try values.decodeIfPresent(String.self, forKey: .secure_thumbnail)
		pictures = try values.decodeIfPresent([Pictures].self, forKey: .pictures)
		video_id = try values.decodeIfPresent(String.self, forKey: .video_id)
		descriptions = try values.decodeIfPresent([Descriptions].self, forKey: .descriptions)
		accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
		international_delivery_mode = try values.decodeIfPresent(String.self, forKey: .international_delivery_mode)
		seller_address = try values.decodeIfPresent(Seller_address.self, forKey: .seller_address)
		seller_contact = try values.decodeIfPresent(String.self, forKey: .seller_contact)
		geolocation = try values.decodeIfPresent(Geolocation.self, forKey: .geolocation)
        shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
		coverage_areas = try values.decodeIfPresent([String].self, forKey: .coverage_areas)
		attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
		warnings = try values.decodeIfPresent([String].self, forKey: .warnings)
		listing_source = try values.decodeIfPresent(String.self, forKey: .listing_source)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		sub_status = try values.decodeIfPresent([String].self, forKey: .sub_status)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		warranty = try values.decodeIfPresent(String.self, forKey: .warranty)
		catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
		domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
		parent_item_id = try values.decodeIfPresent(String.self, forKey: .parent_item_id)
		differential_pricing = try values.decodeIfPresent(String.self, forKey: .differential_pricing)
		deal_ids = try values.decodeIfPresent([String].self, forKey: .deal_ids)
		automatic_relist = try values.decodeIfPresent(Bool.self, forKey: .automatic_relist)
		date_created = try values.decodeIfPresent(String.self, forKey: .date_created)
		last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
		health = try values.decodeIfPresent(Double.self, forKey: .health)
	}

}
