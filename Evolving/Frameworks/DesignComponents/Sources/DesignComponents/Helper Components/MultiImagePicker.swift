//
//  MultiImagePicker.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI
import PhotosUI

public struct MultiImagePicker: UIViewControllerRepresentable {

    @Binding var images: [UIImage]
    var selectionLimit = 1

    public init(images: Binding<[UIImage]>, selectionLimit: Int = 1) {
        self._images = images
        self.selectionLimit = selectionLimit
    }

    public func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = selectionLimit
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    public class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: MultiImagePicker

        init(_ parent: MultiImagePicker) {
            self.parent = parent
        }

        public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.images = []
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    if let images = object as? [UIImage] {
                        DispatchQueue.main.async {
                            self.parent.images = images
                        }
                    }
                }
            }
            picker.dismiss(animated: true)
        }
    }

}
