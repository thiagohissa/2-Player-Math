//
//  ViewController.m
//  2 Player Math
//
//  Created by Thiago Hissa on 2017-07-03.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (nonatomic) Player *playerONE;

@property (nonatomic) Player *playerTWO;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel1;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel2;



@property (nonatomic) BOOL player1;

@end

@implementation ViewController


- (IBAction)button0:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"0"];
}
- (IBAction)button1:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"1"];
}
- (IBAction)button2:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"2"];
}
- (IBAction)button3:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"3"];
}
- (IBAction)button4:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"4"];
}
- (IBAction)button5:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"5"];
}
- (IBAction)button6:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"6"];
}
- (IBAction)button7:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"7"];
}
- (IBAction)button8:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"8"];
}
- (IBAction)button9:(id)sender {
    _answerLabel.text = [_answerLabel.text stringByAppendingString:@"9"];
}





- (IBAction)submitButton:(id)sender {
    
    
    GameModel *gameModel = [GameModel new];
    NSInteger answer =  [_answerLabel.text integerValue];
    
    // Updates Score
    if(!_player1){
        if(_playerONE.answer == answer){
            _playerONE.score = _playerONE.score + 1;
        }
        else{
            _playerONE.score = _playerONE.score - 1;
            _playerONE.lives = _playerONE.lives - 1;
        }
        
    }
    else{
        if(_playerTWO.answer == answer){
            _playerTWO.score = _playerTWO.score + 1;
        }
        else{
            _playerTWO.score = _playerTWO.score - 1;
            _playerTWO.lives = _playerTWO.lives - 1;
        }
        
        
    }
    
    
    // Select next player
    if(_player1){
        _playerLabel.text = [_playerONE getQuestion];
        _player1 = NO;
    }
    else if(!_player1){
        _playerLabel.text = [_playerTWO getQuestion];
        _player1 = YES;
    }
    
    _scoreLabel1.text = [NSString stringWithFormat:@"Score 1: %d", _playerONE.score];
    _scoreLabel2.text = [NSString stringWithFormat:@"Score 2: %d", _playerTWO.score];
    
    if([gameModel getLives:_playerONE andPlayer2:_playerTWO]){
        _answerLabel.text = @"##### GAME OVER #####";
    }
    else{
        _answerLabel.text = @"";
    }
    
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Player *player1 = [[Player alloc] init];
    Player *player2 = [[Player alloc] init];
    player1.name = @"Player 1";
    player2.name = @"Player 2";
    
    
    _playerONE = player1;
    _playerTWO = player2;
    
    _playerLabel.text = [_playerONE getQuestion];
    _player1 = NO;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
