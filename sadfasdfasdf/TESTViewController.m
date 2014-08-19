//
//  TESTViewController.m
//  sadfasdfasdf
//
//  Created by Wu,Lu on 8/11/14.
//  Copyright (c) 2014 Cerner Corporation. All rights reserved.
//

#import "TESTViewController.h"
#import "TESTModalViewController.h"

static NSInteger a[] = {200,150,100};
static NSInteger b[] = {100,125,150,175};
static NSInteger aa = 3;
static NSInteger bb = 2;

NSInteger aaa = 0;
NSInteger bbb = 0;

NSInteger getNext(NSInteger *cur, NSInteger max, NSInteger ary[]) {return ary[++(*cur) % max];}

@interface TESTViewController ()
@property (weak, nonatomic) IBOutlet UIView *topContainer;
@property (weak, nonatomic) IBOutlet UIView *middleContainer;
@property (weak, nonatomic) IBOutlet UIView *bottomContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleContainerHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContainerHeight;
@property (weak, nonatomic) UIViewController *topController;
@property (weak, nonatomic) UIViewController *midController;
@property (weak, nonatomic) UIViewController *botController;
@end

@implementation TESTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"top"]) {
        self.topController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:@"middle"]) {
        self.midController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:@"bottom"]) {
        self.botController = segue.destinationViewController;
    }
}

- (IBAction)nextSize:(id)sender
{
    self.middleContainerHeight.constant = getNext(&aaa, aa, a);
    self.bottomContainerHeight.constant = getNext(&bbb, bb, b);
    [self.view layoutIfNeeded];
}


- (IBAction)swap:(id)sender
{
    NSInteger offset = 0;
    
    UIView *oldTop = (UIView *)[self.topController nextResponder];
    UIView *oldMid = (UIView *)[self.midController nextResponder];
    UIView *oldBot = (UIView *)[self.botController nextResponder];
    
    [self.topController.view removeFromSuperview];
    [self.midController.view removeFromSuperview];
    [self.botController.view removeFromSuperview];
    
    self.botController.view.frame = CGRectMake(0, 0, oldTop.frame.size.width - offset, oldTop.frame.size.height - offset);
    [oldTop addSubview:self.botController.view];
    self.topController.view.frame = CGRectMake(0, 0, oldMid.frame.size.width - offset, oldMid.frame.size.height - offset);
    [oldMid addSubview:self.topController.view];
    self.midController.view.frame = CGRectMake(0, 0, oldBot.frame.size.width - offset, oldBot.frame.size.height - offset);
    [oldBot addSubview:self.midController.view];
    
    [self.view layoutIfNeeded];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"----------------------------------");
    NSLog(@"Top:  %4.1f, %4.1f, %4.1f, %4.1f", self.topController.view.frame.origin.x, self.topController.view.frame.origin.y, self.topController.view.frame.size.width, self.topController.view.frame.size.height);
    UIView *view = (UIView *)[self.topController nextResponder];
    NSLog(@"TopC: %4.1f, %4.1f, %4.1f, %4.1f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);

    NSLog(@"Mid:  %4.1f, %4.1f, %4.1f, %4.1f", self.midController.view.frame.origin.x, self.midController.view.frame.origin.y, self.midController.view.frame.size.width, self.midController.view.frame.size.height);
    view = (UIView *)[self.midController nextResponder];
    NSLog(@"MidC: %4.1f, %4.1f, %4.1f, %4.1f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);

    NSLog(@"Bot:  %4.1f, %4.1f, %4.1f, %4.1f", self.botController.view.frame.origin.x, self.botController.view.frame.origin.y, self.botController.view.frame.size.width, self.botController.view.frame.size.height);
    view = (UIView *)[self.botController nextResponder];
    NSLog(@"BotC: %4.1f, %4.1f, %4.1f, %4.1f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    NSLog(@"----------------------------------");
}

- (IBAction)modalTest:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    TESTModalViewController *controller = (TESTModalViewController*)[storyboard instantiateViewControllerWithIdentifier:@"TESTNavModalViewController"];
    
    
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    
    CGFloat r = arc4random() % 255;
    CGFloat g = arc4random() % 255;
    CGFloat b = arc4random() % 255;
    controller.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
