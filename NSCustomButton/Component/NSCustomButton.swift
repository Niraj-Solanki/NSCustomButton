//
//  NSCustomButton.swift
//  NSCustomButton
//
//  Created by Neeraj Solanki on 22/06/21.
//


import UIKit
import Lottie

@IBDesignable class CustomButton: UIButton {

    //MARK:- Enums
    enum ButtonTypeEnum:Int {
        case large
        case medium
        case small

        var font: UIFont
        {
            switch self {
            case .medium:
                return UIFont.boldFont(ofSize: 14.0)
            case .small:
                return UIFont.boldFont(ofSize: 12.0)
            case .large:
                return UIFont.boldFont(ofSize: 16.0)
            }
        }

        var cornerRadius: CGFloat {
            switch self {
            case .medium,.large:
                return 12.0
            case .small:
                return 8.0
            }
        }

        var height: CGFloat {
            switch self {
            case .medium:
                return 40
            case .small:
                return 28
            case .large:
                return 48
            }
        }
    }

    enum ButtonStyleEnum:Int {
        case primary
        case primaryWithIcon
        case secondary
        case secondaryWithIcon
        case tertiary
        case tertiaryWithIcon

        func backgroundColor(buttonState:UIControl.State) ->UIColor
        {
            switch self {
            case .primary,.primaryWithIcon:
                switch buttonState {
                case .normal:
                    return ColorKeys.P500 //App Primary Color
                case .highlighted:
                    return ColorKeys.P700 //Dark Primary Color
                default:
                    return #colorLiteral(red: 0.9215686275, green: 0.6392156863, blue: 0.6784313725, alpha: 1) //App Primary Color
                }
            case .secondary,.secondaryWithIcon:
                switch buttonState {
                case .normal:
                    return ColorKeys.NG100 //White Color
                case .highlighted:
                    return ColorKeys.P100 //Light Primary Color
                default:
                    return ColorKeys.NG100 //White Color
                }
            case .tertiary,.tertiaryWithIcon:
                switch buttonState {
                case .normal:
                    return ColorKeys.NG100 //Clear Color
                case .highlighted:
                    return ColorKeys.P100 //Light Primary Color
                default:
                    return ColorKeys.NG100 //Clear Color
                }
            }
        }

        var titleColor: UIColor
        {
            switch self {
            case .primary,.primaryWithIcon:
                return ColorKeys.NG100 //White Color
            case .secondary,.secondaryWithIcon:
                return ColorKeys.P500 //App Primary Color
            case .tertiary,.tertiaryWithIcon:
                return ColorKeys.P500 //App Primary Color
            }
        }

        
        var borderColor: CGColor {
            switch self {
           case .primary,.primaryWithIcon:
            return ColorKeys.CLEAR_COLOR.cgColor //White Color
            case .secondary,.secondaryWithIcon:
                return ColorKeys.P500.cgColor //App Primary Color
            case .tertiary,.tertiaryWithIcon:
                return ColorKeys.CLEAR_COLOR.cgColor //App Primary Color
            }
        }
    }
    
    
    //MARK:- Objects
    var buttonTypeEnum:ButtonTypeEnum = .medium{
        didSet{
            updateUI()
        }
    }

    var buttonStyleEnum:ButtonStyleEnum = .primary{
        didSet{
            updateUI()
        }
    }

    var isIconOnRightSide = false {
        didSet{
            updateIconAlignment()
        }
    }

    var buttonTitle = ""{
        didSet{
            updateButtonTitle()
        }
    }
    private let logoAnimation = AnimationView(name: "ButtonLoader")

    // MARK: - IBInspectable properties
    @IBInspectable private var CustomType:Int {
        get {
            return self.buttonTypeEnum.rawValue
        }
        set(index) {
            self.buttonTypeEnum = ButtonTypeEnum(rawValue: index) ?? .medium
        }
    }

    @IBInspectable private var CustomStyle:Int {
        get {
            return self.buttonStyleEnum.rawValue
        }
        set(index) {
            self.buttonStyleEnum = ButtonStyleEnum(rawValue: index) ?? .primary
        }
    }

    @IBInspectable private var isRightIcon:Bool{
           get {
            return isIconOnRightSide
           }
           set(status) {
            isIconOnRightSide = status
           }
       }

    //MARK:- Life Cycle
    override init(frame: CGRect) {
        super.init(frame:frame)
        updateUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateUI()
    }

    init(frame: CGRect,buttonType:ButtonTypeEnum?,buttonStyle:ButtonStyleEnum?) {
        super.init(frame: frame)
        if let buttonType = buttonType {
            buttonTypeEnum = buttonType
        }

        if let buttonStyle = buttonStyle {
            buttonStyleEnum = buttonStyle
        }

        updateUI()
    }

    //MARK:- Button State Handling
    override var state: UIControl.State
    {
        let state = super.state
        backgroundColor = buttonStyleEnum.backgroundColor(buttonState: state)
        switch state {
        case .disabled:
            alpha = 0.5
        default:
            alpha = 1
        }
        return state
    }

    //MARK:- Update
    private func updateUI(){
        //Default ButtonType set as Custom
        
        
        
        //Font
        titleLabel?.font = buttonTypeEnum.font
        titleLabel?.textAlignment = .center
        titleLabel?.lineBreakMode = .byTruncatingTail

        // TitleColor & BackgroundColor
        setTitleColor(buttonStyleEnum.titleColor, for: .normal)
        backgroundColor = buttonStyleEnum.backgroundColor(buttonState: .normal)

        //Border & Corner
        layer.cornerRadius = buttonTypeEnum.cornerRadius
        layer.borderWidth = 1
        layer.borderColor = buttonStyleEnum.borderColor

        updateIconAlignment()
        updateHeight()
    }

    private func updateIconAlignment(){
        if isIconOnRightSide {
            semanticContentAttribute = .forceRightToLeft
           imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        else
        {
            semanticContentAttribute = .forceLeftToRight
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)

        }
    }

   private func updateHeight() {

        // initwithframe
        if translatesAutoresizingMaskIntoConstraints {
            //Manual Update Height
            frame = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: buttonTypeEnum.height)
        }
        else{ //storyboard/xib
            //Update Height Constraint
            if let heightConstraint = constraints.first(where: { $0.firstAttribute == .height })
            {
                heightConstraint.constant = buttonTypeEnum.height
            }
            else
            {
                NSLayoutConstraint.activate([
                    heightAnchor.constraint(equalToConstant: buttonTypeEnum.height)
                ])
            }
        }
    }

    private func updateButtonTitle(){
        setTitle(buttonTitle, for: .normal)
    }

    var isShowLoading:Bool = false{
        didSet{
            isShowLoading ? showLoading() :hideLoading()
        }
    }



    private func showLoading(){
        logoAnimation.backgroundColor = buttonStyleEnum.backgroundColor(buttonState: .normal)
        logoAnimation.layer.cornerRadius = buttonTypeEnum.cornerRadius
        logoAnimation.contentMode = .scaleAspectFit
        logoAnimation.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoAnimation)
        logoAnimation.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        logoAnimation.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        logoAnimation.topAnchor.constraint(equalTo: topAnchor).isActive = true
        logoAnimation.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        logoAnimation.loopMode = .loop
        logoAnimation.play()
    }

    private func hideLoading(){
        logoAnimation.stop()
        logoAnimation.removeFromSuperview()
    }
}
