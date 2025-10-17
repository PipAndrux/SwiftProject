import SwiftUI

struct ProfileHeaderView: View{
    let mariaProfile = UserInfo(title: "Maria", imageName: "person.crop.circle", isNew: false)
    var body: some View {
        
        VStack {
            HStack(alignment: .top, spacing: 15) {
                
                Image(systemName: mariaProfile.imageName)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(mariaProfile.title)
                        .font(.headline)
                    
                    HStack {
                        Text("Trips: 12")
                        Text("Posts: 45")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    
    
    struct ProfileView: View {
        var body: some View {
            ProfileHeaderView()
            
        }
    }
}
