//
//  LargeCard.swift
//  Dokan
//
//  Created by Jorrit Verstappen on 18/05/2022.
//

import SwiftUI

struct LargeCard: View {
    var body: some View {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.foregroundColor(.blue)
					.frame(width: 250, height: 450)
				
				Text("Albert Heijn")
			}
			.padding(.vertical, 30)
			.rotation3DEffect(.degrees(-20.0), axis: (x: 0, y: 1, z: 0))
    }
}

struct LargeCard_Previews: PreviewProvider {
    static var previews: some View {
			LargeCard().previewLayout(.sizeThatFits)
    }
}
