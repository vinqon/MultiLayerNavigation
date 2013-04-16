//
//  MLNavigationController.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-12.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]

#import "MLNavigationController.h"
#import <QuartzCore/QuartzCore.h>

@interface MLNavigationController ()
{
    CGPoint startTouch;
    BOOL isMoving;
    
    UIImageView *lastScreenShotView;
    UIView *blackMask;
}

@property (nonatomic,retain) UIView *backgroundView;
@property (nonatomic,retain) NSMutableArray *screenShotsList;

@end

@implementation MLNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.screenShotsList = [[[NSMutableArray alloc]initWithCapacity:2]autorelease];
        self.canDragBack = YES;
        
    }
    return self;
}

- (void)dealloc
{
    self.screenShotsList = nil;
    
    [self.backgroundView removeFromSuperview];
    self.backgroundView = nil;
    
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // draw a shadow for navigation view to differ the layers obviously.
    // using this way to draw shadow will lead to the low performace
    // the best alternative way is making a shadow image.
    //
    //self.view.layer.shadowColor = [[UIColor blackColor]CGColor];
    //self.view.layer.shadowOffset = CGSizeMake(5, 5);
    //self.view.layer.shadowRadius = 5;
    //self.view.layer.shadowOpacity = 1;
    
    UIImageView *shadowImageView = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"leftside_shadow_bg"]]autorelease];
    shadowImageView.frame = CGRectMake(-10, 0, 10, self.view.frame.size.height);
    [self.view addSubview:shadowImageView];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.screenShotsList addObject:[self capture]];
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.screenShotsList removeLastObject];
    
    return [super popViewControllerAnimated:animated];
}

#pragma mark - Utility Methods -

// get the current view screen shot
- (UIImage *)capture
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)moveViewWithX:(float)x
{

    x = x>320?320:x;
    x = x<0?0:x;
    
    CGRect frame = self.view.frame;
    frame.origin.x = x;
    self.view.frame = frame;
    
    float scale = (x/6400)+0.95;
    float alpha = 0.4 - (x/800);

    lastScreenShotView.transform = CGAffineTransformMakeScale(scale, scale);
    blackMask.alpha = alpha;
    
}

#pragma mark - UIResponse Subclassing Methods -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"navi touch begin");
    [super touchesBegan:touches withEvent:event];
    
    if (self.viewControllers.count <= 1 || !self.canDragBack) return;
    
    isMoving = NO;
    startTouch = [((UITouch *)[touches anyObject])locationInView:KEY_WINDOW];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
//    NSLog(@"navi touch move:%f",[((UITouch *)[touches anyObject])locationInView:KEY_WINDOW].x);

    if (self.viewControllers.count <= 1 || !self.canDragBack) return;
    
    CGPoint moveTouch = [((UITouch *)[touches anyObject])locationInView:KEY_WINDOW];

    
    
    if (!isMoving) {
        if(moveTouch.x - startTouch.x > 10)
        {
            isMoving = YES;
            
            if (!self.backgroundView)
            {
                CGRect frame = self.view.frame;
                
                self.backgroundView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)]autorelease];
                [self.view.superview insertSubview:self.backgroundView belowSubview:self.view];
                
                blackMask = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width , frame.size.height)]autorelease];
                blackMask.backgroundColor = [UIColor blackColor];
                [self.backgroundView addSubview:blackMask];
            }
            
            if (lastScreenShotView) [lastScreenShotView removeFromSuperview];
            
            UIImage *lastScreenShot = [self.screenShotsList lastObject];
            lastScreenShotView = [[[UIImageView alloc]initWithImage:lastScreenShot]autorelease];
            [self.backgroundView insertSubview:lastScreenShotView belowSubview:blackMask];

        }
    }
    
    if (isMoving) {
        [self moveViewWithX:moveTouch.x - startTouch.x];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"navi touch end");

    
    [super touchesEnded:touches withEvent:event];
    
    if (self.viewControllers.count <= 1 || !self.canDragBack) return;

    CGPoint endTouch = [((UITouch *)[touches anyObject])locationInView:KEY_WINDOW];

    if (endTouch.x - startTouch.x > 50)
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self moveViewWithX:320];
        } completion:^(BOOL finished) {

            [self popViewControllerAnimated:NO];
            CGRect frame = self.view.frame;
            frame.origin.x = 0;
            self.view.frame = frame;
            NSLog(@"Show the pop vc");

            isMoving = NO;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self moveViewWithX:0];
        } completion:^(BOOL finished) {
            isMoving = NO;
        }];

    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"navi touch cancel");

    
    [super touchesCancelled:touches withEvent:event];
    
    if (self.viewControllers.count <= 1 || !self.canDragBack) return;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self moveViewWithX:0];
    } completion:^(BOOL finished) {
        isMoving = NO;
    }];
}

@end
