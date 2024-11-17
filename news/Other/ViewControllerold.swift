////
////  ViewController.swift
////  news
////
////  Created by Тарас Шапаренко on 13.11.2024.
////
//import UIKit
//import Combine
//
//class ViewModel {
//
//    
//}
//
//class ViewController: UIViewController {
//    let viewModel = ViewModel()
//    
//
//    
//    private var cancellables: Set<AnyCancellable> = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let url = URL(string: "https://newsapi.org/v2/everything?q=gazprom&sortBy=publishedAt")!
//        var request = URLRequest(url: url)
//        request.allHTTPHeaderFields = ["X-Api-Key": "4f2322d318b247c9ac6b29fcd4b9a035"]
//        URLSession.shared.dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: Response.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .catch { error in
//                Just(Response(status: "error", articles: []))
//            }
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Ошибка: \(error)")
//                case .finished:
//                    print("Запрос завершен")        }
//            }, receiveValue: { response in
//                print("Данные получены: \(response)")
////                for article in response.articles {
////                    print("Автор: \(article.author ?? "Неизвестен")")
////                    print("Заголовок: \(article.title ?? "Без заголовка")")
////                    print("Дата публикации: \(article.publishedAt ?? "Не указана")")
////                }
//            })
//            .store(in: &cancellables)
//
//    }
//    private lazy var searchTextField: UITextField = {
//        let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.placeholder = "Start to search something.."
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor.black.cgColor
//        textField.layer.cornerRadius = 10
//        return textField
//    }()
//    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .white
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = .none
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(NewTableCell.self, forCellReuseIdentifier: String(describing: NewTableCell.self))
//        return tableView
//    }()
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    // Количество секций теперь равно количеству элементов
//    func numberOfSections(in tableView: UITableView) -> Int {
//        3
//    }
//    
//    // В каждой секции будет только одна ячейка
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewTableCell.self)) as? NewTableCell else {
//            fatalError("Не удалось создать ячейку")
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 79.75
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 20
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let spacerView = UIView()
//        spacerView.backgroundColor = .clear
//        return spacerView
//    }
//    // Переход при нажатии на ячейку
////            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////    //            let selectedItem = viewModel.items[indexPath.section]
////                let detailViewController = DetailViewController()
////    //            detailViewController.selectedItem = selectedItem // Передаем данные выбранной ячейки
////                navigationController?.pushViewController(detailViewController, animated: true)
//        }
//    class NewTableCell: UITableViewCell {
//        
//
//        
//        private let newDataPublished: UILabel = {
//            let label = UILabel()
//            label.font = UIFont.systemFont(ofSize: 16)
//            label.textColor = .black
//            label.numberOfLines = 0
//            label.translatesAutoresizingMaskIntoConstraints = false
//            return label
//        }()
//        
//        private let accessoryImageView: UIImageView = {
//            let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
//            imageView.tintColor = .gray
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }()
//        
//        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//            setupViews()
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) не реализован")
//        }
//        
//            
//            func setupViews() {
//                addSubview(searchTextField)
//                addSubview(tableView)
//                
//                setupConstraints()
//            }
//            
//            func setupConstraints() {
//                NSLayoutConstraint.activate([
//                    searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//                    searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//                    searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//                    searchTextField.heightAnchor.constraint(equalToConstant: 60)
//                ])
//                
//                NSLayoutConstraint.activate([
//                    tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
//                    tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//                    tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//                    tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//                ])
//            }
//        }
