//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Le Ngoc Hoan on 2/26/17.
//  Copyright © 2017 Le Ngoc Hoan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.view.addGestureRecognizer(tapGR)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didTap(tapGR: UITapGestureRecognizer) {
        let tapPoint = tapGR.location(in: self.view)
        let shapeView = ShapeView(origin: tapPoint)
        self.view.addSubview(shapeView)
    }
}
