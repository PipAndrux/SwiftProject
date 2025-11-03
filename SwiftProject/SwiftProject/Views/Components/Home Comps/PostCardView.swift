import SwiftUI

struct PostCardView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Image(systemName: post.author.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(post.author.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(post.location)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Image(systemName: post.postImageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(post.caption)
                    .font(.body)
                
                Text(post.timeAgo)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    let previewAuthor = Profile(imageName: "person.fill", title: "Maria Rossi")
    let previewPost = Post(
        author: previewAuthor,
        postImageName: "sun.max.fill",
        caption: "Amazing day on the Dolomites! The hike was challenging but the view was worth it.",
        location: "Dolomites, Italy",
        timestamp: Date().addingTimeInterval(-7200)
    )
    
    return PostCardView(post: previewPost)
}
