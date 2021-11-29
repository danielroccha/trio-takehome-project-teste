//
//  MenuSectionView.swift
//  restaurant menu
//
//  Created by Daniel Rocha on 27/11/21.
//

import UIKit

final class MenuSectionView: CodedView {
    
    // MARK: - Constants
    
    private enum ViewMetrics {
        enum CollectionView {
            static let height: CGFloat = 60
        }
    }
    
    // MARK: - View Components
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addBorder(toSide: [.top, .bottom], with: Asset.Colors.lightGray.color, andWidth: 0.5)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 50
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(MenuSectionCell.self, forCellWithReuseIdentifier: String(describing: MenuSectionCell.self))
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var indexSelected: Int? = 0
    private var menuSections: [Restaurant.MenuSection]?
    private let handleSelectItem: (Int) -> Void
    
    // MARK: - Initialization
    
    init(
        menuSections: [Restaurant.MenuSection]?,
        handleSelectItem: @escaping (Int) -> Void
    ) {
        self.menuSections = menuSections
        self.handleSelectItem =  handleSelectItem
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        addSubview(view)
        view.addSubview(collectionView)
    }
    
    override func addConstraints() {
        viewConstraint()
        collectionViewConstraint()
    }
    
    // MARK: - Private methods
    
    private func viewConstraint() {
        view.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            leadingConstant: 8,
            trailingConstant: 8,
            heightConstant: ViewMetrics.CollectionView.height
        )
    }
    
    private func collectionViewConstraint() {
        collectionView.anchor(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            heightConstant: ViewMetrics.CollectionView.height
        )
    }
    
    private func setMenuSectionSelected(index: Int) {
        handleSelectItem(index)
        indexSelected = index
        let indexPath = IndexPath(item: index, section: .zero)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        collectionView.reloadData()
    }
    
    // MARK: - Public methods
    
    public func setMenuSections(menuSections: [Restaurant.MenuSection]) {
        self.menuSections = menuSections
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MenuSectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuSections?.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MenuSectionCell.self), for: indexPath)
        guard let menuSectionCell = cell as? MenuSectionCell else { preconditionFailure("MenuSectionCell not registered") }
        let name = menuSections?[indexPath.row].sectionName
        let isSelected = indexPath.row == indexSelected
        
        let viewModel = MenuSectionCell.ViewModel(
            selected: isSelected,
            handleTapSelect: { [weak self] in
                self?.setMenuSectionSelected(index: indexPath.row)
            },
            sectionName: name ?? ""
        )
        
        menuSectionCell.viewModel = viewModel
        
        return menuSectionCell
    }
}
