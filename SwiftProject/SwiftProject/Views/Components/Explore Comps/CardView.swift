import SwiftUI

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
