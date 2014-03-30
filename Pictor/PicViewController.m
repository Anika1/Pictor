//
//  PicViewController.m
//  Pictor
//
//  Created by Austin Riopelle on 3/29/14.
//  Copyright (c) 2014 acerio. All rights reserved.
//

#import "PicViewController.h"
#import "PaintingView.h"

//CONSTANTS:

#define kBrightness             1.0
#define kSaturation             0.45

#define kPaletteHeight			30
#define kPaletteSize			5
#define kMinEraseInterval		0.5

// Padding for margins
#define kLeftMargin				10.0
#define kTopMargin				10.0
#define kRightMargin			10.0

@interface PicViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *CameraButton;

@property (weak, nonatomic) IBOutlet PaintingView *paintView;

@property (weak, nonatomic) IBOutlet UIButton *redB;
@property (weak, nonatomic) IBOutlet UIButton *greenB;
@property (weak, nonatomic) IBOutlet UIButton *yellowB;
@property (weak, nonatomic) IBOutlet UIButton *blueB;
@property (weak, nonatomic) IBOutlet UIButton *purpleB;

@end

@implementation PicViewController

@synthesize imageView;


- (IBAction)clearTouched:(id)sender {
    [self eraseView];
}

- (IBAction)redTouched:(id)sender {
    [self changeBrushColorWithRed: 255/255.0f Green:63/255.0f Blue:46/255.0f];
    NSLog(@"Red");
}

- (IBAction)yellowTouched:(id)sender {
    [self changeBrushColorWithRed:255/255.0f Green:228/255.0f Blue:27/255.0f];
    NSLog(@"Yellow");
}

- (IBAction)greenTouched:(id)sender {
    [self changeBrushColorWithRed:159/255.0f Green:228/255.0f Blue:27/255.0f];
    NSLog(@"Green");
}

- (IBAction)blueTouched:(id)sender {
    [self changeBrushColorWithRed:114/255.0f Green:183/255.0f Blue:254/255.0f];
    NSLog(@"Blue");
}

- (IBAction)purpleTouched:(id)sender {
    [self.paintView setBrushColorWithRed:179/255.0f green:58/255.0f blue:229/255.0f];
    NSLog(@"Purple");
}

- (IBAction)smallTouched:(id)sender {
    self.paintView.kBrushScale = 4.0;
    [self.paintView changeSize];
}

- (IBAction)mediumTouched:(id)sender {
    self.paintView.kBrushScale = 2.0;
    [self.paintView changeSize];
}

- (IBAction)largeTouched:(id)sender {
    self.paintView.kBrushScale = 1.0;
    [self.paintView changeSize];
}

- (IBAction)shareTouched:(id)sender {
    
    UIImage *yourImage = [self.paintView imageRepresentation];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:@"Image",yourImage, nil] applicationActivities:nil];
    activityVC.excludedActivityTypes = @[ UIActivityTypeAddToReadingList ,UIActivityTypeAssignToContact,
        UIActivityTypePrint];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.paintView setBrushColorWithRed:255/255.0f green:0/255.0f blue:0/255.0f];
    
    // self.paintView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeBrushColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue
{
    [self.paintView setBrushColorWithRed:red green:green blue:blue];
}
- (void)eraseView
{
	[self.paintView erase];
}
- (IBAction)shareButtonPressed:(id)sender {
    NSString *message = @"Hello World!";
    UIImage *imageToShare = [UIImage imageNamed:@"facebook.jpeg"];
    
    NSArray *postItems = @[message, imageToShare];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]
                                            initWithActivityItems:postItems
                                            applicationActivities:nil];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)cameraButtonPressed:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Picture", @"Select Photo",nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[actionSheet showInView:self.view];
    
    //isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	//Take Picture
	if(buttonIndex == 0){
     
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
      
	}
	
	//Select Photo
	if (buttonIndex == 1){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
        

	}
	else
	{
	}
	

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // UIImage *chosenImage =
    // info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
    // UIImagePickerControllerEditedImage is useful if you allowed
    // editing of images
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //[self addImageToView:image];
    imageView.image = image;
    NSLog(@"Hi");
    // Do something with the image
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
/*
-(void) addImageToView:(UIImage*)pic{
    UIImage* imageToAdd= pic;
    
    
    
    // all images added to the paining view MUST be 512x512.
    // You can also add smaller images (even transformed ones) using this method - just add it to a UIView //and then get it's graphics context

    UIView* imageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
	
	
	
	UIImageView* subView   = [[UIImageView alloc] initWithImage:imageToAdd];
	
    
    [imageView addSubview:subView];
	UIImage* blendedImage =nil;
	
	
	
	UIGraphicsBeginImageContext(imageView.frame.size);
	
	[imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
	
	blendedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	[self.paintView mergeWithImage: blendedImage ];
    
    
    
}*/
@end
