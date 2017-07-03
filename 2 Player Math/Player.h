//
//  Player.h
//  2 Player Math
//
//  Created by Thiago Hissa on 2017-07-03.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Player : UIViewController
@property (nonatomic) int lives;
@property (nonatomic) int score;
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger xValue;
@property (nonatomic) NSInteger yValue;
@property (nonatomic) NSInteger answer;
-(NSString *)getQuestion;
-(int)getAnswer;
@end
