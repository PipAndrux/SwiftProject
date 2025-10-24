import SwiftUI



struct CardView: View {
    let excursion: Excursion
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(excursion.img)
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

struct PopularCarouselView: View {
    let popularDestinations: [Excursion] = [
        Excursion(title: "Escursione al Monte Rosa", location: "Valle d'Aosta, Italia", img: "Montagna"),
        Excursion(title: "Trekking nella Foresta Amazzonica", location: "Manaus, Brasile", img: "foresta_amazzonica_trekking"),
        Excursion(title: "Visita alle Rovine di Machu Picchu", location: "Cusco, Perù", img: "machu_picchu_rovine"),
        Excursion(title: "Safari nel Serengeti", location: "Tanzania, Africa", img: "serengeti_safari_alba")
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Escursioni popolari")
                .font(.title2)
                .fontWeight(.bold)
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

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Lissone, MB")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                    
                    Text("Where do we go today?")
                        .font(.system(size: 40, weight: .bold))
                        .padding(.horizontal, 20)
                    
                   
                    FeaturedCarouselView()
                        .padding(.top, 20)
                    
                 
                    
                    PopularCarouselView()
                        .padding(.top, 20)
                        
                    Spacer()
                    
                }
            }
            .navigationBarHidden(true) 
        }
    }
}

#Preview{
    HomeView()
}
