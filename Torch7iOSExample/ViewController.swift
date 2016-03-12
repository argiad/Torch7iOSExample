//
//  ViewController.swift
//  Torch7iOSExample
//
//  Created by Adrian Dawid on 12.03.16.
//  Copyright © 2016 Adrian Dawid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vm = init_torch_vm()
        run_torch_script(vm, "/lua/main.lua")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

