//
//  CodedView.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 26/11/21.
//

import Foundation
import UIKit

protocol ViewCodeConfigurator {
    func addSubviews()
    func addConstraints()
}

extension ViewCodeConfigurator {
    fileprivate func initLayout (){
        addSubviews()
        addConstraints()
    }
}

open class CodedView: UIView, ViewCodeConfigurator {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func addConstraints() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}

open class CodedCollectionViewCell: UICollectionViewCell, ViewCodeConfigurator {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func addConstraints() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}

open class CodedTableViewCell: UITableViewCell, ViewCodeConfigurator {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initLayout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    func addConstraints() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
}
