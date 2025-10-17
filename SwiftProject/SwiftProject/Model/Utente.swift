import SwiftUI

struct UserInfo: Identifiable{
    let id = UUID()
    let title: String
    let imageName: String
    let isNew: Bool
}
