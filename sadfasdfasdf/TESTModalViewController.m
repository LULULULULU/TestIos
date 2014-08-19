//
//  TESTModalViewController.m
//  sadfasdfasdf
//
//  Created by Wu,Lu on 8/19/14.
//  Copyright (c) 2014 Cerner Corporation. All rights reserved.
//

#import "TESTModalViewController.h"

@interface TESTModalViewController ()

@end

@implementation TESTModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    self.view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)presentFullScreenModal:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    TESTModalViewController *controller = (TESTModalViewController*)[storyboard instantiateViewControllerWithIdentifier:@"TESTNavModalViewController"];

    
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)presentPageSheetModal:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    TESTModalViewController *controller = (TESTModalViewController*)[storyboard instantiateViewControllerWithIdentifier:@"TESTNavModalViewController"];
    
    controller.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:controller animated:YES completion:nil];
    
}

@end
