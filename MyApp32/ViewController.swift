//
//  ViewController.swift
//  MyApp32
//
//  Created by 謝尚霖 on 2017/10/6.
//  Copyright © 2017年 謝尚霖. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var test2btn: UIButton!
    @IBOutlet weak var imgV: UIImageView!
    
    private var isCamera = false
    
    @IBAction func test2(_ sender: UIButton) {
        
        isCamera = false
        let pickerVC = UIImagePickerController() //建構式
        pickerVC.sourceType = .photoLibrary
        pickerVC.delegate = self
        
        
        //設定顯示成為 popover mode
        pickerVC.modalPresentationStyle = .popover
        let popover = pickerVC.popoverPresentationController
        popover?.sourceView = sender
        
        popover?.sourceRect = test2btn.bounds
        popover?.permittedArrowDirections = .left
        
        show(pickerVC, sender: self)
        
    }
    
    
    @IBAction func test1(_ sender: Any) {
        
        let pickerVC = UIImagePickerController() //建構式
        pickerVC.sourceType = .camera
        pickerVC.delegate = self
        
        
        
        
        show(pickerVC, sender: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        print("OK")
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
       
        if isCamera{
        
        // UsePhoto
        
        // save photo Album
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
        }else{
            //選取相簿使用的
            imgV.image = img
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
   
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        // Cancel
        print("Cancel")
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
        print("有相機")
        }
        if UIImagePickerController.isCameraDeviceAvailable(.front){
            print("前鏡頭")
        }
        if UIImagePickerController.isCameraDeviceAvailable(.rear){
            print("後鏡頭")
        }
        if UIImagePickerController.isFlashAvailable(for: .front){
        print("前Flash")
        }
        if UIImagePickerController.isFlashAvailable(for: .rear){
            print("後Flash")
        }
    }
   

}

