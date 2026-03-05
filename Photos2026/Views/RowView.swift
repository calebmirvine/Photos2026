//
//  RowView.swift
//  Photos2026
//
//  Created by Caleb on 2026-03-02.
//

import SwiftUI

struct RowView: View {
	@Bindable var photo: Photo
	
	var body: some View {
		VStack {
			if let uiImage = UIImage(data:photo.image){
				Image(uiImage: uiImage)
					.resizable()
					.scaledToFit()
			} else {
				Image("PlaceHolderImage")
			}
		}
		.padding()
	}
}


#Preview {
	@Previewable @State var photo =
	Photo(image: UIImage(named:"PlaceHolderImage")!.pngData()!, details: "TBA", date: Date())
	RowView(photo: photo)
}
