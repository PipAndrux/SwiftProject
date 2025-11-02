import SwiftUI

struct ExploreView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Don't know what to do?")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.horizontal, 20)
                
                FeaturedCarouselView()
                
                PopularCarouselView()
                
                AdventureCarouselView()
                
                RelaxCarouselView()
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    NavigationStack {
        ExploreView()
    }
}
