//
//  XYZViewController.m
//  Pictor
//
//  Created by Anika on 3/29/14.
//
//

#import "XYZViewController.h"
#import <Parse/Parse.h>
#import "PicSelectViewController.h"
@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad{

    [super viewDidLoad];
}
- (void) viewDidAppear:(BOOL)animated {
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    PicSelectViewController *xyz = [[PicSelectViewController alloc] initWithNibName:@"PicSelectViewController" bundle:nil];
    [self presentViewController:xyz animated:NO completion:NULL];
    
}

// Do any additional setup after loading the view, typically from a nib.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButtonPressed:(id)sender {

    
//isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
   // UIImage *chosenImage =
   // info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    
[picker dismissViewControllerAnimated:YES completion:NULL];

    
    // UIImagePickerControllerEditedImage is useful if you allowed
    // editing of images
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    if (image == nil)
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"Hi");
    // Do something with the image
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    

    
}


@end
