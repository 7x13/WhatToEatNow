//
//  SelectViewController.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/10/22.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import Foundation
import UIKit

class SelectViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var camera: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPicEvent(sender: UIButton) {
        var sourceType : UIImagePickerControllerSourceType = .Camera
        var picker : UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = sourceType
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
}