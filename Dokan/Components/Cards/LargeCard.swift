//
//  LargeCard.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 18/05/2022.
//

import SwiftUI

struct LargeCard: View {
	// MARK: PROPERTIES
	var color: Color = .green
	
	// MARK: BODY
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundColor(color)
				.frame(width: 250, height: 450)
			
			Text("Albert Heijn")
		}
	}
}

// MARK: PREVIEW
struct LargeCard_Previews: PreviewProvider {
	static var previews: some View {
		LargeCard(color: Color("Test")).previewLayout(.sizeThatFits)
	}
}
