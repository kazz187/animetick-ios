//
//  ATCheckbox.m
//  Animetick
//
//  Created by yayugu on 2013/08/06.
//  Copyright (c) 2013年 Kazuki Akamine. All rights reserved.
//

#import "ATTicketWatchButton.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ATTicketWatchButton ()

@property (nonatomic, strong) UILabel *checkLabel;

@end

@implementation ATTicketWatchButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor blackColor];
        
        CGRect frame = {
            .origin.x = 0,
            .origin.y = 0,
            .size = self.frame.size
        };
        self.checkLabel = [[UILabel alloc] initWithFrame:frame];
        self.checkLabel.backgroundColor = [UIColor clearColor];
        self.checkLabel.textColor = [UIColor whiteColor];
        
        // 90度
        self.checkLabel.transform = CGAffineTransformMakeRotation(M_PI / 2);
        CGRect bounds = {
            .origin.x = 0,
            .origin.y = 0,
            .size.width = self.frame.size.height,
            .size.height = self.frame.size.width
        };
        self.checkLabel.bounds = bounds;
        [self addSubview:self.checkLabel];
        
        self.longPressGestureRecognizer =
          [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(onLongPressGesture:)];
        [self addGestureRecognizer:self.longPressGestureRecognizer];
    }
    return self;
}

- (void)setChecked:(BOOL)checked
{
    _checked = checked;
    
    if (checked) {
        self.checkLabel.text = @"watched";
    } else {
        self.checkLabel.text = @"watch";
    }
}

- (void)onLongPressGesture:(UILongPressGestureRecognizer*)recognizer
{
    switch (recognizer.state) {
        // 長押し認識
        case UIGestureRecognizerStateBegan:
            [self sendActionsForControlEvents:ATTicketWatchButtonEventLongPress];
            break;
        default:
            break;
    }
}

@end