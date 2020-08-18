//
//  Post.swift
//  InstaClone
//
//  Created by Flo on 18/08/2020.
//  Copyright © 2020 Flo. All rights reserved.
//

import Foundation

class Post: Identifiable {
    
    var id = UUID()
    let author: Author
    let imageName: String
    let comment: String
    let creationDate: Date
    var likes: Int = 0
    var isBookmarked = false
    
    internal init(id: UUID = UUID(), author: Author, imageName: String, comment: String, creationDate: Date, likes: Int = 0, isBookmarked: Bool = false) {
        self.id = id
        self.author = author
        self.imageName = imageName
        self.comment = comment
        self.creationDate = creationDate
        self.likes = likes
        self.isBookmarked = isBookmarked
    }
    
    static var all = [
        Post(author: Author.all[0], imageName: "p1", comment: "What a beautiful house 🤩", creationDate: Date().addingTimeInterval(-2000)),
        Post(author: Author.all[1], imageName: "p2", comment: "#NightShot", creationDate: Date().addingTimeInterval(-6000)),
        Post(author: Author.all[2], imageName: "p3", comment: "Quiet and restful day", creationDate: Date().addingTimeInterval(-12000)),
        Post(author: Author.all[3], imageName: "p4", comment: "Amazing bridge", creationDate: Date().addingTimeInterval(-32000)),
        Post(author: Author.all[4], imageName: "p5", comment: "Venice with friends", creationDate: Date().addingTimeInterval(-52000)),
        Post(author: Author.all[5], imageName: "p6", comment: "Caribbean Quenn #BillyOcean", creationDate: Date().addingTimeInterval(-76000))
        ]
}
