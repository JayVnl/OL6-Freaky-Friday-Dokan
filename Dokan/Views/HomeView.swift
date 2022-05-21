//
//  HomeView.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 27/04/2022.
//

import SwiftUI

struct HomeView: View {
	// MARK: PROPERTIES
	@EnvironmentObject var prismicManager: PrismicManager
	
	// MARK: BODY
	var body: some View {
		VStack {
			Text("Recently used")
				.font(.system(size: 32))
				.fontWeight(.bold)
				.padding(.horizontal, 20)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			ZStack(alignment: .leading) {
				if let stores = prismicManager.stores {
					ForEach(stores.results.indices) { index in
						LargeCard(store: stores.results[index])
							.padding(.leading, CGFloat(index) * 60)
					}
				} else if prismicManager.isLoading {
					ProgressView()
				}
			}
			.frame(maxWidth: .infinity)
			.gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
				.onEnded { value in
					let horizontalAmount = value.translation.width as CGFloat
					let verticalAmount = value.translation.height as CGFloat
					
					if abs(horizontalAmount) > abs(verticalAmount) {
						// Call function to change position of recent cards
						print(horizontalAmount < 0 ? "left swipe" : "right swipe")
					} else {
						// Call function to show currently visible card
						print(verticalAmount < 0 ? "up swipe" : "down swipe")
					}
				}
			)
			
			Spacer()
				.frame(height: 50)
			
			Button("Add a new card", action: { print("Add new card") })
			
			Spacer()
			
			Button("See all your cards", action: { print("To all cards") })
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
		.preferredColorScheme(.dark)
	}
}

// MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
			.environmentObject(PrismicManager())
			.previewDevice("iPhone 13")
	}
}
