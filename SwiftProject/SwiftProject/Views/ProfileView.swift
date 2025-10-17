import SwiftUI

struct Profile {
    let imageName: String
    let title: String
}
let mariaProfile = Profile(imageName: "person.circle.fill", title: "Maria Rossi")

struct BoxView: View {
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 30))
            Text(title)
                .font(.system(size: 20))

        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

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
                BoxView(title: "I Miei Viaggi", icon: "map.fill")
                BoxView(title: "Amici", icon: "person.2.fill")
            }
            
        }
        .padding(.horizontal, 30)
 
    }
    
}


struct GuestProfileHeaderView: View {
    var body: some View {
        Text("Guest Profile")
    }
}

struct SettingItem: Identifiable {
    let id = UUID()
    var title: String
    var iconName: String
}

struct SettingsProfileView: View {
    let settings: [SettingItem] = [
        SettingItem(title: "Account settings", iconName: "person.crop.circle"),
        SettingItem(title: "Get help", iconName: "questionmark.circle"),
        SettingItem(title: "Privacy", iconName: "lock.shield"),
    ]
    
    let logoutSetting = SettingItem(title: "Log out", iconName: "arrow.right.square")
    
    var isLogged = true
    
    
    var body: some View {
        Form {
            Section {
                ForEach(settings) { item in
                    NavigationLink(destination: Text("")) {
                        HStack(spacing: 15) {
                            Image(systemName: item.iconName)
                                .font(.system(size: 24))
                                .frame(width: 30)
                            Text(item.title)
                        }
                    }.listRowSeparator(.hidden)
                }
            }
            if(isLogged){
                Button(action: {}) {
                        HStack(spacing: 15) {
                            Image(systemName: logoutSetting.iconName)
                                .font(.system(size: 24))
                                .frame(width: 30)
                            Text(logoutSetting.title)
                        }
                        .foregroundColor(.red)
                    }
                    .listRowSeparator(.hidden)
            }

        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        
    }
}

    struct ProfileView: View {
        var isLogged = true
        var body: some View {
            NavigationStack{
                VStack(spacing: 30){
                    if(isLogged){
                        ProfileHeaderView()
                    } else {
                        GuestProfileHeaderView()
                    }
                    
                    Divider().padding(.horizontal, 20)
                    SettingsProfileView().padding(.vertical, -20)
                    Spacer()
                }.navigationTitle("Profile")
            }
        }
    }


#Preview {
    ProfileView()
}
