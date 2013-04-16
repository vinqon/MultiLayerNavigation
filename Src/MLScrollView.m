//
//  MLScrollView.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-12.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "MLScrollView.h"
#import "MLNavigationController.h"


@interface UIView (FindUIViewController)

- (UIViewController *)viewController;

@end


@implementation MLScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (MLNavigationController *)firstAvailableNavigationController
{
    if ([[self viewController].navigationController isKindOfClass:[MLNavigationController class]])
    {
        return (MLNavigationController *)[self viewController].navigationController;
    }
    
    return nil;
}

#pragma mark - UIResponse Subclassing -

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    //send the event to MLNavigationController
    [self.firstAvailableNavigationController touchesBegan:touches withEvent:event];
    
    self.scrollEnabled = NO;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];

    [self.firstAvailableNavigationController touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{    
    [super touchesEnded:touches withEvent:event];
    
    [self.firstAvailableNavigationController touchesEnded:touches withEvent:event];
    
    self.scrollEnabled = YES;

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    [self.firstAvailableNavigationController touchesCancelled:touches withEvent:event];
    
    self.scrollEnabled = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end



@implementation UIView (FindUIViewController)

// Get to UIViewController from UIView on iPhone?
// http://stackoverflow.com/a/3732812/1104158


- (UIViewController *)viewController {
    /// Finds the view's view controller.
    
    // Traverse responder chain. Return first found view controller, which will be the view's view controller.
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    // If the view controller isn't found, return nil.
    return nil;
}
@end

