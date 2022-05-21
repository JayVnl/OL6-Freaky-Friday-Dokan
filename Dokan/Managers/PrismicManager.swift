//
//  StoreManager.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 20/05/2022.
//

import Foundation

class PrismicManager: ObservableObject {
	@Published var ref: RefModel?
	@Published var stores: StoreModel?
	@Published var isLoading = false
	var API_KEY: String? = ""
	
	init(API_KEY: String? = "") {
		let filePath = Bundle.main.path(forResource: "API_KEYS", ofType: "plist")
		let plist = NSDictionary(contentsOfFile:filePath!)
		let value = plist?.object(forKey: "PRISMIC_API") as! String
		self.API_KEY = value
	}
	
	func fetchRef() async throws -> RefModel {
		guard let url = URL(string: "https://ff-dokan.cdn.prismic.io/api/v2?access_token=\(API_KEY!)") else { fatalError("Ref URL not available") }
		
		let urlRequest = URLRequest(url: url)
		
		let (data, res) = try await URLSession.shared.data(for: urlRequest)
		
		guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Couldn't fetch ref") }
		
		let decodedData = try JSONDecoder().decode(RefModel.self, from: data)
		
		return decodedData
	}
	
	func fetchStores() async throws -> StoreModel {
		guard let url = URL(string: "https://ff-dokan.prismic.io/api/v2/documents/search?ref=\(ref!.refs[0].ref)&access_token=\(API_KEY!)") else { fatalError("Store URL not available") }
		
		let urlRequest = URLRequest(url: url)
		
		let (data, res) = try await URLSession.shared.data(for: urlRequest)
		
		guard (res as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Couldn't fetch data") }
		
		let decodedData = try JSONDecoder().decode(StoreModel.self, from: data)
		
		return decodedData
	}
}
