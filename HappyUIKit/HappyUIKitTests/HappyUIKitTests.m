//
//  HappyUIKitTests.m
//  HappyUIKitTests
//
//  Created by Roman Dzieciol on 1/25/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UICollectionViewLayout()

- (CGRect)convertRect:(CGRect)rect toLayout:(UICollectionViewLayout *)layout;
- (UIEdgeInsets)_preferredLayoutMargins;

@end

@interface HappyUIKitTests : XCTestCase

@end

@implementation HappyUIKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    UICollectionViewLayout* layout = [[UICollectionViewLayout alloc] init];
    UIEdgeInsets insets = [layout _preferredLayoutMargins];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"");
}

@end
