//
//  InputViewController.swift
//  DBDemo
//
//  Created by nina on 2021/02/13.
//  Copyright © 2021 Bilal Hassan. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    var db:DBHelper = DBHelper()
    // 걍 이거 하나면 디비 불러와줌 ㅋ
    //저기 헬퍼에 다 세팅 되어있기 때문~~~
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 입력하기 버튼을 누를 경우
    // 우리 프로젝트 같은 경우 운동이 종료되면으로 이벤트를 걸면 될듯

    @IBAction func btnInsert(_ sender: UIButton) {
        
        var nameText = String(tfName.text!)
        var ageText = Int(tfAge.text!)
        
        // id 는 시퀀스 넘버로, 0으로 입력해놓으면 AI
        db.insert(id: 0, name: "\(nameText)", age: ageText!)
        //db.insert(id: 0, name: "Bosh", age: 25)
        
    }
    


        


}
