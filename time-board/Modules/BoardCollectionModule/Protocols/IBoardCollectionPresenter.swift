//
//  BoardCollectionPresenterProtocol.swift
//  time-board
//
//  Created by Tianid on 16.06.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import  UIKit

protocol IBoardCollectionPresenter {
    var boards: [Board] { get }
    func addListActionTapped(title: String)
    func deleteListActionTapped(indexPath: IndexPath)
    func moveListLeftActionTapped(indexPath: IndexPath)
    func moveListRightActionTapped(indexPath: IndexPath)
    func renameActionTapped(title: String?, indexPath: IndexPath)
    func alertAddNewTaskTapped(boardIndex: Int, taskName: String, taskDescription: String?, complition: (() -> Void)?)
}

protocol IAddListButtonViewPresenter {
    func addListButtonTapped()
}

protocol IBoardCollectionViewCellPresenter {
    var boards: [Board] { get }
    var boardType: BoardVCType { get }
    func settingsBoardButtonTapped(cell: IBoardCollectionViewCell)
    func taskCellTapped(_ task: Task)
    func tableViewAddButtonTapped(boardIndex: Int, complition: (() -> Void)?)
}
