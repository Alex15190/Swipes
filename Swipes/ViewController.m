//
//  ViewController.m
//  Swipes
//
//  Created by Alex Chekodanov on 09.09.2018.
//  Copyright © 2018 MERA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
//@property (nonatomic) CGPoint gestureStartPoint;

@end

//static CGFloat const kMinimumGestureLength = 25;
//static CGFloat const kMaximumVariance = 5;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    for (NSUInteger touchCount = 1; touchCount <= 5; touchCount++) {
        UISwipeGestureRecognizer *vertical = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportVerticalSwipe:)];
        vertical.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
        vertical.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:vertical];
        
        UISwipeGestureRecognizer *horizontal = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportHorizontalSwipe:)];
        horizontal.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
        horizontal.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:horizontal];
    }
}

- (void)eraseText
{
    self.label.text = @"";
}

- (NSString *)descriptionForTouchCount:(NSUInteger)touchCount
{
    switch (touchCount) {
        case 1:
            return @"Single ";
        case 2:
            return @"Double ";
        case 3:
            return @"Triple ";
        case 4:
            return @"Quadruple ";
        case 5:
            return @"Quintuple ";
        default:
            return @"";
    }
}

#pragma mark Touch Handling
/*
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.gestureStartPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self.view];
    
    CGFloat deltaX = fabs(self.gestureStartPoint.x - currentPosition.x);
    CGFloat deltaY = fabs(self.gestureStartPoint.y - currentPosition.y);
    
    if (deltaX >= kMinimumGestureLength && deltaY <= kMaximumVariance)
    {
        self.label.text = @"Horizontal swipe detected";
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
    }
    else if (deltaY >= kMinimumGestureLength && deltaX <= kMaximumVariance)
    {
        self.label.text = @"Vertical swipe detected";
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
    }
}
*/

- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer
{
    self.label.text = [NSString stringWithFormat:@"%@Horizontal swipe detected", [self descriptionForTouchCount:[recognizer numberOfTouches]]];
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer
{
    self.label.text = [NSString stringWithFormat:@"%@Vertical swipe detected", [self descriptionForTouchCount:[recognizer numberOfTouches]]];
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}



@end
