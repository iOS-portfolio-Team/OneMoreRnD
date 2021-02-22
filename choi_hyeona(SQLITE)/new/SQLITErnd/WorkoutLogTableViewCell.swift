//
//  WorkoutLogTableViewCell.swift
//  SQLITErnd
//
//  Created by nina on 2021/02/18.
//

import UIKit

class WorkoutLogTableViewCell: UITableViewCell {

    @IBOutlet weak var exerciseName: UILabel!
    
    @IBOutlet weak var exerciseImage: UIImageView!
    
    @IBOutlet weak var exerciseWhen: UILabel!
    
    @IBOutlet weak var exerciseJudgment: UILabel!
    
    @IBOutlet weak var exerciseComment: UITextView!
    

    @IBOutlet weak var exerciseSequenceNumer: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
