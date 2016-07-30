//
//  CircleButton.m
//  CustomComponents
//
//  Created by Michael Lapuebla on 7/28/16.
//  Copyright © 2016 Michael Lapuebla. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton

// Default Button Values
#define kDefaultLineWidth       5.0
#define kInnerCirclePadding     5.0

/*
 Drawing adjustment made to frame.  This is due to the border width
 spilling past the actual frame when it draws.  This value basically
 contains the border width within the frame specified during the 
 initWithFrame method.
*/
#define kFrameDisplacement      kDefaultLineWidth / 2

// Default Button Values
#define kDefaultBorderColor     [UIColor darkGrayColor]
#define kDefaultInnerColor      [UIColor lightGrayColor]
#define kDefaultFontColor       [UIColor whiteColor]
#define kDefaultFontSize        [UIFont systemFontOfSize:12]

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Text Label
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
        [_textLabel setFont:kDefaultFontSize];
        [_textLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_textLabel];
        
        CGRect mainFrame = CGRectMake(kFrameDisplacement,
                                      kFrameDisplacement,
                                      frame.size.width - (2 * kFrameDisplacement),   // 2X multiplier is left and right padding
                                      frame.size.height - (2 * kFrameDisplacement)); // 2X multiplier is top and bottom padding
        
        // Draw Circle Outline
        UIBezierPath *circleOutlinePath = [UIBezierPath bezierPathWithOvalInRect:mainFrame];
        CAShapeLayer *circleOutlineLayer = [CAShapeLayer layer];
        [circleOutlineLayer setPath:circleOutlinePath.CGPath];
        [circleOutlineLayer setFillColor:[UIColor clearColor].CGColor];
        [circleOutlineLayer setStrokeColor:kDefaultBorderColor.CGColor];
        [circleOutlineLayer setLineWidth:kDefaultLineWidth];
        [self.layer insertSublayer:circleOutlineLayer below:_textLabel.layer];
        
        
        // Draw Inner Circle
        CGRect innerCircleFrame = CGRectMake(mainFrame.origin.x + kInnerCirclePadding,
                                             mainFrame.origin.y + kInnerCirclePadding,
                                             mainFrame.size.height - (2 * kInnerCirclePadding),
                                             mainFrame.size.height - (2 * kInnerCirclePadding));
        
        UIBezierPath *innerCirclePath = [UIBezierPath bezierPathWithOvalInRect:innerCircleFrame];
        CAShapeLayer *innerCircleLayer = [CAShapeLayer layer];
        [innerCircleLayer setPath:innerCirclePath.CGPath];
        [innerCircleLayer setFillColor:kDefaultInnerColor.CGColor];
        [innerCircleLayer setStrokeColor:[UIColor clearColor].CGColor];
        [innerCircleLayer setLineWidth:kDefaultLineWidth];
        [self.layer insertSublayer:innerCircleLayer below:_textLabel.layer];
    }
    return self;
}

@end
