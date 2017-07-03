//
//  GameModel.m
//  2 Player Math
//
//  Created by Thiago Hissa on 2017-07-03.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "GameModel.h"

@interface GameModel ()

@end

@implementation GameModel

-(BOOL)getLives: (Player*)player1 andPlayer2: (Player*)player2 {
    BOOL GAMEOVER = NO;
    if(player1.lives == 0 || player2.lives == 0){
        GAMEOVER = YES;
    }else{
        GAMEOVER = NO;
    }
    return GAMEOVER;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
