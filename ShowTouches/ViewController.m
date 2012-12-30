//
//  ViewController.m
//  ShowTouches
//
//  Created by JASON EVERETT on 12/30/12.
//  Copyright (c) 2012 JASON EVERETT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {    
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self.view];
        // Draw a red circle where the touch occurred
        UIView *touchView = [[UIView alloc] init];
        [touchView setBackgroundColor:[UIColor redColor]];
        touchView.frame = CGRectMake(touchPoint.x - 15, touchPoint.y - 15, 30, 30);
        touchView.layer.cornerRadius = 15;
        touchView.alpha = 0.8;
        [self.view addSubview:touchView];
        [self fadeOutView:touchView];
    }];
}

-(void)fadeOutView:(UIView *)myView {
    [UIView animateWithDuration:1.0 animations:^{
        myView.alpha = 0.8; myView.alpha = 0.0;
    } completion:^(BOOL success) {
        if (success) {
            [myView removeFromSuperview];
        }
    }];
}

@end
