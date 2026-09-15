import Foundation

enum AppContent {
    static let lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

    static let blogs = [
        BlogPost(title: "What should be the proper purpose of UI and UX design?", date: "Published on May 26, 2017", imageName: "img_blog_post_1", summary: lorem),
        BlogPost(title: "Amazon increase income 1.5 Million", date: "Published on May 26, 2017", imageName: "img_blog_post_2", summary: lorem),
        BlogPost(title: "Amazon increase income 1.5 Million", date: "Published on May 26, 2017", imageName: "img_blog_post_3", summary: lorem),
        BlogPost(title: "Amazon increase income 1.5 Million", date: "Published on May 26, 2017", imageName: "img_blog_post_4", summary: lorem)
    ]

    static let portfolio = (1...8).map { PortfolioItem(imageName: "img_portfolio_item_\($0)") }

    static let work = [
        WorkStep(title: "Research and Plan", description: lorem, imageName: "img_icons_plan"),
        WorkStep(title: "Design and Develop", description: lorem, imageName: "img_icons_design"),
        WorkStep(title: "Deliver", description: lorem, imageName: "img_icons_print")
    ]

    static let team = [
        TeamMember(name: "Jack Schenziwe", role: "Project Manager", imageName: "img_team_member_1"),
        TeamMember(name: "Jack Schenziwe", role: "Project Manager", imageName: "img_team_member_2"),
        TeamMember(name: "Jack Schenziwe", role: "Project Manager", imageName: "img_team_member_3")
    ]

    static let clients = (1...5).map { ClientLogo(imageName: "img_clients_logo_client_logo_\($0)") }

    static let comments = [
        Comment(name: "Carole Marvin.", date: "15 january 2015 At 10:30 pm", text: "Ne erat velit invidunt his. Eum in dicta veniam interesset, harum fuisset te nam ea cu lupta", imageName: "img_user_1"),
        Comment(name: "Jaquan Rolfson.", date: "15 january 2015 At 10:30 pm", text: "Ne erat velit invidunt his. Eum in dicta veniam interesset, harum fuisset te nam ea cu lupta", imageName: "img_user_2"),
        Comment(name: "Bruce Bernier.", date: "15 january 2015 At 10:30 pm", text: "Ne erat velit invidunt his. Eum in dicta veniam interesset, harum fuisset te nam ea cu lupta", imageName: "img_user_3")
    ]
}
