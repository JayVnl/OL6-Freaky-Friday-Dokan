//
//  LargeCard.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 18/05/2022.
//

import SwiftUI

struct LargeCard: View {
	// MARK: PROPERTIES
	var store: StoreModel.Store
	
	// MARK: BODY
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundColor(.green)
				.frame(width: 250, height: 450)
			
			Text("\(store.data.name[0].text)")
		}
	}
}

// MARK: PREVIEW
//struct LargeCard_Previews: PreviewProvider {
//	static var previews: some View {
//		LargeCard(store: ).previewLayout(.sizeThatFits)
//	}
//}
