import Foundation

enum SocialActivityType {
    case follow
    case like
    case comment
}

struct SocialActivity: Identifiable {
    let id = UUID()
    let type: SocialActivityType
    let user: Profile 
    let timestamp: Date
    
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
}
