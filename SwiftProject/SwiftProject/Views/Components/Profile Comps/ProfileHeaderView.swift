import SwiftUI

let mariaProfile = Profile(imageName: "person.circle.fill", title: "Maria Rossi")

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            HStack(alignment: .top) {
                Image(systemName: mariaProfile.imageName)
                    .font(.system(size: 60))
                
                VStack(alignment: .leading) {
                    Text(mariaProfile.title)
                        .font(.system(size: 30))
                    
                    HStack {
                        Text("Trips: x")
                        Text("Posts: x")
                    }
                    .font(.system(size: 20))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            HStack(spacing: 15) {
                BoxView(title: "My Trips", icon: "map.fill")
                BoxView(title: "Friends", icon: "person.2.fill")
            }
            
        }
        .padding(.horizontal, 30)
    }
}

#Preview{
    ProfileHeaderView()
}
