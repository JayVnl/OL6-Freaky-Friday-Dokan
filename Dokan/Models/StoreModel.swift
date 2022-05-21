//
//  CardModel.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 20/05/2022.
//

import Foundation

struct StoreModel: Decodable {
	var page: Int
	var results_size: Int
	var total_results_size: Int
	var total_pages: Int
	var results: [Store]
	var version: String
	
	struct Store: Decodable, Identifiable {
		var id: String
		var type: String
		var data: StoreData
		
		struct StoreData: Decodable {
			var name: [StoreNames]
			var logo: StoreImage
			var color: String
			
			struct StoreNames: Decodable {
				var text: String
			}
			
			struct StoreImage: Decodable {
				var alt: String?
				var url: String
			}
		}
	}
}
