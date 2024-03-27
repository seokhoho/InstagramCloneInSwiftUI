//
//  CustomDetent.swift
//  InstagramCloneInSwiftUI
//
//  Created by 정석호 on 2024/03/22.
//

import SwiftUI

struct CustomDetent: CustomPresentationDetent {
    static func height(in context: Context) -> CGFloat? {
        return context.maxDetentValue - 1
    }
}
