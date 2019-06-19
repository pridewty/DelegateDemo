//  A控制器
//  AViewController.swift
//  DelegateDemo
//  Created by 王泰贻 on 2019/6/19.
//  Copyright © 2019 ricepo. All rights reserved.

import UIKit

class AViewController: UIViewController {

    var button:UIButton?
    var valueLabel:UILabel?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "A"
        
        //添加一个按钮
        button = UIButton.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 200, width: 200, height: 60))
        button?.setTitle("To B ViewController", for: .normal)
        button?.backgroundColor = .gray
        view.addSubview(button!)
        button?.addTarget(self, action: #selector(toBClick), for: .touchUpInside)
        
        //添加一个label
        valueLabel = UILabel.init(frame: CGRect.init(x: (UIScreen.main.bounds.width-200)*0.5, y: 350, width: 200, height: 60))
        valueLabel?.text = "10"
        valueLabel?.textAlignment = .center
        valueLabel?.backgroundColor = .red
        valueLabel?.textColor = .white
        view.addSubview(valueLabel!)
    }

    @objc func toBClick() {
        let bViewController = BViewController()
        bViewController.bDelegate = self
        self.navigationController?.pushViewController(bViewController, animated: true)
    }

}

extension AViewController:BViewControllerDelegate{
   @objc func BDelegateFunc(valueString: String) {
        self.valueLabel?.text = valueString
    }
}
