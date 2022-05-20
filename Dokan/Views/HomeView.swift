//
//  HomeView.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 27/04/2022.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		VStack {
			Text("Recently used cards")
				.font(.system(.title))
				.fontWeight(.medium)
				.padding(.horizontal, 20)
				.frame(maxWidth: .infinity, alignment: .leading)
			
			ScrollView(.horizontal,  showsIndicators: false) {
				HStack(alignment: .top, spacing: 0) {
					
					LargeCard()
					LargeCard()
					LargeCard()
					
				}
				.padding(.horizontal, 8)
			}
			.padding(.bottom, 20)
			
			Button("Add a new card", action: { print("Add new card") })
			
			Spacer()
			
			Button("See all your cards", action: { print("To all cards") })

		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
		.preferredColorScheme(.dark)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView().previewDevice("iPhone 13")
	}
}
