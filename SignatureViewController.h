

#import <UIKit/UIKit.h>

@class SignatureView;

@interface SignatureViewController : UIViewController
{
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    NSString *image_base_64;
    NSMutableDictionary *dict;
    
    UIButton *RE_Do_Photo;
    UIButton *Upload_Button;
    UIButton *Cancel_Button;


}

@property (nonatomic, retain) SignatureView *signatureView;
@property(retain,nonatomic)NSString *Pack_Key;

@end
