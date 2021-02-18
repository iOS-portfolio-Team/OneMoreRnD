//
//  ViewController.swift
//  Rnd
//
//  Created by 정정이 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController{
    
    // 변수명은 차차 바꾸겠습니다...... - 혜정,지석 //
    
    @IBOutlet weak var containerView: UIView! // 프로그레스바 연결 뷰
    @IBOutlet weak var btn: UIButton! // 일시정지 버튼
    @IBOutlet weak var hi: UILabel! // 시간 띄워주는 라벨
    
    
    
    // 프로그래스바 //
    var circularProgressBar = CircularProgressBar()
    var radius: CGFloat!
    var progress: CGFloat!
    var answeredCorrect = 0
    var totalQuestions = 0
    
    
    // 타이머 //
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var timeOut = 120.0 // 시간 얼마나 가는지는 이 변수로 설정. 소수점 필수
    let interval = 1.0// 시간 interval  1초
    
    var second = 0.0 // 초 단위
    var timerCount = 0.0 // timerCount
    var minute = 0.0 // 분 단위
    var countDownCheck = true // 10초가 완료 됐는지 체크

    var countDown = 10 // 첫 준비 타이머
    var timer = Timer()
                
    var secondText: String = ""
    var minuteText: String = ""
    
    var btncount: Int = 0 // 버튼 누른 횟수
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    // 버튼 이벤트
    @IBAction func btnChg(_ sender: UIButton) {
   
        if btncount == 0{ // 버튼을 처음 누른거면
            timer =  Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
            btncount = 2
                
        }else if btncount == 2{
            timer.invalidate()
            btncount = 1
            progressCirclePause(nowCount: timerCount, ptimeOut: timeOut)
                
                
        }else{
            hi.text = minuteText
            timer =  Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
            progressCircleRestart(nowCount: timerCount, ptimeOut: timeOut)
            btncount = 2
        }
            
    }

    // 카운트다운 매서드
    @objc func updateTime(){
        
    hi.text = String(countDown) // 10초부터 카운트다운
        countDown -= 1

        
        // 카운트 다운이 -1 보다 크면
        if countDown < -1{
            btn.isEnabled = true
            second += 1.0
            timerCount += 1.0
            
            // countUp
            if second < 10.0{
                secondText = "0\(String(format: "%.0f", second))" // 소수점을 없애기위해 String format 사용. 숫자 0은 일의 자리 숫자가 되면 00:1이 되기때문에 붙여준다.
            }else{
                secondText = "\(String(format: "%.0f", second))"
            }
            if second == 60.0 { // 60초가 되면 분을 +1, 초는 0으로 초기화
                minute += 1
                second = 0.0
                secondText = "0\(String(format: "%.0f", second))"
            }
            if minute < 10.0{ 
                minuteText = "0\(String(format: "%.0f", minute)):" + secondText
            }else{
                minuteText = "\(String(format: "%.0f", minute)):" + secondText
            }
            

            hi.text = minuteText
            
            if hi.text == "00:01"{
                if btncount == 1{
                    progressCircle()
                
                }else{
                    progressCircleRestart(nowCount: second, ptimeOut: timeOut)
                }
                
            }
            
            if minute*60.0 + second == timeOut{
                timer.invalidate()
                hi.text = "End"
            }
        }else{
            btn.isEnabled = false
        }
        
        
        
        
     
        
        }
    //처음 시작 프로그래스바 (기본)
    func progressCircle() {
        answeredCorrect = 100
        totalQuestions = 100

        //Configure Progress Bar
        radius = (containerView.frame.height)/2.60
        progress = CGFloat(answeredCorrect) / CGFloat (totalQuestions)
        circularProgressBar.addProgressBar(radius: radius, progress: progress)
        circularProgressBar.center = containerView.center
        
        //Adding view
        containerView.addSubview(circularProgressBar)
        circularProgressBar.loadProgress(percentage: progress)
    }
    
    
    // 프로그래스바 일시정지
    func progressCirclePause(nowCount: Double , ptimeOut: Double) {
        answeredCorrect = 100
        totalQuestions = 100

        //Configure Progress Bar
        radius = (containerView.frame.height)/2.60
        progress = CGFloat(answeredCorrect) / CGFloat (totalQuestions)
        circularProgressBar.addProgressBar(radius: radius, progress: progress)
        circularProgressBar.center = containerView.center

    
        //Adding view
        containerView.addSubview(circularProgressBar)
        circularProgressBar.loadProgressPause(percentage: progress,nowTime: nowCount/ptimeOut, nowCount:timerCount)
    }
    
    // 프로그래스바 재시작
    func progressCircleRestart(nowCount: Double, ptimeOut: Double) {
        answeredCorrect = 100
        totalQuestions = 100

        //Configure Progress Bar
        radius = (containerView.frame.height)/2.60
        progress = CGFloat(answeredCorrect) / CGFloat (totalQuestions)
        circularProgressBar.addProgressBar(radius: radius, progress: progress)
        circularProgressBar.center = containerView.center
        
        //Adding view
        containerView.addSubview(circularProgressBar)

        circularProgressBar.loadProgressRestart(percentage: progress, nowTime: nowCount/ptimeOut, nowCount: timerCount)
    }
    
    
    
}


