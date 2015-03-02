//
//  PhoneNumberFormatterTests.m
//  PhoneNumberFormatterTests
//
//  Created by Jeffrey Kereakoglow on 3/2/15.
//  Copyright (c) 2015 Alexis Digital. All rights reserved.
//

@import UIKit;
@import XCTest;
#import "ECPhoneNumberFormatter.h"

@interface PhoneNumberFormatterTests : XCTestCase

@property (nonatomic, readwrite) ECPhoneNumberFormatter *phoneNumberFormatter;

@end

@implementation PhoneNumberFormatterTests

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.phoneNumberFormatter = [ECPhoneNumberFormatter new];
}

- (void)tearDown {
    self.phoneNumberFormatter = nil;
    [super tearDown];
}

- (void)testThatAStringLackingDigitsIsNil {
    NSString *unformattedPhoneNumber = @"This (string) ought to be nil!";
    NSString *formattedPhoneNumber = [self.phoneNumberFormatter stringForObjectValue:unformattedPhoneNumber];
    XCTAssertNil(formattedPhoneNumber);
}

//@TODO: This test fails. Change code so it passes.
// I believe that strings which are not phone number should not be formatted.
- (void)testThatAnIncompletePhoneNumberIsNil {
    NSString *unformattedPhoneNumber = @"This (857-5) ought to be nil!";
    NSString *formattedPhoneNumber = [self.phoneNumberFormatter stringForObjectValue:unformattedPhoneNumber];
    XCTAssertNil(formattedPhoneNumber);
}

- (void)testThatAnUnformatted7DigitPhoneNumberIsProperlyFormatted {
    NSString *unformattedPhoneNumber = @"8675309";
    NSString *formattedPhoneNumber = [self.phoneNumberFormatter stringForObjectValue:unformattedPhoneNumber];
    XCTAssertEqualObjects(formattedPhoneNumber, @"867-5309");
}

- (void)testThatABadlyformatted7DigitPhoneNumberIsProperlyFormatted {
    NSString *unformattedPhoneNumber = @"(867)-5309)";
    NSString *formattedPhoneNumber = [self.phoneNumberFormatter stringForObjectValue:unformattedPhoneNumber];
    XCTAssertEqualObjects(formattedPhoneNumber, @"867-5309");
}

- (void)testThatAnUnformatted10DigitPhoneNumberIsProperlyFormatted {
    NSString *unformattedPhoneNumber = @"2348675309";
    NSString *formattedPhoneNumber = [self.phoneNumberFormatter stringForObjectValue:unformattedPhoneNumber];
    XCTAssertEqualObjects(formattedPhoneNumber, @"(234) 867-5309");
}
#pragma clang diagnostic pop
@end
