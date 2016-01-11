//
//  Story.swift
//  Storycache
//
//  Created by Kathryn McGowan (i7673473) on 07/12/2015.
//  Copyright © 2015 apple. All rights reserved.
//

import UIKit

class Story {

    var title: String!
    var images = [String]()
    var captions = [String]()
    
    init(title: String, numberOfImages: Int) {
        self.title = title
    
        for index in 1...numberOfImages {
            let imageName = title + "\(index)"
            images.append(imageName)
        }
        
    }
    
    
}












func buildStories() -> [Story] {
    
    var stories = [Story]()
    
    let storyOne = Story(title: "img", numberOfImages: 4)
    stories.append(storyOne)
    
    let storyTwo = Story(title: "image", numberOfImages: 4)
    stories.append(storyTwo)
    
    

    return stories
    
}