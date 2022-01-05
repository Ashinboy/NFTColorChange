//
//  designableSlider.swift
//  NFTColorChange
//
//  Created by Ashin Wang on 2022/1/3.
//

import UIKit

class designableSlider: UISlider {
    @IBInspectable var thumbImage: UIImage?{
        didSet{
            setThumbImage(thumbImage, for: .normal)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
