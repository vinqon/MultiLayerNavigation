//
//  MLTableView.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-17.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "MLTableView.h"
#import "MLNavigationController.h"

@implementation MLTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
    
    self.allowsSelection = NO;
        
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [self.firstAvailableNavigationController touchesEnded:touches withEvent:event];
    
    self.scrollEnabled = YES;
    self.allowsSelection = YES;
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:NO];
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    
    [self.firstAvailableNavigationController touchesCancelled:touches withEvent:event];
    
    self.scrollEnabled = YES;
    self.allowsSelection = YES;
    [self deselectRowAtIndexPath:[self indexPathForSelectedRow] animated:NO];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (MLNavigationController *)firstAvailableNavigationController
{
    if ([[self viewController].navigationController isKindOfClass:[MLNavigationController class]])
    {
        return (MLNavigationController *)[self viewController].navigationController;
    }
    
    return nil;
}

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
