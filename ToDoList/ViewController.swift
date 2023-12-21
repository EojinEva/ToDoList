

import UIKit

var tasks = [Task]()


class ViewController: UIViewController, UIWebViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDolistTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = ""
        
//        cell.detailTextLabel?.text = tasks[indexPath.row].content
        
        if tasks[indexPath.row].done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        
        return cell
    }
    
    
    
    @IBOutlet weak var toDolistTableView: UITableView!
    
    @IBOutlet weak var addListButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDolistTableView.delegate = self
        toDolistTableView.dataSource = self
        
        print(tasks.description)
        
    }
    

    
    
    @IBAction func addButton(_ sender: Any) {
        
        let alertButton = UIAlertController(title: "할 일 등록", message: "리스트에 추가하시겠습니까?", preferredStyle: .alert)
        
        alertButton.addTextField { (tf) in
            tf.placeholder = "To Do List"
            tf.returnKeyType = .done
        }
        
            
        let confirm = UIAlertAction(title: "추가", style: .default) { confirm in
            if let tf = alertButton.textFields?[0], let taskText = tf.text, !taskText.isEmpty{
                let newTask = Task(title: taskText, content: taskText, done: false)
                tasks.append(newTask)
                self.toDolistTableView.reloadData()
            }
        }

        
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        alertButton.addAction(confirm)
        alertButton.addAction(cancel)
        

        self.present(alertButton, animated: true)
            
        }
    
    }




/*
 완료처리 추가 (버튼으로
 추가버튼 누르면 table view cell에 내용 뜰 수 있도록 task 변수 만들기
 */
