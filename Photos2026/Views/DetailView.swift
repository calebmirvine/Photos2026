//
//  DetailView.swift
//  Photos2026
//
//  Created by Caleb on 2026-03-02.
//

import SwiftUI
import SwiftData
import Photos

struct DetailView: View {
	@State private var pickerVisible = false
	@State private var showCameraAlert = false
	@State private var imageSource = UIImagePickerController.SourceType.camera
	
	@Bindable var photo: Photo
	
	var formattedDate: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .short
		dateFormatter.timeStyle = .short
		return dateFormatter.string(from: photo.date)
	}
	
	var body: some View {
		ZStack{
			VStack{
				RowView(photo: photo)
				TextField(photo.details, text: $photo.details)
					.multilineTextAlignment(.center)
				Text("Taken on: \(formattedDate)")
			}
			if pickerVisible {
				ImageView(
					pickerVisible: $pickerVisible,
					sourceType: $imageSource,
					action: {
						(value) in
						if let image = value {
							DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
								self.photo.image = image.pngData() ?? UIImage(named: "PlaceholderImage")!.pngData()!
							}
						}
					}
				)
			}
		}
		.toolbar {
			ToolbarItemGroup {
				Button(
					action: {
						AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
							if response && UIImagePickerController.isSourceTypeAvailable(.camera) {
								self.showCameraAlert = false
								self.imageSource = .camera
								self.pickerVisible.toggle()
							} else {
								self.showCameraAlert = true
							}
						}
					},
					label: {
						Image(systemName: "camera")
					}
				)
			}
		}
		.alert(isPresented: $showCameraAlert) {
			Alert(title: Text("Error"), message: Text("Camera not available"), dismissButton: .default(Text("OK")))
		}
	}
}

#Preview {
	@Previewable @State var photo =
	Photo(image: UIImage(named:"PlaceHolderImage")!.pngData()!, details: "TBA", date: Date())
	DetailView(photo: photo)
}
