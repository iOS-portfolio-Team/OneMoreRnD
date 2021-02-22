//
//  WorkoutLogTableViewController.swift
//  SQLITErnd
//
//  Created by nina on 2021/02/18.
//

import UIKit

class WorkoutLogTableViewController: UITableViewController{

    
    @IBOutlet var WorkoutLogTable: UITableView!

    let cellReuseIdentifier = "workoutLogCell"
    var db:DBHelper = DBHelper()
    var workoutLogs:[workoutLog] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //WorkoutLogTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        WorkoutLogTable.delegate = self
        WorkoutLogTable.dataSource = self
        
        workoutLogs = db.read()
        WorkoutLogTable.rowHeight = 100 // 셀높이

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workoutLogs.count
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let exerciseSequenceNumer = String(workoutLogs[indexPath.row].exerciseSequenceNumer)
        
            let deleteAlert = UIAlertController(title: "삭제", message: "삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        
        let yesAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { [self]ACTION in self.db.deleteByID(exerciseSequenceNumer: Int(exerciseSequenceNumer)!)
            self.workoutLogs = db.read()
            self.WorkoutLogTable.reloadData()
            
            })

            deleteAlert.addAction(yesAction)
            deleteAlert.addAction(cancelAction)
            present(deleteAlert, animated: true, completion: nil)
    }
    
    
    
    

    
    
    
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            //cell.exerciseImage?.image = 이미지 넣을 예정
        let cell = WorkoutLogTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! WorkoutLogTableViewCell
            cell.exerciseSequenceNumer?.text = String(workoutLogs[indexPath.row].exerciseSequenceNumer)
            cell.exerciseName?.text = String(workoutLogs[indexPath.row].exerciseName) + workoutLogs[indexPath.row].exerciseHow
            cell.exerciseJudgment?.text = workoutLogs[indexPath.row].exerciseJudgment
            cell.exerciseComment?.text = workoutLogs[indexPath.row].exerciseComment
            cell.exerciseWhen?.text = workoutLogs[indexPath.row].exerciseWhen

            cell.exerciseImage?.image = UIImage(named: String(workoutLogs[indexPath.row].exerciseName)+".png")

            return cell
        }
    
    override func viewWillAppear(_ animated: Bool) {
        // 입력 수정 삭제 후 DB 재구성
        
        let db:DBHelper = DBHelper()
        let _:[workoutLog] = []
        
        WorkoutLogTable.delegate = self
        WorkoutLogTable.dataSource = self
        
        self.workoutLogs = db.read()
        
        self.WorkoutLogTable.reloadData()
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
