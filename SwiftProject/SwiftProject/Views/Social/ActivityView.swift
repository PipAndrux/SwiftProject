import SwiftUI

struct ActivityView: View {
    
    let sampleActivities: [SocialActivity] = [
        SocialActivity(type: .follow,
                       user: Profile(imageName: "person.crop.circle.fill.badge.plus", title: "Elena_01"),
                       timestamp: Date().addingTimeInterval(-3600)),
        SocialActivity(type: .like,
                       user: Profile(imageName: "person.circle", title: "Luca Bianchi"),
                       timestamp: Date().addingTimeInterval(-14400)),
        SocialActivity(type: .comment,
                       user: Profile(imageName: "person.fill", title: "Maria Rossi"),
                       timestamp: Date().addingTimeInterval(-86400))
    ]
    
    var body: some View {
        List(sampleActivities) { activity in
            ActivityRowView(activity: activity)
                .padding(.vertical, 8)
        }
        .listStyle(.plain)
    }
}

struct ActivityRowView: View {
    
    let activity: SocialActivity
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: activity.user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Text(activity.user.title)
                        .fontWeight(.semibold)
                    Text(activityText)
                        .lineLimit(2)
                }
                Text(activity.timeAgo)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: activityIcon)
                .font(.title2)
                .foregroundColor(activityColor)
        }
    }
    
    private var activityText: String {
        switch activity.type {
        case .follow:
            return "started following you."
        case .like:
            return "liked your post."
        case .comment:
            return "commented on your post."
        }
    }
    
    private var activityIcon: String {
        switch activity.type {
        case .follow:
            return "person.fill.checkmark"
        case .like:
            return "heart.fill"
        case .comment:
            return "bubble.left.fill"
        }
    }
    
    private var activityColor: Color {
        switch activity.type {
        case .follow:
            return .blue
        case .like:
            return .red
        case .comment:
            return .secondary
        }
    }
}

#Preview {
    ActivityView()
}
