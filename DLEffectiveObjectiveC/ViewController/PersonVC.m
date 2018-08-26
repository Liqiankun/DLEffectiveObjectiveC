//
//  PersonVC.m
//  DLEffectiveObjectiveC
//
//  Created by David on 2018/8/25.
//  Copyright © 2018年 David. All rights reserved.
//

#import "PersonVC.h"
#import "Person.h"
#import "Person+Work.h"
#import "Person+Play.h"
#import "Person+Friendship.h"

@interface PersonVC ()

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    Person *person = [[Person alloc] initWithFirstName:@"David" andLastName:@"Lee"];
    [person addFriend:person];
    [person goToSportsGame];
    [person doDaysWork];
    
}

@end
