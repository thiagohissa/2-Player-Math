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



@property (nonatomic) BOOL turn;

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
    if(!_turn){
        [_playerONE getAnswerAndUpdateScore:answer];
    }
    else{
        [_playerTWO getAnswerAndUpdateScore:answer];
    }
    
    
    // Select next player
    if(_turn){
        _playerLabel.text = [_playerONE getQuestion];
        _turn = NO;
    }
    else if(!_turn){
        _playerLabel.text = [_playerTWO getQuestion];
        _turn = YES;
    }
    
    _scoreLabel1.text = [NSString stringWithFormat:@"Score 1: \t %d", _playerONE.score];
    _scoreLabel2.text = [NSString stringWithFormat:@"Score 2: \t %d", _playerTWO.score];
    
    if([gameModel getLives:_playerONE andPlayer2:_playerTWO]){
        _answerLabel.text = @"########### GAME OVER ############";
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Restart" message:@"Restart the game ?" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
            NSLog(@"Goodbye");
        }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            _playerONE.score = 0;
            _playerONE.lives = 3;
            _playerTWO.score = 0;
            _playerTWO.lives = 3;
            _scoreLabel1.text = [NSString stringWithFormat:@"Score 1: \t %d", _playerONE.score];
            _scoreLabel2.text = [NSString stringWithFormat:@"Score 2: \t %d", _playerTWO.score];
            _answerLabel.text = @"";
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated: YES completion: nil];
    }
    else{
        _answerLabel.text = @"";
    }
    
    
}








- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Player *player1 = [[Player alloc] init:3 andScore:0 andName:@"Player 1"];
    Player *player2 = [[Player alloc] init:3 andScore:0 andName:@"Player 2"];
    _playerONE = player1;
    _playerTWO = player2;
    _playerLabel.text = [_playerONE getQuestion];
    _turn = NO;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:10 animations:^{
        UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, _scoreLabel1.frame.size.height - 1.0f, _scoreLabel1.frame.size.width, 1)];
        bottomBorder.backgroundColor = [UIColor whiteColor];
        [_scoreLabel1 addSubview:bottomBorder];
        UIView *bottomBorder2 = [[UIView alloc] initWithFrame:CGRectMake(0, _scoreLabel2.frame.size.height - 1.0f, _scoreLabel2.frame.size.width, 1)];
        bottomBorder2.backgroundColor = [UIColor whiteColor];
        [_scoreLabel2 addSubview:bottomBorder2];
        
        
        
        
        
        
    }];
}







@end
