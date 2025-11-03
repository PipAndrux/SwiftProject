import SwiftUI

struct PopularCarouselView: View {
    
    let popularDestinations: [Excursion] = [
        Excursion(title: "Mount Rosa Hiking", location: "Valle d'Aosta, Italy", img: "mountain.2.fill"),
        Excursion(title: "Amazon Trekking", location: "Manaus, Brazil", img: "tree.fill"),
        Excursion(title: "Machu Picchu", location: "Cusco, Peru", img: "camera.macro"),
        Excursion(title: "Serengeti Safari", location: "Tanzania, Africa", img: "tortoise.fill")
    ]
    
    let title = "Popular Excursions"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                NavigationLink(destination: CategoryDetailView(title: title, excursions: popularDestinations)) {
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(popularDestinations) { excursion in
                        CardView(excursion: excursion)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}
