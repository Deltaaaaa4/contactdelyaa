//
//  ViewController.swift
//  todolist
//
//  Created by 903-20i on 09.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nametextfield: UITextField!
    
    
    @IBOutlet weak var surnametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTask(_ sender: Any) {
        
        let name = nametextfield.text!
        let surname = surnametextfield.text!
        let phone = phonetextfield.text!
        let newPhone = PersonPhone(name: name, surname: surname, phone: phone)

        do{
            if let data = UserDefaults.standard.data(forKey: "PersonPhoneArray"){
                var array = try JSONDecoder().decode([PersonPhone].self, from:data)
                array.append(newPhone)
                
                var encodeddata = try JSONEncoder().encode(array)
                UserDefaults.standard.set(encodeddata, forKey: "PersonPhoneArray")
            } else {
                var array = [newPhone]
                var encodeddata = try JSONEncoder().encode(array)
                UserDefaults.standard.set(encodeddata, forKey: "PersonPhoneArray")
            }
        } catch {
            print("\(error)")
        }
        
//        if let arrayTask = UserDefaults.standard.array(forKey: "taskArray") as? [String]{
//
//            var array = arrayTask
//            array.append(task)
//
//            UserDefaults.standard.set(array, forKey: "taskArray")}
//        else{
//            let array = [task]
//            UserDefaults.standard.set(array, forKey: "taskArray")
//        }
        nametextfield.text = ""
       surnametextfield.text = ""
        phonetextfield.text = ""
            
        
            
            
       
        
    }
    
    

}

