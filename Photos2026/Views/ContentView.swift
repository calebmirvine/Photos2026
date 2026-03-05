//  ContentView.swift
//  Photos2026
//
//  Created by Caleb on 2026-03-02.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Query private var photoLog: [Photo]
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		NavigationStack {
			List{
				ForEach(photoLog, id: \.self){ photo in
					NavigationLink {
						DetailView(photo: photo)
					} label: {
						RowView(photo: photo)
					}
				}
				.onDelete {
					if let index = $0.first {
						modelContext.delete(photoLog[index])
					}
				}
			}
			.toolbar {
				ToolbarItemGroup{
					HStack{
						EditButton()
						Button {
							modelContext.insert(Photo())
						} label: {
							Image(systemName: "plus")
						}
					}
				}
			}
			.padding()
		}
	}
}


#Preview {
	ContentView()
		.modelContainer(for: Photo.self)
}

