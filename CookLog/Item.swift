//
//  Item.swift
//  CookLog
//
//  Created by  유 주연 on 1/12/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

enum CookCatregory: Int, Hashable {
    case spoon = 0
    case chopstics
    case fork
    case hand
    
    
    static var allCases: [CookCatregory] = [.spoon, .chopstics, .fork, .hand]
    
    var imageKey: String {
        switch self {
        case .spoon: "circle"
        case .chopstics: "square"
        case .fork: "rectangle"
        case .hand: "triangle"
        }
    }
}

@Model
final class Cook {
    var isNew: Bool
    var title: String
    var desc: String?
    var category: Int
    var count: Int
    var reference: URL?
    var photoFilename: String?
    var colorHex: String?
//    var rating: double
    

    init(
        isNew: Bool,
        title: String,
        desc: String?,
        category: Int,
        count: Int = 1,
        reference: URL? = nil,
        photoFilename: String? = nil,
        colorHex: String? = nil
    ) {
        self.isNew = isNew
        self.title = title
        self.desc = desc
        self.category = category
        self.count = count
        self.reference = reference
        self.photoFilename = photoFilename
        self.colorHex = colorHex
    }
}

@Model
final class Rate {
    var cook: Cook
    var rate: Int
    var desc: String?
    var nextTimeTip: String?
    var photoFilename: String?
    
    init(
        cook: Cook,
        rate: Int,
        desc: String? = nil,
        nextTimeTip: String? = nil,
        photoFilename: String? = nil
    ) {
        self.cook = cook
        self.rate = rate
        self.desc = desc
        self.nextTimeTip = nextTimeTip
        self.photoFilename = photoFilename
    }
}
