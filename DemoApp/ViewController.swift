//
//  ViewController.swift
//  DemoApp
//
//  Created by Ranosys on 10/10/14.
//  Copyright (c) 2014 Ranosys. All rights reserved.
//

import UIKit
class MyTextField : UITextField {
    var leftTextMargin : CGFloat = 0.0
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        var newBounds = bounds
        newBounds.origin.x += leftTextMargin
        return newBounds
    }
}

class ViewController: UIViewController ,UITextFieldDelegate
{

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password1: UITextField!
    
    @IBOutlet weak var password2: UITextField!
    
    @IBOutlet weak var password3: UITextField!
    @IBOutlet weak var password4: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
         email.delegate=self
        password1.delegate=self
        password2.delegate=self
        password3.delegate=self
        password4.delegate=self
        
        let tf = MyTextField(frame: CGRect(x: 0, y: 0, width: 296, height: 44))
        tf.leftTextMargin = 36
        tf.delegate=self
        tf.placeholder="Email"
        tf.setNeedsLayout()
        tf.layoutIfNeeded()
        email.addSubview(tf)
        email.autocorrectionType = UITextAutocorrectionType.No
        
         self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 560);

    }
   
    override func viewDidLayoutSubviews() { // [5]
        super.viewDidLayoutSubviews()
        let padding = CGFloat(11)
        var label = UILabel(frame: CGRectMake(10, 0, 7, 26))
        email.leftView = label;
        
        //email.leftViewMode = UITextFieldViewMode
        //email?.frame = CGRectMake(padding, self.topLayoutGuide.length + 50, view.frame.size.width - padding * 2, 41)
        //paddingView.frame=CGRectMake(15, 0, 296, 41)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    @IBAction func login(sender: AnyObject)
    {
//         let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = LoginView(nibName: "LoginView", bundle: nil)
//       navigationController?.pushViewController(vc, animated: true)
        let loginView=self.storyboard?.instantiateViewControllerWithIdentifier("LoginView") as LoginView
        self.navigationController?.pushViewController(loginView, animated: true)
    }

  
}

