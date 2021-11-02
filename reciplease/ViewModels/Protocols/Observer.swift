//
//  Observer.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 02/11/2021.
//

import Foundation
import Combine

/// A type of object with a publisher that emits before the object has changed.
public protocol ObservableObject : AnyObject {

    /// The type of publisher that emits before the object has changed.
    associatedtype ObjectWillChangePublisher : Publisher = ObservableObjectPublisher where Self.ObjectWillChangePublisher.Failure == Never

    /// A publisher that emits before the object has changed.
    var objectWillChange: Self.ObjectWillChangePublisher { get }
}
