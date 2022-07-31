//
//  ImagePicker.swift
//  WeChat
//
//  Created by KC on 25/07/2022.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    let isShown: Binding<Bool>
    let postImage: Binding<Image?>

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        let isShown: Binding<Bool>
        let postImage: Binding<Image?>

        init(isShown: Binding<Bool>, postImage: Binding<Image?>) {
            self.isShown = isShown
            self.postImage = postImage
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            self.postImage.wrappedValue = Image(uiImage: uiImage)
            self.isShown.wrappedValue = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown.wrappedValue = false
        }

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: isShown, postImage: postImage)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}



