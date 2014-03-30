//
//  PicViewController.h
//  Pictor
//
//  Created by Austin Riopelle on 3/29/14.
//  Copyright (c) 2014 acerio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *shareButton;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)shareButtonPressed:(id)sender;

@end
