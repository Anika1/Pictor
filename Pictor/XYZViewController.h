//
//  XYZViewController.h
//  Pictor
//
//  Created by Anika on 3/29/14.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface XYZViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{}


@property (weak, nonatomic) IBOutlet UIToolbar *cameraButton;

@property (weak, nonatomic) IBOutlet UIImageView *Photo;

- (IBAction)cameraButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password;
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user;

/// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error;

/// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController;




@end
