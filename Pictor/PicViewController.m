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

@property (weak, nonatomic) IBOutlet PaintingView *paintView;

@end

@implementation PicViewController

- (IBAction)redTouched:(id)sender {
    [self changeBrushColor:[UIColor colorWithRed:255/255.0f green:63/255.0f blue:46/255.0f alpha:1.0f]];
    NSLog(@"Red");
}

- (IBAction)yellowTouched:(id)sender {
    [self changeBrushColor:[UIColor colorWithRed:255/255.0f green:228/255.0f blue:27/255.0f alpha:1.0f]];
    NSLog(@"Yellow");
}

- (IBAction)greenTouched:(id)sender {
    [self changeBrushColor:[UIColor colorWithRed:159/255.0f green:228/255.0f blue:27/255.0f alpha:1.0f]];
    NSLog(@"Green");
}

- (IBAction)blueTouched:(id)sender {
    [self changeBrushColor:[UIColor colorWithRed:114/255.0f green:183/255.0f blue:254/255.0f alpha:1.0f]];
    NSLog(@"Blue");
}

- (IBAction)purpleTouched:(id)sender {
//    [self changeBrush Color:[UIColor colorWithRed:179/255.0f green:58/255.0f blue:229/255.0f alpha:1.0f]];
    [self.paintView setBrushColorWithRed:179/255.0f green:58/255.0f blue:229/255.0f];
    NSLog(@"Purple");
}

- (IBAction)smallTouched:(id)sender {
}

- (IBAction)mediumTouched:(id)sender {
}

- (IBAction)largeTouched:(id)sender {
}

- (IBAction)clearTouched:(id)sender {
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

- (void)changeBrushColor:(UIColor*)color
{
    CGColorRef colorref = color.CGColor;
    const CGFloat *components = CGColorGetComponents(colorref);
    // Defer to the OpenGL view to set the brush color
    [self.paintView setBrushColorWithRed:components[0] green:components[1] blue:components[2]];
}
- (void)eraseView
{
	[self.paintView erase];
}
@end
