//
//  AcceptanceController.swift
//  redhathotel
//
//  Created by Daniel Florian on 4/26/18.
//  Copyright © 2018 Ted Jones - Red Hat. All rights reserved.
//

import UIKit

final class AcceptanceController: UITableViewController {

    static let storyboardId = "AcceptanceController"

    override func tableView( _ tableView: UITableView,
                             canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView( _ tableView: UITableView,
                             didDeselectRowAt indexPath: IndexPath ) {
        let indexPath = tableView.indexPathForSelectedRow

        switch indexPath?.row {
        case 0:
            PrefMgr.shared.allowance1 = false
        case 1:
            PrefMgr.shared.allowance2 = false
        case 2:
            PrefMgr.shared.allowance3 = false
        case 3:
            PrefMgr.shared.askForAcceptance = true
        default: break
        }

        let cell = tableView.cellForRow( at: indexPath! )
        cell?.accessoryType = .none
    }

    override func tableView( _ tableView: UITableView,
                             didSelectRowAt indexPath: IndexPath ) {
        let indexPath = tableView.indexPathForSelectedRow
        
        switch indexPath?.row {
        case 0:
            PrefMgr.shared.allowance1 = true
        case 1:
            PrefMgr.shared.allowance2 = true
        case 2:
            PrefMgr.shared.allowance3 = true
        case 3:
            PrefMgr.shared.askForAcceptance = false
        default: break
        }

        let cell = tableView.cellForRow( at: indexPath! )
        cell?.accessoryType = .checkmark
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Acceptance"
    }

}
