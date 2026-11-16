import SwiftUI
//fjfguvysdgfuigui
struct AppHeader: View {
    let title: String
    let subtitle: String?
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "sparkles")
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(.white.opacity(0.16))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.system(size: 21, weight: .bold)).foregroundStyle(.white)
                if let subtitle { Text(subtitle).font(.caption).foregroundStyle(.white.opacity(0.82)) }
            }
            Spacer()
        }
        .padding(.horizontal, 18)
        .frame(height: 68)
        .background(Color.themeOrange)
    }
}

struct PageTitle: View {
    let title: String
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.themePurple, Color.themeBlue], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(spacing: 6) {
                Text(title).font(.system(size: 32, weight: .bold, design: .rounded)).foregroundStyle(.white)
                Text("SRKR • Creative Portfolio").font(.subheadline).foregroundStyle(.white.opacity(0.85))
            }
        }
        .frame(height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .padding(.horizontal)
    }
}

struct SectionTitle: View {
    let title: String
    var body: some View {
        VStack(spacing: 8) {
            Text(title).font(.system(size: 25, weight: .bold)).foregroundStyle(Color.themePurple)
            Capsule().fill(Color.themeOrange).frame(width: 48, height: 4)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Divider()
            Text("Email").foregroundStyle(.white)
            Text("steve.fruits@email.com").foregroundStyle(.white)
            Text("Phone").foregroundStyle(.white)
            Text("+880 2544 658 256").foregroundStyle(.white)
            Text("Address").foregroundStyle(.white)
            Text("125/A, CA Commercial Area, California, USA").foregroundStyle(.white).multilineTextAlignment(.center)
            Text("Copyright © \(Calendar.current.component(.year, from: Date())) Designed & Developed by Themefisher")
                .font(.caption).foregroundStyle(.white.opacity(0.75))
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.black.opacity(0.88))
    }
}
