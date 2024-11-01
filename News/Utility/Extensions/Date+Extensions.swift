//
//  Date+Extensions.swift
//  News
//
//  Created by Yosafat.H.S on 02/11/24.
//

import Foundation

extension Date {
    // Format the date to a string using the specified format
    func formattedString(using format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    // Format the date to a string in a default format (e.g., "yyyy-MM-dd")
    func toDefaultString() -> String {
        return self.formattedString(using: "yyyy-MM-dd")
    }
    
    // Format the date to a string in a readable format (e.g., "MMMM d, yyyy")
    func toReadableString() -> String {
        return self.formattedString(using: "MMMM d, yyyy")
    }
    
    // Format the date to a string in a short style (e.g., "MM/dd/yyyy")
    func toShortString() -> String {
        return self.formattedString(using: "MM/dd/yyyy")
    }
    
    // Format the date to a string in a time style (e.g., "hh:mm a")
    func toTimeString() -> String {
        return self.formattedString(using: "hh:mm a")
    }
    
    // Create a date from a string using a specified format
    static func fromString(_ dateString: String, format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }
}
