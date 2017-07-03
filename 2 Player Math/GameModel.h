//
//  GameModel.h
//  2 Player Math
//
//  Created by Thiago Hissa on 2017-07-03.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface GameModel : UIViewController
-(BOOL)getLives: (Player*)player1 andPlayer2: (Player*)player2;
@end
