import SwiftUI

struct Excursion: Identifiable{
    let id = UUID()
    let title: String
    let location: String
    let img: String
}

struct CardView: View {
    let excursion: Excursion
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(systemName: excursion.img)
                .resizable()
                .scaledToFill()
                .frame(width: 280, height: 180)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(alignment: .leading) {
                Text(excursion.title)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                Text(excursion.location)
                    .font(.system(size: 18))
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(width: 280, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

struct FeaturedCarouselView: View {
    let featuredDestinations: [Excursion] = [
            Excursion(title: "Dolomiti Trek", location: "Trentino", img: "mountain.2.fill"),
            Excursion(title: "Costa Smeralda", location: "Sardegna", img: "figure.wave"),
            Excursion(title: "Sentiero degli Dei", location: "Amalfi", img: "sun.max.fill"),
        ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Escursioni in evidenza")
                .font(.title2)
                .fontWeight(.bold)
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


struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Lissone, MB")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Text("Where do")
                        .font(.system(size: 40, weight: .bold))
                    Text("we go today?")
                        .font(.system(size: 40, weight: .bold))
                    
                   
                    FeaturedCarouselView()
                        .padding(.top, 20)
                    
                    Text("Altre categorie")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                    
                    // altri caroselli
                        
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
            }
            .navigationBarHidden(true) 
        }
    }
}

#Preview{
    HomeView()
}
