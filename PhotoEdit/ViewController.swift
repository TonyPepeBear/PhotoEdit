//
//  ViewController.swift
//  PhotoEdit
//
//  Created by Tony on 2019/10/3.
//  Copyright © 2019 tonypepe. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var mask: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderR: UISlider!
    @IBOutlet weak var sliderG: UISlider!
    @IBOutlet weak var sliderB: UISlider!
    @IBOutlet weak var sliderA: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func openPicker(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        imageView.image = info[.originalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func sliderChange() {
        mask.backgroundColor = UIColor(
                red: CGFloat(sliderR.value),
                green: CGFloat(sliderG.value),
                blue: CGFloat(sliderB.value),
                alpha: CGFloat(sliderA.value)
        )
    }
}
