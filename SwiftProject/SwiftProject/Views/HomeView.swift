import SwiftUI

struct HomeView: View {
    
    let samplePosts: [Post] = [
        Post(author: Profile(imageName: "person.fill", title: "Maria Rossi"),
             postImageName: "sun.max.fill",
             caption: "Amazing day on the Dolomites! The hike was challenging but the view was worth it.",
             location: "Dolomites, Italy",
             timestamp: Date().addingTimeInterval(-7200)),
        Post(author: Profile(imageName: "person.circle", title: "Luca Bianchi"),
             postImageName: "figure.wave",
             caption: "Finally relaxing in Sardinia. Crystal clear water!",
             location: "Costa Smeralda, Sardinia",
             timestamp: Date().addingTimeInterval(-172800)),
        Post(author: Profile(imageName: "person.crop.rectangle", title: "Giulia Verdi"),
             postImageName: "camera.macro.fill",
             caption: "Exploring the ancient ruins of Machu Picchu. Absolutely breathtaking.",
             location: "Cusco, Peru",
             timestamp: Date().addingTimeInterval(-360000))
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Lissone, MB")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
                
                Text("Where do we go today?")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.horizontal, 20)
                
                LazyVStack(spacing: 25) {
                    ForEach(samplePosts) { post in
                        PostCardView(post: post)
                    }
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .navigationBarHidden(true)
    }
}

#Preview{
    NavigationStack {
        HomeView()
    }
}
