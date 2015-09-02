//
//  ViewController.m
//  ResearchKitExamples
//
//  Created by Selim on 02.07.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "ViewController.h"
#import <ResearchKit.h>
#import "StepFactory.h"
#import "DocumentFactory.h"
#import "ActiveTaskFactory.h"

@interface ViewController ()<ORKTaskViewControllerDelegate>

- (IBAction)createSurvey:(id)sender;
- (IBAction)createConsent:(id)sender;
- (IBAction)createActiveTask:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showTask:(ORKOrderedTask *)task
{
    // Create a task view controller using the task and set a delegate.
    ORKTaskViewController *taskViewController =
    [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];
    taskViewController.delegate = self;
    
    
    // Present the task view controller.
    [self presentViewController:taskViewController animated:YES completion:nil];
}


#pragma mark task view controller delegate
-(void)taskViewController:(ORKTaskViewController * __nonnull)taskViewController didFinishWithReason:(ORKTaskViewControllerFinishReason)reason error:(nullable NSError *)error
{
   // NSData *data = [NSKeyedArchiver archivedDataWithRootObject:taskViewController.result];
    NSLog(@"Task identifier %@",taskViewController.task.identifier);
    
    [taskViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark buttons

- (IBAction)createSurvey:(id)sender
{
    // creating an instruction step
    
    ORKStep *instructionStep = [StepFactory createInstructionStep];
    
    
    ORKStep *questionStep = [StepFactory createQuestionStep];
    
    ORKStep *formStep    = [StepFactory createFormStep];
    
    
    ORKOrderedTask *task =
    [[ORKOrderedTask alloc] initWithIdentifier:@"surveyTask"
                                         steps:@[instructionStep,questionStep,formStep]];
    
    
    [self showTask:task];
}

- (IBAction)createConsent:(id)sender
{
    ORKStep *visualConsentStep = [DocumentFactory createVisualConsentStep];
    ORKStep *reviewConsentStep = [DocumentFactory createReviewConsentStep];
    
    ORKOrderedTask *task =
    [[ORKOrderedTask alloc] initWithIdentifier:@"consentTask"
                                         steps:@[visualConsentStep,reviewConsentStep]];
    
    
    [self showTask:task];
}

- (IBAction)createActiveTask:(id)sender
{
    ORKOrderedTask *task = [ActiveTaskFactory createTappingTask];
    [self showTask:task];
}
@end
