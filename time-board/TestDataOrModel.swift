//
//  TestDataOrModel.swift
//  time-board
//
//  Created by Tianid on 01.07.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//

import Foundation
import UIKit

var testBoards = [
Board(title: "Step One", task: [
    Task(name: "TASKTASKTASKTASKTASKTASKTASKTASKTASKTASKTASKTASKTASKTASKTASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: testAttachments,
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK ",
         description: "Some Description for task",
         attachments: [],
         comments: [])
]),
Board(title: "Step Two", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 3",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Three", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 3",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 4",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Four", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 3",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 4",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 5",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Five", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Six", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Seven", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Eight", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Nine", task: [
    Task(name: "TASK 1",
         description: "Some Description for task",
         attachments: [],
         comments: []),
    Task(name: "TASK 2",
         description: "Some Description for task",
         attachments: [],
         comments: [])]),
Board(title: "Step Ten", task: [])]


var commentsArray = ["COMMENT","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS","COMMENTS"]


var testAttachments: [Attachment] = [Attachment(attachmentURL: "1", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "2", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "3", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "4", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "5", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "6", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "7", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "8", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "9", file: File(withImage: UIImage(named: "icons8-arrow-50")!)),
                                 Attachment(attachmentURL: "10", file: File(withImage: UIImage(named: "icons8-arrow-50")!))

]
