import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                PageTitle(title: "Hello..AP..BYE..BYE..YCP.")
                VStack(alignment: .leading, spacing: 12) {
                    Text("This is my Home page.").font(.title2.bold())
                    Text("kayal")
                    Text("karthick • raju • praveen").foregroundStyle(Color.themeOrange)
                }.padding(.horizontal)

                SectionTitle(title: "Skills")
                Skill(title: "Web Design", value: 90)
                Skill(title: "Logo Design", value: 60)
                Skill(title: "After Effects", value: 80)
                Skill(title: "Web App", value: 70)

                SectionTitle(title: "Experience")
                Experience(image: "img_experience_icon_1", dates: "Jan 2007 - Feb 2009", role: "Junior UX Designer", company: "WEBEX")
                Experience(image: "img_experience_icon_2", dates: "Mar 2009 - Aug 2014", role: "UX & UI Designer", company: "AUGMEDIX")
                Experience(image: "img_experience_icon_3", dates: "Sep 2014 - Present", role: "Senior UI Designer", company: "THEMEFISHER")

                SectionTitle(title: "Education")
                Education(year: "2006", title: "Marters in UX Design", school: "Masassusets Institute of Technology")
                Education(year: "2004", title: "Honours in Fine Arts", school: "Harvard University")
                Education(year: "2000", title: "Higher Secondary Certificat", school: "Cardiff School")
                Education(year: "1998", title: "Secondary School Certificate", school: "Cardiff School")

                SectionTitle(title: "Services")
                ForEach(["UI Design", "UX Design", "Interaction Design"], id: \.self) { title in
                    VStack(spacing: 8) {
                        Image(systemName: "paintbrush.pointed.fill").font(.largeTitle).foregroundStyle(Color.themeOrange)
                        Text(title).font(.headline)
                        Text(AppContent.lorem).font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                    }.padding().frame(maxWidth: .infinity).background(.white).clipShape(RoundedRectangle(cornerRadius: 18)).shadow(radius: 4)
                        .padding(.horizontal)
                }

                SectionTitle(title: "Portfolio")
                PortfolioGrid()

                SectionTitle(title: "Testimonials")
                TestimonialCard()
                TestimonialCard()
                TestimonialCard()
                FooterView()
            }.padding(.vertical)
        }
        .navigationTitle("Home")
    }
}

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                PageTitle(title: "Hello..AP..BYE..BYE..YCP.")
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("myself gupta i am currently pursuing my btech in srkr engineering college i am big fan and follower of power star pavan kalyan.")
                        Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.")
                        Text("Deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.")
                    }
                    AssetImage(name: "img_about_gupta", mode: .fill)
                        .frame(width: 135, height: 165).clipShape(RoundedRectangle(cornerRadius: 18))
                }.padding(.horizontal)

                AssetImage(name: "img_about_pspk").frame(width: 170, height: 65)
                Text("BABULAKE BABU KALYAN BABU").font(.caption.bold())

                SectionTitle(title: "Work Process")
                ForEach(AppContent.work) { item in
                    HStack(spacing: 15) {
                        AssetImage(name: item.imageName).frame(width: 60, height: 60)
                        VStack(alignment: .leading) { Text(item.title).font(.headline); Text(item.description).font(.caption).foregroundStyle(.secondary) }
                    }.padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 18)).shadow(radius: 4).padding(.horizontal)
                }

                SectionTitle(title: "My Team")
                ForEach(AppContent.team) { member in
                    VStack {
                        AssetImage(name: member.imageName).frame(height: 180)
                        Text(member.name).font(.headline)
                        Text(member.role).foregroundStyle(.white.opacity(0.75))
                    }.padding().frame(maxWidth: .infinity).background(Color.themePurple).foregroundStyle(.white).clipShape(RoundedRectangle(cornerRadius: 18)).padding(.horizontal)
                }

                SectionTitle(title: "My Clients")
                ClientStrip()
                FooterView()
            }.padding(.vertical)
        }.navigationTitle("About")
    }
}

struct BlogView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                PageTitle(title: "Blogs")
                ForEach(AppContent.blogs) { post in
                    NavigationLink { BlogSingleView(post: post) } label: { BlogCard(post: post) }.buttonStyle(.plain)
                }
                SectionTitle(title: "Contact Info")
                ContactForm()
                FooterView()
            }.padding(.vertical)
        }.navigationTitle("Blog")
    }
}

struct BlogSingleView: View {
    let post: BlogPost
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PageTitle(title: "Blogs")
                Text(post.title).font(.system(size: 28, weight: .bold))
                Text(post.date).foregroundStyle(.secondary)
                AssetImage(name: post.imageName, mode: .fill).frame(height: 230).clipShape(RoundedRectangle(cornerRadius: 18))
                Text(AppContent.lorem); Text(AppContent.lorem); Text(AppContent.lorem)
                Text("Comments 03").font(.title2.bold())
                ForEach(AppContent.comments) { c in CommentRow(comment: c) }
                Text("Leave a Comment").font(.title2.bold())
                TextEditor(text: .constant("")).frame(height: 130).overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.2)))
                SectionTitle(title: "Similar Stories")
                ForEach(AppContent.blogs.dropFirst().prefix(3)) { post in BlogCard(post: post) }
                FooterView()
            }.padding()
        }.navigationTitle("Blog")
    }
}

struct PortfolioView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                PageTitle(title: "Portfolio")
                PortfolioGrid()
                SectionTitle(title: "My Clients")
                ClientStrip()
                SectionTitle(title: "Contact Info")
                ContactForm()
                FooterView()
            }.padding(.vertical)
        }.navigationTitle("Portfolio")
    }
}

struct ContactView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                PageTitle(title: "Contacts")
                SectionTitle(title: "Contact Info")
                ContactForm()
                HStack(spacing: 8) {
                    Info(title: "Email", value: "steve.fruits@email.com", icon: "envelope")
                    Info(title: "Phone", value: "+880 2544 658 256", icon: "phone")
                    Info(title: "Address", value: "125/A, CA Commercial Area, California, USA", icon: "location")
                }.padding(.horizontal)
                FooterView()
            }.padding(.vertical)
        }.navigationTitle("Contact")
    }
}

private struct Skill: View {
    let title: String; let value: Int
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Text(title).font(.headline); Spacer(); Text("\(value)%").foregroundStyle(Color.themeOrange) }
            ProgressView(value: Double(value), total: 100).tint(Color.themeOrange)
        }.padding(.horizontal)
    }
}

private struct Experience: View {
    let image: String; let dates: String; let role: String; let company: String
    var body: some View {
        HStack(spacing: 14) {
            AssetImage(name: image).frame(width: 52, height: 52)
            VStack(alignment: .leading) { Text(dates).font(.caption).foregroundStyle(.secondary); Text(role).font(.headline); Text(company).foregroundStyle(Color.themePurple) }
            Spacer()
        }.padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 16)).shadow(radius: 4).padding(.horizontal)
    }
}

private struct Education: View {
    let year: String; let title: String; let school: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(year).font(.caption).foregroundStyle(Color.themeOrange)
            Text(title).font(.headline); Text(school).foregroundStyle(.secondary)
        }.frame(maxWidth: .infinity, alignment: .leading).padding().background(Color.themeOrange.opacity(0.07)).clipShape(RoundedRectangle(cornerRadius: 16)).padding(.horizontal)
    }
}

private struct PortfolioGrid: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 14)], spacing: 14) {
            ForEach(AppContent.portfolio) { item in
                VStack(spacing: 8) {
                    AssetImage(name: item.imageName, mode: .fill).frame(height: 150).clipShape(RoundedRectangle(cornerRadius: 16))
                    Text("view project").font(.caption.bold()).foregroundStyle(.white).padding(.horizontal, 12).padding(.vertical, 7).background(Color.themeOrange).clipShape(Capsule())
                }
            }
        }.padding(.horizontal)
    }
}

private struct BlogCard: View {
    let post: BlogPost
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AssetImage(name: post.imageName, mode: .fill).frame(height: 180).clipShape(RoundedRectangle(cornerRadius: 16))
            Text(post.title).font(.headline).foregroundStyle(Color.themePurple)
            Text(post.summary).font(.subheadline).foregroundStyle(.secondary)
            Text("Read More →").font(.caption.bold()).foregroundStyle(Color.themeOrange)
        }.padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 20)).shadow(radius: 5).padding(.horizontal)
    }
}

private struct CommentRow: View {
    let comment: Comment
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AssetImage(name: comment.imageName, mode: .fill).frame(width: 52, height: 52).clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
                Text(comment.name).font(.headline); Text(comment.date).font(.caption).foregroundStyle(.secondary); Text(comment.text).font(.subheadline)
            }
        }.padding().background(.gray.opacity(0.06)).clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

private struct ClientStrip: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(AppContent.clients + AppContent.clients) { item in
                    AssetImage(name: item.imageName).frame(width: 100, height: 60).padding().background(.white).clipShape(RoundedRectangle(cornerRadius: 12)).shadow(radius: 3)
                }
            }.padding(.horizontal)
        }
    }
}

private struct ContactForm: View {
    @State private var name = ""; @State private var email = ""; @State private var message = ""
    var body: some View {
        VStack(spacing: 12) {
            Text("Contact Form").font(.title3.bold())
            TextField("Full Name", text: $name).textFieldStyle(.roundedBorder)
            TextField("Email Address", text: $email).textFieldStyle(.roundedBorder).keyboardType(.emailAddress)
            TextEditor(text: $message).frame(height: 120).overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2)))
            Button("send") {}.font(.headline).foregroundStyle(.white).frame(maxWidth: .infinity).frame(height: 48).background(Color.themeOrange).clipShape(RoundedRectangle(cornerRadius: 12))
        }.padding(18).background(.white).clipShape(RoundedRectangle(cornerRadius: 20)).shadow(radius: 5).padding(.horizontal)
    }
}

private struct Info: View {
    let title: String; let value: String; let icon: String
    var body: some View {
        VStack(spacing: 7) { Image(systemName: icon).foregroundStyle(Color.themeOrange); Text(title).font(.headline); Text(value).font(.caption).multilineTextAlignment(.center) }.frame(maxWidth: .infinity)
    }
}

private struct TestimonialCard: View {
    var body: some View {
        VStack(spacing: 10) {
            AssetImage(name: "img_testimonial_client_1").frame(width: 90, height: 90).clipShape(Circle())
            Text(AppContent.lorem).multilineTextAlignment(.center).foregroundStyle(.white)
            Text("Jesica Gomez").font(.headline).foregroundStyle(.white)
            Text("CEO, Funder").foregroundStyle(.white.opacity(0.75))
        }.padding(22).frame(maxWidth: .infinity).background(Color.themePurple).clipShape(RoundedRectangle(cornerRadius: 22)).padding(.horizontal)
    }
}

struct AssetImage: View {
    let name: String
    var mode: ContentMode = .fit
    var body: some View { Image(name).resizable().aspectRatio(contentMode: mode) }
}
