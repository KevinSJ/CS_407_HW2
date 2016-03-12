//
//  UserEvents.swift
//  Calendar
//
//  Created by Sicong Jiang on 2016/03/09
//  Copyright © 2016年 Sicong Jiang. All rights reserved.
//

import UIKit
import CoreData

@objc(UserEvents)
class UserEvents: NSManagedObject {
    @NSManaged var date: String
    @NSManaged var info: String
    @NSManaged var title: String
}
