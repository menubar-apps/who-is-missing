//
//  Extension.swift
//  whosmissing
//
//  Created by Pavel Makhov on 2024-05-04.
//

import Foundation

extension TimeInterval {
    func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy, HH:mm zzz"
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}
