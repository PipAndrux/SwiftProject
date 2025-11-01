import SwiftUI

let guestProfile = Profile(imageName: "person.circle", title: "Guest")

struct GuestProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                Image(systemName: guestProfile.imageName)
                    .font(.system(size: 60))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(guestProfile.title)
                        .font(.system(size: 30))
                    
                    HStack(spacing: 10) {
                        NavigationLink("Log In", destination: LoginView())
                            .buttonStyle(.bordered)
                            .tint(.secondary)
                        
                        NavigationLink("Sign Up", destination: RegistrationView())
                            .buttonStyle(.borderedProminent)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
        .padding(.horizontal, 30)
    }
}
#Preview{
    GuestProfileHeaderView()
}
