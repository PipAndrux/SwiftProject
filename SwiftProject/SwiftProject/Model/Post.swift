import Foundation

struct Post: Identifiable {
    let id = UUID()
    
    let author: Profile
    
    let postImageName: String
    let caption: String
    let location: String
    let timestamp: Date
    
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
}
