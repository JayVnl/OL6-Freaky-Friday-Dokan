//
//  DokanApp.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 27/04/2022.
//

import SwiftUI

@main
struct DokanApp: App {
	// MARK: PROPERTIES
	@StateObject var prismicManager = PrismicManager()
	
	// MARK: BODY
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environmentObject(prismicManager)
				.task {
					do {
						prismicManager.ref = try await prismicManager.fetchRef()
						prismicManager.stores = try await prismicManager.fetchStores()
					} catch {
						print("Error getting stores: \(error)")
					}
				}
		}
	}
}
