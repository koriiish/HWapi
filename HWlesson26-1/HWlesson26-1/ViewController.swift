//
//  ViewController.swift
//  HWlesson26-1
//
//  Created by Карина Дьячина on 12.03.24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let sharedSession = URLSession.shared
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    var users: [Users] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeDataTask()
        getUsers()
      //  getRequest()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "UsersTableViewCell")
        tableView.reloadData()
    }
    
    private func getUsers() {
         AF.request(url).responseDecodable(of: [Users].self) { response in
             switch response.result {
             case .success(let users):
                 self.users = users
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }
             case .failure(let error):
                 print("Error: \(error.localizedDescription)")
             }
         }
     }
    func getRequest() {
        NetworkManager.performGetRequest(url: url) { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func makeDataTask() {
        let dataTask = sharedSession.dataTask(with: URLRequest(url: url), completionHandler: { [weak self] data,_,_ in
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data)
                    print(json)
                    
                    self?.users = try JSONDecoder().decode([Users].self, from: data)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                } else {
                    print("error")
                }
            }catch {
                print(error)
            }
        })
        dataTask.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        cell.configure(users: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

/*
 Отправить запрос на получение списка юзеров (/users).
 Полученные объекты (объект json) вывести в консоль.
 API - https://jsonplaceholder.typicode.com/
 *Продвинутый уровень:
 Получить юзеров, привести их к типу [User] и вывести в таблицу.
 */
