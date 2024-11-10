//
//  BookmarkViewController.swift
//  DhikrApp
//
//  Created by Abdulla Civuli on 10.11.24.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    private(set) weak var bookmarkCoordinator: BookmarkCoordinator?
    
    init(bookmarkCoordinator: BookmarkCoordinator?) {
        self.bookmarkCoordinator = bookmarkCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}