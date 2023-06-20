//
//  DateFormatting.swift
//  MyLandmarks
//
//  Created by anupriya 06/13/2023.
//

import Foundation

func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "dd.MM.yyyy, HH:ss"
    
    let formattedDate = dateFormatter.string(from: date)
    
    return formattedDate
}
