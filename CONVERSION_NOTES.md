# SRKR Django → SwiftUI MVC

The supplied project contains Django templates, Python views/models/forms, CSS/JavaScript, and static images.

This package converts the user-facing pages and interactions into SwiftUI and organizes the client app as MVC:
- Models: data structures
- Views: SwiftUI UI
- Controllers: ObservableObject state/action controllers

Converted UI routes include:
index, about, blog, blog_single, portfolio, contact, login, register,
home, products, service, aboutus, contactus, student, detail, update/delete flow,
studentreg, form, rit, get1 and post1.

Every image under static/images was copied to Assets.xcassets: 60 image assets.

The complete original supplied project is retained under OriginalSource/ so no original
template/CSS/JS/image material is lost.

Important: Django template tags such as { '{ data }' }, { '{ form.as_p }' },
{ '{ stu }' }, { '{ names }' }, { '{ c }' }, { '{ user }' },
and server constructs such as { '{ csrf_token }' } and { '{ url }' } do not have
literal SwiftUI equivalents. Their visible UI, fields, navigation, data models and client-side
behavior are represented. Django authentication/database/server/API integration is intentionally
left for the next phase rather than being falsely presented as a completed native backend.

The GET/POST demonstration keeps the original calculation behavior: first number × second number.
