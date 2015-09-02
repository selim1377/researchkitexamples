//
//  ActiveTaskFactory.m
//  ResearchKitExamples
//
//  Created by Selim on 02.07.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "ActiveTaskFactory.h"

@implementation ActiveTaskFactory

+(ORKOrderedTask *)createFitnessTask
{
    ORKOrderedTask *task =
    [ORKOrderedTask fitnessCheckTaskWithIdentifier:@"fitnessCheck"
                            intendedUseDescription:@"Intended Use descriptio "
                                      walkDuration:20
                                      restDuration:5
                                           options:ORKPredefinedTaskOptionExcludeDeviceMotion];
    
    return task;
}

+(ORKOrderedTask *)createTappingTask
{
    ORKOrderedTask *task =
    [ORKOrderedTask twoFingerTappingIntervalTaskWithIdentifier:@"tapping"
                                        intendedUseDescription:@"Intended Use Desctiprion tapping"
                                                      duration:10
                                                       options:ORKPredefinedTaskOptionExcludeAudio];
    return task;
}


@end
