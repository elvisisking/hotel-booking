//
//  PrefMgr.swift
//  redhathotel
//
//  Created by Daniel Florian on 4/26/18.
//  Copyright © 2018 Ted Jones - Red Hat. All rights reserved.
//

import Foundation

enum Pref: String {

    case allowance1 = "allowance1"
    case allowance2 = "allowance2"
    case allowance3 = "allowance3"
    case askForAcceptance = "askForAcceptance"
    case keepLoggedIn = "keepLoggedIn"

    var id : String {
        get {
            return self.rawValue
        }
    }

}

final class PrefMgr {

    static let shared = PrefMgr()

    private let prefs: UserDefaults

    // don't allow construction outside of this class
    private init() {
        self.prefs = UserDefaults.standard
    }

    var allowance1: Bool {
        get {
            if let value = self.prefs.object( forKey: Pref.allowance1.id ) {
                return value as! Bool
            }
            
            // default value
            return false
        }
        
        set( newValue ) {
            self.prefs.set( newValue, forKey: Pref.allowance1.id )
        }
    }

    var allowance2: Bool {
        get {
            if let value = self.prefs.object( forKey: Pref.allowance2.id ) {
                return value as! Bool
            }
            
            // default value
            return false
        }
        
        set( newValue ) {
            self.prefs.set( newValue, forKey: Pref.allowance2.id )
        }
    }

    var allowance3: Bool {
        get {
            if let value = self.prefs.object( forKey: Pref.allowance3.id ) {
                return value as! Bool
            }
            
            // default value
            return false
        }
        
        set( newValue ) {
            self.prefs.set( newValue, forKey: Pref.allowance3.id )
        }
    }

    var askForAcceptance: Bool {
        get {
            if let value = self.prefs.object( forKey: Pref.askForAcceptance.id ) {
                return value as! Bool
            }
            
            // default value
            return true
        }
        
        set( newValue ) {
            self.prefs.set( newValue, forKey: Pref.askForAcceptance.id )
        }
    }

    var keepLoggedIn: Bool {
        get {
            if let value = self.prefs.object( forKey: Pref.keepLoggedIn.id ) {
                return value as! Bool
            }
            
            // default value
            return false
        }
        
        set( newValue ) {
            self.prefs.set( newValue, forKey: Pref.keepLoggedIn.id )
        }
    }

}
