//
//  Player.m
//  2 Player Math
//
//  Created by Thiago Hissa on 2017-07-03.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "Player.h"

@interface Player ()

@end

@implementation Player

-(int)getAnswer{
    return (int)self.xValue + (int)self.yValue;
}

-(NSString *)getQuestion {
    _xValue = arc4random_uniform(20)+1;
    _yValue = arc4random_uniform(20)+1;
    NSString *question = [NSString stringWithFormat:@"%@ : %d + %d ?", self.name, (int)self.xValue, (int)self.yValue];
    _answer = _xValue + _yValue;
    return question;
}

- (instancetype)init
{
    
    self = [super init];
    if (self) {
        _lives = 3;
        _score = 0;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
