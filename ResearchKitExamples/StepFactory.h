//
//  StepFactory.h
//  ResearchKitExamples
//
//  Created by Selim on 02.07.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ResearchKit.h>

@interface StepFactory : NSObject

+(ORKStep *)createInstructionStep;
+(ORKStep *)createQuestionStep;
+(ORKStep *)createFormStep;

@end
