
import UIKit
import Corduroy

final class SignupCompleteViewController: UIViewController, CoordinatorManageable {
    var coordinator: SignupFlowCoordinator?
    
    private let usernameLabel = UILabel()
    private let passwordLabel = UILabel()
    private let securityQuestionLabel = UILabel()
    private let securityAnswerLabel = UILabel()
    
    var signupInfo: SignupInfo? {
        didSet {
            guard let signupInfo = signupInfo else { return }
            
            usernameLabel.text = "Username: \"\(signupInfo.username)\""
            passwordLabel.text = "Password: \"\(signupInfo.password)\""
            securityQuestionLabel.text = "Security Question: \"\(signupInfo.securityQuestion)\""
            securityAnswerLabel.text = "Security Question Answer: \"\(signupInfo.securityAnswer)\""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Success"
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Here's the information you provided:"
        self.view.addSubview(label)
        NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 100).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [self.usernameLabel, self.passwordLabel, self.securityQuestionLabel, self.securityAnswerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.axis = .vertical
        self.view.addSubview(stackView)
        NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: label, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        
        let continueButton = UIButton(type: .system)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Continue", for: .normal)
        continueButton.addTarget(self, action: #selector(continuePressed), for: .touchUpInside)
        self.view.addSubview(continueButton)
        NSLayoutConstraint(item: continueButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: continueButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -50).isActive = true
    }
    
    @objc func continuePressed(sender: UIButton) {
        self.coordinator?.signupCompleteViewControllerDidPressContinue(self)
    }
}