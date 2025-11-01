import SwiftUI

struct FeaturedCarouselView: View {
    
    let featuredDestinations: [Excursion] = [
            Excursion(title: "Dolomiti Trek", location: "Trentino", img: "mountain.2.fill"),
            Excursion(title: "Costa Smeralda", location: "Sardegna", img: "figure.wave"),
            Excursion(title: "Sentiero degli Dei", location: "Amalfi", img: "sun.max.fill"),
        ]
    
    let title = "Featured Excursions"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                NavigationLink(destination: CategoryDetailView(title: title, excursions: featuredDestinations)) {
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(featuredDestinations) { excursion in
                        CardView(excursion: excursion)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}
