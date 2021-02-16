//
//  CircularProgressBar.swift
//  Rnd
//
//  Created by 정정이 on 2021/02/09.
//

import UIKit

class CircularProgressBar: UIView {
 
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()

    override init(frame: CGRect) {
    super.init(frame: frame)
        addProgressBar(radius: 5, progress: 0)
    }

    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
        addProgressBar(radius: 5, progress: 0)
    }

    func addProgressBar(radius: CGFloat, progress: CGFloat) {

        let lineWidth = radius*0.080

        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: radius, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)

        //TrackLayer
        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = UIColor.gray.cgColor // background color
        trackLayer.strokeColor = UIColor.clear.cgColor
        trackLayer.opacity = 0.5 // 투명도
        trackLayer.lineWidth = lineWidth
        trackLayer.lineCap = CAShapeLayerLineCap.round

        //BarLayer
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.orange.cgColor // 프로그래스바 색
        shapeLayer.opacity = 0.5 // 투명도
        
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round



        //Rotate Shape Layer
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)


        //Animation
        loadProgress(percentage: progress)

        //LoadLayers
        layer.addSublayer(trackLayer)
        layer.addSublayer(shapeLayer)

    }
    
    //처음 시작 프로그래스바 (기본)
    func loadProgress(percentage: CGFloat) {

        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.duration = 120.0 // 프로그래스바 속도 ( 타이머랑 동일해야함)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
    
        shapeLayer.strokeEnd = percentage
        shapeLayer.add(basicAnimation, forKey: "basicStroke")

    }
    

    // 프로그래스바 일시정지
    func loadProgressPause(percentage: CGFloat,nowTime: Double,nowCount:Double) {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = nowTime
        basicAnimation.duration = 120.0 - nowCount // 프로그래스바 일시정지하면 멈춰진 시간에 정지
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.speed = 0
        
        shapeLayer.strokeEnd = percentage
        shapeLayer.add(basicAnimation, forKey: "basicStroke")

    }
    
    
    // 프로그래스바 재시작
    func loadProgressRestart(percentage: CGFloat,nowTime: Double ,nowCount:Double) {

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = nowTime
        basicAnimation.duration = 120.0 - nowCount // restart하면 현재 시간부터 프로그래스바 실행
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.strokeEnd = percentage
        shapeLayer.add(basicAnimation, forKey: "basicStroke")

    }
    
}
