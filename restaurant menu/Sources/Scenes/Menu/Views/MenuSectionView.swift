//
//  MenuSectionView.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuSectionView: CodedView {
    
    // MARK: - View Metrics
    private enum ViewMetrics {
        enum CollectionView {
            static let height: CGFloat = 60
        }
    }
    
    // MARK: - View Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(MenuSectionCell.self, forCellWithReuseIdentifier: String(describing: MenuSectionCell.self))
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        addBorder(toSide: [.top, .bottom], with: .red, andWidth: 2)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        addSubview(collectionView)
    }
    
    override func addConstraints() {
        collectionViewConstraint()
    }
    
    private func viewConstraint() {
        anchor(
            leadingConstant: 8,
            trailingConstant: 8
        )
    }
    
    private func collectionViewConstraint() {
        collectionView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            heightConstant: ViewMetrics.CollectionView.height
        )
    }
}

extension MenuSectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuSectionCell.self), for: indexPath)
        guard let menuSectionCell = cell as? MenuSectionCell else { preconditionFailure("MenuSectionCell not registered") }
        return menuSectionCell
    }
}
