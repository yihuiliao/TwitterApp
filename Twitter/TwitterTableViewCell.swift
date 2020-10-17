//
//  TwitterTableViewCell.swift
//  Twitter
//
//  Created by Yihui Liao on 10/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit




class TwitterTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func like(_ sender: Any) {
    }

    @IBAction func retweet(_ sender: Any) {
    }
    
    var liked : Bool = false
    
    func setLikedTweet(_ isLiked : Bool){
        liked = isLiked
        if (liked){
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {           likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
