//
//  UIActivityLabel.h
//  arremateFacil
//
//  Created by Guilherme Machado on 24/07/15.
//  Copyright (c) 2015 G2M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityLabel : UILabel

typedef NS_ENUM (NSInteger, ActivityPosition) {
    
    ActivityPositionCenter = 0,
    ActivityPositionLeft = 1,
    ActivityPositionRight = 2
    
};

@property (nonatomic) BOOL automaticStop;

-(void)setActivityViewColor:(UIColor *)color;
-(void)setActivityPosition:(enum ActivityPosition)position;
-(void)setAutomaticColor;
+(void)setAutomaticColorForCollection:(NSArray *)collection;

-(void)start;
-(void)stop;
-(void)clearTextAndStart;

+(void)startCollection:(NSArray *)collection;
+(void)stopCollection:(NSArray *)collection;
+(void)clearTextAndStartCollection:(NSArray *)collection;

@end
