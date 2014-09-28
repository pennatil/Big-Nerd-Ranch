//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Lucas Pennati on 08.09.14.
//  Copyright (c) 2014 Lucas Pennati. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;


@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@end

@implementation BNRQuizViewController

- (IBAction)showQuestion:(id)sender
{
    //Step to the next quesiton
    self.currentQuestionIndex++;
    
    //Past the last question?
    if (self.currentQuestionIndex == [self.questions count]){
        //Start from the top
        self.currentQuestionIndex = 0;
    }
    
    //Get the string at that index
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //Display the info
    self.questionLabel.text = question;
    
    //Reset the answer label
    self.answerLabel.text = @"???";

}

- (IBAction)showAnswer:(id)sender
{
    //Get the answer
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Display it
    self.answerLabel.text = answer;
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the method created by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        //Create two arrays: One for the questions and one for the answers
        
        self.questions = @[@"From what is cognac made", @"What is 7+7", @"What is the capital of Vermont"];
        
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
        
        
    }
    return self;
}


@end
