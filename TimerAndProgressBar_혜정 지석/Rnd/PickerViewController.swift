//
//  PickerViewController.swift
//  Rnd
//
//  Created by 정정이 on 2021/02/10.
//

import UIKit


class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, EditDelegate {
    func didMessageEditDone(_ controller: PickerViewController, message: String) {
        
    }
    
    
    
    
 
 
    

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lblChk: UILabel!
    
    var minute: [String] = []
    var choice: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for i in 5...100{
            minute.append("\(i)분")
        
        }
        lblChk.text = minute[0]
 
        // Do any additional setup after loading the view.
    }
 

   
    @IBAction func btnAdd(_ sender: UIButton) {
    
      
        choice = 5 * 60
        lblChk.text = String(choice)
        // 연결된곳에 자동으로 보냄
        navigationController?.popViewController(animated: true)
    }
    
    
    
    // PickerView의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //-------------------------------
    // UIPickerViewDelegate의 stubs
    //-------------------------------
    
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minute.count
    }
    // PickerView 에 파일명 배치
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return minute[row]
    }

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // PickerView로 선택된 파일명을 레이블 및 imgView에 출력
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblChk.text = minute[row]
        choice = (row + 5) * 60
    }

}
