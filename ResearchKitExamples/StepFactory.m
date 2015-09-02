//
//  StepFactory.m
//  ResearchKitExamples
//
//  Created by Selim on 02.07.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "StepFactory.h"


@implementation StepFactory

+(ORKStep *)createInstructionStep
{
    ORKInstructionStep *instructionStep =
    [[ORKInstructionStep alloc] initWithIdentifier:@"identifier"];
    instructionStep.title = @"Selection Survey";
    instructionStep.text = @"This survey can help us understand your eligibility for the fitness study";
    instructionStep.image = [UIImage imageNamed:@"research_image"];
    
    return instructionStep;
}

+(ORKStep *)createQuestionStep
{
    ORKNumericAnswerFormat *format =
    [ORKNumericAnswerFormat integerAnswerFormatWithUnit:@"years"];
    format.minimum = @(18);
    format.maximum = @(90);
    ORKQuestionStep *ageStep =
    [ORKQuestionStep questionStepWithIdentifier:@"question_age"
                                          title:@"How old are you?"
                                         answer:format];
    
    return ageStep;
}

+(ORKStep *)createFormStep
{
    ORKFormStep *step =
    [[ORKFormStep alloc] initWithIdentifier:@"form"
                                      title:@"Form"
                                       text:@"Form groups multi-entry in one page"];
    NSMutableArray *items = [NSMutableArray new];
    ORKAnswerFormat *genderFormat =
    [ORKHealthKitCharacteristicTypeAnswerFormat
     answerFormatWithCharacteristicType:
     [HKCharacteristicType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex]];
    [items addObject:
     [[ORKFormItem alloc] initWithIdentifier:@"gender"
                                        text:@"Gender"
                                answerFormat:genderFormat]];
     
     // Include a section separator
     [items addObject:
      [[ORKFormItem alloc] initWithSectionTitle:@"Basic Information"]];
     
     ORKAnswerFormat *bloodTypeFormat =
     [ORKHealthKitCharacteristicTypeAnswerFormat
      answerFormatWithCharacteristicType:
      [HKCharacteristicType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBloodType]];
     [items addObject:
      [[ORKFormItem alloc] initWithIdentifier:@"bloodType"
                                         text:@"Blood Type"
                                 answerFormat:bloodTypeFormat]];
    
    
    ORKAnswerFormat *scaleAnswerFormat =
    [[ORKScaleAnswerFormat alloc] initWithMaximumValue:10
                                          minimumValue:0
                                          defaultValue:5
                                                  step:1];
    [items addObject:
     [[ORKFormItem alloc] initWithIdentifier:@"pain"
                                        text:@"On a scale of 0 to 10, how much pain do you feel ?"
                                answerFormat:scaleAnswerFormat]];
    
      ORKAnswerFormat *dateOfBirthFormat =
      [ORKHealthKitCharacteristicTypeAnswerFormat
       answerFormatWithCharacteristicType:
       [HKCharacteristicType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth]];
      ORKFormItem *dateOfBirthItem =
      [[ORKFormItem alloc] initWithIdentifier:@"dob"
                                         text:@"DOB"
                                 answerFormat:dateOfBirthFormat];
      dateOfBirthItem.placeholder = @"DOB";
      [items addObject:dateOfBirthItem];
      
      // ... And so on, adding additional items
      step.formItems = items;
    
      return step;
}

@end
