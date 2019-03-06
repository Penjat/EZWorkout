//
//  ScrollStatsView.swift
//  EZWorkout
//
//  Created by Yilei Huang on 2019-03-05.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ScrollStatsView: UIView {
    @IBOutlet var scrollView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("ScrollStats", owner: self, options: nil)
        addSubview(scrollView)
        scrollView.frame = self.bounds
        scrollView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
    }
}
