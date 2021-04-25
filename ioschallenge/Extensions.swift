//
//  Extensions.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/24/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradient(topColor: UIColor, downColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor.cgColor, downColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

public extension UIView {
    func addTapGestureRecognizer(action: (() -> Void)?) {
        tapAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleTap)
        let recognizer = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
}

fileprivate extension UIView {
    typealias Action = (() -> Void)
    struct Key { static var id = "tapAction" }
    var tapAction: Action? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? Action
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        tapAction?()
    }
}


extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
