//
//  TimeConverter.swift
//  TimeConverter
//
//  Created by Amber Spadafora on 10/8/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import SwiftUI

class TimeConverter: ObservableObject {
    static var units = ["seconds", "minutes", "hours", "days"]
    static func secondsToMinutes(seconds: Double) -> Double {
        print("\(seconds) / 60.0 = \(seconds / 60.0)")
        return seconds / 60.0
    }
    static func secondsToHours(seconds: Double) -> Double {
        return seconds / 3600.0
    }
    static func secondsToDays(seconds: Double) -> Double {
        return seconds / 86400.0
    }
    
    static func minutesToSeconds(minutes: Double) -> Double {
        return minutes * 60.0
    }
    static func minutesToHours(minutes: Double) -> Double {
        return minutes / 60.0
    }
    static func minutesToDays(minutes: Double) -> Double {
        return minutes / 1440.0
    }
    
    static func hoursToSeconds(hours: Double) -> Double {
        return hours * 3600.0
    }
    static func hoursToMinutes(hours: Double) -> Double {
        return hours * 60.0
    }
    static func hoursToDays(hours: Double) -> Double {
        return hours / 24.0
    }
    
    static func daysToSeconds(days: Double) -> Double {
        return days * 86400.0
    }
    static func daysToMinutes(days: Double) -> Double {
        return days * 1440.0
    }
    static func daysToHours(days: Double) -> Double {
        return days * 24.0
    }
    
    @Published var originalUnit: Int = 0
    @Published var convertedUnit: Int = 0
    
    func convert(original: Double) -> Double {
        switch TimeConverter.units[originalUnit] {
        case "seconds":
            switch TimeConverter.units[convertedUnit] {
            case "minutes":
                return TimeConverter.secondsToMinutes(seconds: original)
            case "hours":
                return TimeConverter.secondsToHours(seconds: original)
            case "days":
                return TimeConverter.secondsToDays(seconds: original)
            default:
                return original
            }
        
        case "minutes":
            switch TimeConverter.units[convertedUnit] {
            case "seconds":
                return TimeConverter.minutesToSeconds(minutes: original)
            case "hours":
                return TimeConverter.minutesToHours(minutes: original)
            case "days":
                return TimeConverter.minutesToDays(minutes: original)
            default:
                return original
            }
        
        case "hours":
            switch TimeConverter.units[convertedUnit] {
            case "seconds":
                return TimeConverter.hoursToSeconds(hours: original)
            case "minutes":
                return TimeConverter.hoursToMinutes(hours: original)
            case "days":
                return TimeConverter.hoursToDays(hours: original)
            default:
                return original
            }
        
        case "days":
            switch TimeConverter.units[convertedUnit] {
            case "seconds":
                return TimeConverter.daysToSeconds(days: original)
            case "minutes":
                return TimeConverter.daysToMinutes(days: original)
            case "hours":
                return TimeConverter.daysToHours(days: original)
            default:
                return original
            }
        
        default:
            return original
        }
        
    }
}
