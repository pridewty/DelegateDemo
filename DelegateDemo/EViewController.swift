//  E控制器
//  EViewController.swift
//  DelegateDemo
//  Created by 王泰贻 on 2019/6/19.
//  Copyright © 2019 ricepo. All rights reserved.

import UIKit


class EViewController: UIViewController {

    var button:UIButton?
    var valueLabel:UILabel?
    var textField:UITextField?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        self.title = "E"
        
        button = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 200, width: 200, height: 60))
        button?.setTitle("To B ViewController", for: .normal)
        button?.backgroundColor = .groupTableViewBackground
        button?.setTitleColor(.black, for: .normal)
        view.addSubview(button!)
        button?.addTarget(self, action: #selector(toBAction), for: .touchUpInside)
        
        textField = UITextField.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 450, width: 200, height: 60))
        textField?.delegate = self
        textField?.backgroundColor = .lightGray
        view.addSubview(textField!)
    }

    @objc func toBAction() {
        
        //方法一：class类型判断
        for VC in (self.navigationController?.viewControllers)! {
            // BViewController  是你要返回的控制器（页面）
            if VC.isKind(of: BViewController.self) {
                self.navigationController?.popToViewController(VC, animated: true)
            }
        }
        //方法二:明确知道vc的索引通过索引跳转
//        let VC = self.navigationController?.viewControllers[1];
//        self.navigationController?.popToViewController(VC!, animated: true)
        
    }

}

extension EViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text as Any)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField?.resignFirstResponder()
    }
}
