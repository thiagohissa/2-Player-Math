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





-(void)getAnswerAndUpdateScore: (NSInteger)answerValue{
            if(self.answer == answerValue){
                self.score = self.score + 1;
            }
            else{
                self.score = self.score - 1;
                self.lives = self.lives - 1;
            }

}


-(int)getAnswer{
    return (int)self.xValue + (int)self.yValue;
}

-(NSString *)getQuestion {
    
    
    int chooseQuestion = arc4random_uniform(4);
    _xValue = arc4random_uniform(20)+1;
    _yValue = arc4random_uniform(20)+1;
    
    if(chooseQuestion==0){
    NSString *question = [NSString stringWithFormat:@"%@ : %d + %d ?", self.name, (int)self.xValue, (int)self.yValue];
    _answer = _xValue + _yValue;
        return question;
    }
    else if(chooseQuestion==1){
        NSString *question = [NSString stringWithFormat:@"%@ : %d * %d ?", self.name, (int)self.xValue, (int)self.yValue];
        _answer = _xValue*_yValue;
        return question;
    }
    else if(chooseQuestion==2){
        NSString *question = [NSString stringWithFormat:@"%@ : %d / %d ?", self.name, (int)self.xValue, (int)self.yValue];
        _answer = _xValue/_yValue;
        return question;
    }
    else {
        NSString *question = [NSString stringWithFormat:@"%@ : %d - %d ?", self.name, (int)self.xValue, (int)self.yValue];
        _answer = _xValue-_yValue;
        return question;
    }
    
    
    
    
}



- (instancetype)init:(int)lives andScore:(int)score andName:(NSString*)name
{
    self = [super init];
    if (self) {
        _lives = lives;
        _score = 0;
        _name = name;
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
