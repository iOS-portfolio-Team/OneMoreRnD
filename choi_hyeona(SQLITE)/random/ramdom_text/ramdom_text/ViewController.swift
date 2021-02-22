//
//  ViewController.swift
//  ramdom_text
//
//  Created by nina on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let randomText = ["회원님 오늘은 하체하셔야죠 :D",
                          "식단 잘 지키고 계시죠 ? 전 회원님을 믿습니다. :D",
                          "흔들리면 그것은 지방입니다 :D",
                          "헬스클럽은 클럽보다 더 즐거운곳 :D",
                          "오늘도 화이팅 ! 아자아자 우리회원님 할수있다! :D",
                          "회원님~ 한번만 더 하실수있죠? :D",
                          "우리회원님 ! 내일도 나오실거죠? 도망가면 안돼요 :D",
                          "할수있다 우리 회원님! 한번만 더! :D"]
        
        let random = Int(arc4random_uniform(7)) //1 or 0
        print(randomText[random])

    }


}

