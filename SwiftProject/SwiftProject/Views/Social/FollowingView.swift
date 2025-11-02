import SwiftUI

struct FollowingView: View {
    
    let followingUsers: [Profile] = [
        Profile(imageName: "person.fill", title: "Maria Rossi"),
        Profile(imageName: "person.circle", title: "Luca Bianchi"),
        Profile(imageName: "person.crop.rectangle", title: "Giulia Verdi")
    ]
    
    var body: some View {
        List(followingUsers, id: \.title) { user in
            HStack {
                Image(systemName: user.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                
                Text(user.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("Unfollow")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .foregroundColor(.primary)
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}

#Preview {
    FollowingView()
}
