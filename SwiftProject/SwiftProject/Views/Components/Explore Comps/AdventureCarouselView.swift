import SwiftUI

struct AdventureCarouselView: View {
    
    let adventureDestinations: [Excursion] = [
        Excursion(title: "Rock Climbing", location: "Arco, Italy", img: "figure.climbing"),
        Excursion(title: "Surfing Lessons", location: "Maui, Hawaii", img: "figure.surfing"),
        Excursion(title: "Paragliding", location: "Interlaken, CH", img: "figure.fall")
    ]
    
    let title = "Adventure"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                NavigationLink(destination: CategoryDetailView(title: title, excursions: adventureDestinations)) {
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(adventureDestinations) { excursion in
                        CardView(excursion: excursion)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}
