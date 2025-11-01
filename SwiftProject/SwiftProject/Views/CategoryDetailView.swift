import SwiftUI

struct CategoryDetailView: View {
    
    let title: String
    let excursions: [Excursion]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(excursions) { excursion in
                    CardView(excursion: excursion)
                }
            }
            .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CategoryDetailView(
            title: "Featured",
            excursions: [
                Excursion(title: "Dolomiti Trek", location: "Trentino", img: "mountain.2.fill")
            ]
        )
    }
}
