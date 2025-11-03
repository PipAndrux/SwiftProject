import SwiftUI

struct RelaxCarouselView: View {
    
    let relaxDestinations: [Excursion] = [
        Excursion(title: "Yoga Retreat", location: "Bali, Indonesia", img: "figure.yoga"),
        Excursion(title: "Spa Weekend", location: "Tuscany, Italy", img: "bed.double.fill"),
        Excursion(title: "Beach Time", location: "Maldives", img: "beach.umbrella.fill")
    ]
    
    let title = "Relaxation"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                
                NavigationLink(destination: CategoryDetailView(title: title, excursions: relaxDestinations)) {
                    Image(systemName: "arrow.right")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(relaxDestinations) { excursion in
                        CardView(excursion: excursion)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            }
        }
    }
}
