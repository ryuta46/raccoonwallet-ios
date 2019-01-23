import UIKit

extension NSLayoutConstraint
{
    //We use a simple inspectable to allow us to set a value for iphone 4.
    @IBInspectable var iPhone4_Constant: CGFloat
        {
        set {
            //Only apply value to iphone 4 devices.
            if (UIScreen.main.bounds.size.height < 500)
            {
                self.constant = newValue;
            }
        }
        get
        {
            return self.constant;
        }
    }
}
