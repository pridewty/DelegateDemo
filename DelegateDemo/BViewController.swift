//  B控制器
//  BViewController.swift
//  DelegateDemo
//  Created by 王泰贻 on 2019/6/19.
//  Copyright © 2019 ricepo. All rights reserved.

import UIKit

//1.定义的代理协议
protocol BViewControllerDelegate:NSObjectProtocol{
     func BDelegateFunc(valueString:String)
}

class BViewController: UIViewController {

    var button:UIButton?
    var valueLabel:UILabel?
    var textField:UITextField?
    
    //2.添加代理属性
    weak var bDelegate: BViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "B"
        
        button = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 200, width: 200, height: 60))
        button?.setTitle("To C ViewController", for: .normal)
        button?.backgroundColor = .groupTableViewBackground
        button?.setTitleColor(.black, for: .normal)
        view.addSubview(button!)
        button?.addTarget(self, action: #selector(toCAction), for: .touchUpInside)
        
        textField = UITextField.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 450, width: 200, height: 60))
        textField?.delegate = self
        textField?.backgroundColor = .lightGray
        view.addSubview(textField!)
    }

    @objc func toCAction() {
        let cViewController = CViewController()
        self.navigationController?.pushViewController(cViewController, animated: true)
    }

}

extension BViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text as Any)
        
        self.bDelegate?.BDelegateFunc(valueString: textField.text!)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField?.resignFirstResponder()
    }
}
