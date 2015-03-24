////////////////////////////////////////////////////////////////////////////
//
//  PXQSpinner.h
//  Pods
//
//  Created by Dragolov,Atanas on 24.03.15.
//
////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>

@interface PXQSpinner : UIView

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) UIColor *lineTintColor;

- (void)start;

- (void)stop;

+ (instancetype)setOnView:(UIView *)view withTitle:(NSString *)title animated:(BOOL)animated;

+ (BOOL)hideFromView:(UIView *)view animated:(BOOL)animated;

@end
