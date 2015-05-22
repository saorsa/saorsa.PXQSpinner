//
//  PXQViewController.m
//  PXQSpinner
//
//  Created by Atanas Dragolov on 03/24/2015.
//  Copyright (c) 2014 Atanas Dragolov. All rights reserved.
//

#import "PXQViewController.h"
#import <PXQSpinner/PXQSpinner.h>

@implementation PXQViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
	
    PXQSpinner * spinner = [PXQSpinner setOnView:self.view withTitle:@"We are loading..." animated:YES];
    
    spinner.lineTintColor = [UIColor blueColor];
    
    spinner.lineWidth = 2;
    
    spinner.titleFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:12];
    
    spinner.titleColor = [UIColor blackColor];
}

@end
