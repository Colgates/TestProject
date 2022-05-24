//
//  String + Extensions.swift
//  TestProjects
//
//  Created by Evgenii Kolgin on 24.05.2022.
//

import Foundation

extension String {
    
    var htmlAttributedString: NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType : NSAttributedString.DocumentType.html, .characterEncoding : String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }

    var isoDateConverter: String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let date = isoDateFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd, MMMM, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "not a valid date"
        }
    }
}

