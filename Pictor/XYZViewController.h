//
//  XYZViewController.h
//  Pictor
//
//  Created by Anika on 3/29/14.
//
//

#import <UIKit/UIKit.h>

@interface XYZViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIToolbar *cameraButton;

@property (weak, nonatomic) IBOutlet UIImageView *Photo;

- (IBAction)cameraButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;



@end
