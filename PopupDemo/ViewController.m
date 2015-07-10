//
//  ViewController.m
//  PopupDemo
//
//  Created by Varun Naharia on 07/07/15.
//  Copyright (c) 2015 TechWizard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize isOpen;
- (void)viewDidLoad {
    [super viewDidLoad];
    isOpen = NO;
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)open:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *newVC = (UIViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Second"];
    [ViewController setPresentationStyleForSelfController:self presentingController:newVC];
    [self.navigationController presentViewController:newVC animated:YES completion:nil];
    
}

+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        presentingController.providesPresentationContextTransitionStyle = YES;
        presentingController.definesPresentationContext = YES;
        
        [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    }
    else
    {
        [selfController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [selfController.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
    }
}


@end
