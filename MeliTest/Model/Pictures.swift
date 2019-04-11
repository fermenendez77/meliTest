/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Pictures : Codable {
	let id : String?
	let url : String?
	let secure_url : String?
	let size : String?
	let max_size : String?
	let quality : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case url = "url"
		case secure_url = "secure_url"
		case size = "size"
		case max_size = "max_size"
		case quality = "quality"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		secure_url = try values.decodeIfPresent(String.self, forKey: .secure_url)
		size = try values.decodeIfPresent(String.self, forKey: .size)
		max_size = try values.decodeIfPresent(String.self, forKey: .max_size)
		quality = try values.decodeIfPresent(String.self, forKey: .quality)
	}

}