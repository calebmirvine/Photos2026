//
//  File.swift
//  Photos2026
//
//  Created by Caleb on 2026-03-02.
//

//Reference
//https://developer.apple.com/tutorials/develop-in-swift/collect-model-and-store-data

import Foundation
import SwiftData
import UIKit

@Model
class Photo {
	var image: Data
	var details: String
	var date: Date
		
	init(image: Data = UIImage(named: "PlaceHolderImage")!.pngData()!, details: String = "TBA", date: Date = .now) {
		self.image = image
		self.details = details
		self.date = date
	}

}
