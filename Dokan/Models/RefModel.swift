//
//  RefModel.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 21/05/2022.
//

import Foundation

struct RefModel: Decodable {
	var refs: [Refs]
	
	struct Refs: Decodable, Identifiable {
		var id: String
		var ref: String
		var label: String
	}
}
