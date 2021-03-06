//
//  DetailTaskPresenter.swift
//  time-board
//
//  Created by Tianid on 06.07.2020.
//  Copyright © 2020 Tianid. All rights reserved.
//
import UIKit

class DetailTaskPresenter {
    
    // MARK: - Properties

    var task: Task
    var cache: NSCache<AnyObject, AnyObject>
    var tempCommentAttachemnts: [Attachment] = []
    let router: IRouter
    
    private weak var parent: IDetailTask?
    
    // MARK: - Init

    init(controller: IDetailTask, task: Task, router: IRouter) {
        self.parent = controller
        self.task = task
        self.cache = NSCache()
        self.router = router
    }
    
    // MARK: - Func

    private func getImageFromCache(attachmentURL: String) -> UIImage? {
        guard let imageFromCache = cache.object(forKey: attachmentURL as NSString) as? UIImage else {
            return nil
        }
        return imageFromCache
    }
    
    private func getImageFromData(index: Int, attachments: [Attachment]) -> UIImage? {
        guard let data = attachments[index].file?.fileData else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        let attachmentURL = attachments[index].attachmentURL
        cache.setObject(image, forKey: attachmentURL as NSString)
        return image
    }
    
    private func getFileImage() -> UIImage? {
        if let image = getImageFromCache(attachmentURL: "icons8-file-50.png") {
            return image
        }
        guard let image = UIImage(named: "icons8-file-50.png") else { return nil }
        cache.setObject(image, forKey: "icons8-file-50.png" as NSString)
        return image
    }
}

extension DetailTaskPresenter: IDetailTaskPresenter {
    
    func addAttachmentTapped() {
        parent?.showAddNewAttachmentAlert()
    }
    
    func attachmentCellLongTapped(indexPath: IndexPath) {
        parent?.showAttachmentCellAlert(indexPath: indexPath)
    }
    
    func attachmentCellTapped(startIndex: Int) {
        let images = getAllImages()
        let attachments = task.attachments
        router.showImagePreview(attachments: attachments, startIndex: startIndex, images: images)
    }
    
    func addNewAttachment(data: Data, fileName: String, fileType: AttachmentFileType) {
        let attachment = Attachment(attachmentURL: fileName)
        attachment.file = File(data: data, fileType: fileType)
        task.attachments.append(attachment)

        switch fileType {
        case .jpeg, .jpg, .gif, .png, .heic:
            let uiImage = UIImage(data: data)
            cache.setObject(uiImage!, forKey: fileName as NSString)
        case .notImage:
            let _ = getFileImage()
        }
        
        let indexPath = IndexPath(item: task.attachments.count - 1, section: 1)
        parent?.addAttachmentDataAt(indexPath: indexPath)
    }
    
    func deleteAttachmentTapped(indexPath: IndexPath) {
        let attachmentURL = task.attachments[indexPath.row].attachmentURL
        cache.removeObject(forKey: attachmentURL as NSString)
        task.attachments.remove(at: indexPath.row)
        parent?.deleteAttachmentDataAt(indexPath: indexPath)
    }
    
    func getImage(indexPath: IndexPath, storage: StorageSource) -> UIImage? {
        var attachments: [Attachment]!
        switch storage {
        case .attachments:
            attachments = task.attachments
        case .temp:
            attachments = tempCommentAttachemnts
        case .comments:
            attachments = task.comments[indexPath.row].commentAttachments
        }
        
        guard let fileType = attachments[indexPath.row].file?.fileType else  { return nil }

        if fileType == .notImage{
            let image = getFileImage()
            return image
        } else {
            if let image = getImageFromCache(attachmentURL: attachments[indexPath.row].attachmentURL) {
                return image
            }

            if let image = getImageFromData(index: indexPath.row, attachments: attachments) {
                return image
            }
        }
        return nil
    }
    
    func getAllImages() -> [UIImage] {
        var array: [UIImage] = []
        for item in task.attachments {
            if item.file?.fileType == .some(.notImage) {
                let image = getFileImage()
                array.append(image!)
            } else {
                let image = getImageFromCache(attachmentURL: item.attachmentURL)
                array.append(image!)
            }
        }
        
        return array
    }
    
    func descriptionLabelTapped() {
        router.showDescriptionEditViewController(task: task)
    }
}

extension DetailTaskPresenter: ICommentTextFieldViewPresenter {
    func addCommentButtonTapped(comment: String) {
        let comment = Comment(commentText: comment, commentAttachments: tempCommentAttachemnts)
        resetTempAttachment()
        parent?.addNewComment(comment: comment)
    }
    
    func cameraButtonTapped() {
        parent?.showCameraController()
    }
    
    func imageButtonTapped() {
        parent?.showImagePicker()
    }
    
    func documentButtonTapped() {
        parent?.showDocumentPickerController()
    }
    
    func addNewTextFieldCommentAttachment(data: Data, fileName: String, fileType: AttachmentFileType) {
        let attachment = Attachment(attachmentURL: fileName)
        attachment.file = File(data: data, fileType: fileType)
        tempCommentAttachemnts.append(attachment)

        switch fileType {
        case .jpeg, .jpg, .gif, .png, .heic:
            let uiImage = UIImage(data: data)
            cache.setObject(uiImage!, forKey: fileName as NSString)
        case .notImage:
            let _ = getFileImage()
        }
        
        let indexPath = IndexPath(item: tempCommentAttachemnts.count - 1, section: 0)
        parent?.addTextFieldCommentAttachmentDataAt(indexPath: indexPath)
    }
    
    func textFieldAttachmentCellLongTapped(at index: IndexPath) {
        parent?.showTextFieldAttachmentCellAlert(at: index)

    }
    
    func textFieldAttachmentCellSingleTapped(at index: IndexPath) {
        let images = getAllImagesFromTemp()
        let attachments = tempCommentAttachemnts
        router.showImagePreview(attachments: attachments, startIndex: index.row, images: images)
    }
    
    func deleteTempAttachment(at index: IndexPath) {
        cache.removeObject(forKey: tempCommentAttachemnts[index.row].attachmentURL as NSString)
        tempCommentAttachemnts.remove(at: index.row)
    }
    
    private func resetTempAttachment() {
        tempCommentAttachemnts.removeAll()
    }
    
    private func getAllImagesFromTemp() -> [UIImage] {
        var array: [UIImage] = []
        for item in tempCommentAttachemnts {
            if item.file?.fileType == .some(.notImage) {
                let image = getFileImage()
                array.append(image!)
            } else {
                let image = getImageFromCache(attachmentURL: item.attachmentURL)
                array.append(image!)
            }
        }
        return array
    }
}

extension DetailTaskPresenter: ICommentViewPresenter {
    func showPreview(commentIndex: Int, startIndex: Int) {
        let images = getAllImages(for: commentIndex)
        let attachments = task.comments[commentIndex].commentAttachments
        router.showImagePreview(attachments: attachments, startIndex: startIndex, images: images)
    }
    
    func getAllImages(for index: Int) -> [UIImage] {
        var array: [UIImage] = []
        
//        for item in comment.commentAttachments {
        for item in task.comments[index].commentAttachments {

            if item.file?.fileType == .some(.notImage) {
                let image = getFileImage()
                array.append(image!)
            } else {
                let image = getImageFromCache(attachmentURL: item.attachmentURL)
                array.append(image!)
            }
        }
        return array
    }
    
    func getImageFromComment(commentIndex: Int, index: Int) -> UIImage? {
        let attachments = task.comments[commentIndex].commentAttachments
        guard let fileType = attachments[index].file?.fileType else { return nil }
        
        if fileType == .notImage{
            let image = getFileImage()
            return image
        } else {
            if let image = getImageFromCache(attachmentURL: attachments[index].attachmentURL) {
                return image
            }
            
            if let image = getImageFromData(index: index, attachments: attachments) {
                return image
            }
        }
        return nil
    }
}
