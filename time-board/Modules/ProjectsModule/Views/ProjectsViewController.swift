//
//  ProjectsViewController.swift
//  time-board
//
//  Created by Tianid on 01.05.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    
    //MARK: - Propertiec
    var presenter: IProjectsPresenter?
    //MARK: - Functions
    
    
    private func configure() {
        view.backgroundColor = .green
        title = "Projects"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
}

extension ProjectsViewController: IProjectsViewController {}
