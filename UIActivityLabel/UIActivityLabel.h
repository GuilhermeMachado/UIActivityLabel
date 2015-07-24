//
//  UIActivityLabel.h
//  arremateFacil
//
//  Created by Guilherme Machado on 24/07/15.
//  Copyright (c) 2015 G2M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityLabel : UILabel

@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;

-(void)start;
-(void)stop;
-(void)emptyTextAndStart;

+(void)startCollection:(NSArray *)collection;
+(void)stopCollection:(NSArray *)collection;
+(void)emptyTextAndStartCollection:(NSArray *)collection;

-(void)setActivityViewColor:(UIColor *)color;
-(void)setActivityViewLocation:(CGPoint)location;

@end
