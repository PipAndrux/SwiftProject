import SwiftUI

struct ProfileView: View {
    
    @State private var isLogged = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                
                if(isLogged) {
                    ProfileHeaderView()
                } else {
                    GuestProfileHeaderView()
                }
                
                Divider().padding(.horizontal, 20)
                
                SettingsProfileView(isLogged: isLogged)
                    .padding(.vertical, -20)
                
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
