import SwiftUI

struct ProfileHeaderView: View{
    let mariaProfile = UserInfo(title: "Maria", imageName: "person.crop.circle", isNew: false)
    var body: some View {
        //GeometryReader{geometry in
        VStack{
                HStack{
                    Image(systemName: mariaProfile.imageName)
                    Text(mariaProfile.title)
                }
                .padding(20)
                //.frame(width: geometry.size.width * 0.8)
                .background(Color(.systemGray6))
                .cornerRadius(12)

                
            }
        .frame(alignment: .leading)
            
        //}

        
    }
}


struct ProfileView: View {
    var body: some View {
        ProfileHeaderView()

            }
        }
