//
//  DocumentFactory.m
//  ResearchKitExamples
//
//  Created by Selim on 02.07.15.
//  Copyright (c) 2015 Selim Bakdemir. All rights reserved.
//

#import "DocumentFactory.h"

@implementation DocumentFactory

+(ORKStep *)createVisualConsentStep
{
    ORKConsentSection *section1 =
    [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeDataGathering];
    section1.title = @"The title of the section goes here ...";
    section1.summary = @"The summary about the section goes here ...";
    section1.content = @"The content to show in learn more ...";
    
    
    ORKConsentSection *section2 =
    [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypePrivacy];
    section2.title = @"The title of the section goes here ...";
    section2.summary = @"The summary about the section goes here ...";
    section2.content = @"The content to show in learn more ...";
    
    // Create additional section objects for later sections
    ORKConsentDocument *document = [ORKConsentDocument new];
    document.sections = @[section1,section2];
    
    ORKVisualConsentStep *step =
    [[ORKVisualConsentStep alloc] initWithIdentifier:@"visualconsent" document:document];
    
    return step;
}

+(ORKStep *)createReviewConsentStep
{
    ORKConsentDocument *consent = [[ORKConsentDocument alloc] init];
    consent.title = @"Demo Consent";
    consent.signaturePageTitle = @"Consent";
    
    ORKConsentSignature *signature = [ORKConsentSignature signatureForPersonWithTitle:@"Signature Title"
                                                                     dateFormatString:@"d.m.Y"
                                                                           identifier:@"signature"];
    signature.requiresName = YES;
    signature.requiresSignatureImage = YES;
    
    consent.signatures  = @[signature];
    
    ORKConsentReviewStep *reviewStep =
    [[ORKConsentReviewStep alloc] initWithIdentifier:@"reviewconsent"
                                           signature:consent.signatures[0]
                                          inDocument:consent];
    
    reviewStep.text = @"Lorem ipsum ..";
    reviewStep.reasonForConsent = @"Lorem ipsum ...";
    
    return reviewStep;
}

@end
