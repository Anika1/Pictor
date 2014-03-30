//
//  XYZViewController.h
//  Pictor
//
//  Created by Anika on 3/29/14.
//
//

#import <UIKit/UIKit.h>

@interface XYZViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIToolbar *cameraButton;
- (IBAction)cameraButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Photo;

@end
