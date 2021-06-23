# NSCustomButton
Custom Button Component

Demonstration of Custom Component (Button)

Library:- Used Lottie for Button Animation <br>
Assets:- Color Plates (You can user your app colors) <br>
Fonts:- Custom Fonts (You can use your app font style)



## Application Preview

#### Custom Button
<img src="/Read%20Files/CustomButton.gif" width="292" height="632.6"> <img src="/Read%20Files/0.png" width="292" height="632.6"> 

#### How to Use Button Via XIB / StoryBoard with Different Styles & Size <br>
<img src="/Read%20Files/1.png"> <br>

#### How to Use Button Via Programmatically with Different Styles & Size

    func addNewButton() {
        let myButton = CustomButton(frame: CGRect(x: 10, y: 10, width: 100, height: 40), buttonType: .medium, buttonStyle: .secondary)
        self.view.addSubview(myButton)
    }

    @IBAction func lodingButtonAction(_ sender: CustomButton) {
        sender.isShowLoading = true
        
        // Stop Loading when your process work is Done.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            sender.isShowLoading = false
        }
    }

## Contact
<b>Developer :- </b> Neeraj Solanki </br>
</b>Profile :- </b> Senior iOS Engineer </br>
</b>Website :- <b> <a href="https//www.neerajsolanki.xyz">Click Here</a> </br>
</b>LinkedIn :- <b> <a href="https://www.linkedin.com/in/neerajsolanki/">Click Here</a>

