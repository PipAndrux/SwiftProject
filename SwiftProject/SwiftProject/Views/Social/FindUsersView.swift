import SwiftUI

struct FindUsersView: View {
    
    @Binding var searchText: String
    
    let sampleUserResults: [Profile] = [
        Profile(imageName: "person.crop.circle.fill.badge.plus", title: "Elena_01"),
        Profile(imageName: "person.crop.square", title: "TravelMarco"),
        Profile(imageName: "person.crop.ellipse", title: "SofiaLovesToHike")
    ]
    
    var filteredResults: [Profile] {
        if searchText.isEmpty {
            return sampleUserResults
        } else {
            return sampleUserResults.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        
        List(filteredResults, id: \.title) { user in
            HStack {
                Image(systemName: user.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                
                Text(user.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    // TODO: Aggiungi logica per "Seguire"
                }) {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(.vertical, 4)
        }
        .listStyle(.plain)
    }
}

#Preview {
    FindUsersView(searchText: .constant("Travel"))
}
