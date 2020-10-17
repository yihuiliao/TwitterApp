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
        let tobeLiked = !liked
        
        if (tobeLiked){
            TwitterAPICaller.client?.likeTweet(tweetID: tweetID, success: {
                self.setLikedTweet(true)
            }, failure: {(error) in
                print("Like did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unlikeTweet(tweetID: tweetID, success: {self.setLikedTweet(false)}, failure: { (error) in
                print("Unlike did not succeed: \(error)")
            })
        }
    }

    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
            self.setRetweet(true)
        }, failure: {(error) in
            print("Retweet did not succeed: \(error)")
        })
    }
    
    var liked : Bool = false
    var retweeted : Bool = false
    var tweetID : Int = -1

    
    func setLikedTweet(_ isLiked : Bool){
        liked = isLiked
        if (liked){
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweet(_ isRetweeted : Bool){
        retweeted = isRetweeted
        if (retweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
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
