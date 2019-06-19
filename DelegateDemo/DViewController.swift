//  D控制器
//  DViewController.swift
//  DelegateDemo
//  Created by 王泰贻 on 2019/6/19.
//  Copyright © 2019 ricepo. All rights reserved.

import UIKit



class DViewController: UIViewController {

    var button:UIButton?
    var valueLabel:UILabel?
    var textField:UITextField?



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = "D"
        
        button = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 200, width: 200, height: 60))
        button?.setTitle("To E ViewController", for: .normal)
        button?.backgroundColor = .groupTableViewBackground
        button?.setTitleColor(.black, for: .normal)
        view.addSubview(button!)
        button?.addTarget(self, action: #selector(toEAction), for: .touchUpInside)
        
//        valueLabel = UILabel.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 350, width: 200, height: 60))
//        valueLabel?.text = "20"
//        valueLabel?.textAlignment = .center
//        valueLabel?.backgroundColor = .red
//        valueLabel?.textColor = .white
//        view.addSubview(valueLabel!)
        
        textField = UITextField.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 450, width: 200, height: 60))
        textField?.delegate = self
        textField?.backgroundColor = .lightGray
        view.addSubview(textField!)
    }

    @objc func toEAction() {
        let eViewController = EViewController()
        self.navigationController?.pushViewController(eViewController, animated: true)
    }

}

extension DViewController:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text as Any)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField?.resignFirstResponder()
    }
}
