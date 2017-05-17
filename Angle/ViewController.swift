//
//  ViewController.swift
//  Angle
//
//  Created by 梁雅軒 on 2017/5/17.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cycleView:CycleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cycleView = CycleView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        cycleView.center = self.view.center
        cycleView.backgroundColor = UIColor.black
        self.view.addSubview(cycleView)
    }


    @IBAction func btnOnClick(_ sender: UIButton) {
        var progress:CGFloat = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            if progress < 1 {
                self.cycleView.drawProgress(progress: progress)
                progress+=0.01
            }else{
                timer.invalidate()
            }
        }
        
    }
    
}

