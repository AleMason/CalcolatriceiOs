//
//  ViewController.swift
//  iOS-D12-Calc
//
//  Created by Paolo Faccini on 12/06/2019.
//  Copyright © 2019 Paolo Faccini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt1: UILabel!
    @IBOutlet var numArray: [UIButton]!
    
    var val1 : Double = 0
    var curOp : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txt1.text = ""
        
        numArray = numArray.sorted(by: {
            $0.tag < $1.tag
        })
        
        for var i in 0..<numArray.count {
            var b = numArray[i]
            b.setTitle(b.currentTitle, for: .normal)
        }
        
        
    }
  
    @IBAction func numClick(_ sender: UIButton) {
        
        txt1.text = txt1.text! + (sender.titleLabel?.text ?? "")
   
    }
    
    @IBAction func clear(_ sender: UIButton) {
        
        txt1.text = ""
    }
    
    @IBAction func opProc(_ sender: UIButton) {
        
        var op = sender.tag
        
        if op < 5  || op == 7 {
            
            curOp = op
            
            if let v1 = Double(txt1.text!) {
                val1 = v1
            }
            
            txt1.text = ""
            
        } else if op > 5 {
            
            var res : Double = 0
            curOp = op
            
            if let v1 = Double(txt1.text!) {
                val1 = v1
            }
            
            switch curOp {
                
            case 6: res = val1.squareRoot()
            case 8: res = log(val1)
            case 9: res = abs(val1)
            case 10: res = sin(val1)
            case 11: res = cos(val1)
            case 12: res = tan(val1)
            case 13: res = floor(val1)
            case 14: res = round(val1)
            default: print("error")
                
            }
            
            txt1.text = String(res)
            
        } else {
            
            // Tasto =
            
            if let v2 = Double(txt1.text!) {
            
                var res:Double = 0
                
                switch curOp {
                case 1: res = val1 + v2
                case 2: res = val1 - v2
                case 3: res = val1 * v2
                case 4: res = val1 / v2
                // case 6: res = val1.squareRoot()
                case 7: res = pow(val1, v2)
                /* case 8: res = log(val1)
                case 9: res = abs(val1)
                case 10: res = sin(val1)
                case 11: res = cos(val1)
                case 12: res = tan(val1)
                case 13: res = floor(val1)
                case 14: res = round(val1)*/
                default: print("error")
                }
                
                txt1.text = String(res)
                
            }
            
        }
        
 
    }
}

