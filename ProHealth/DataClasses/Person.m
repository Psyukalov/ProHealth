//
//  Person.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "Person.h"


@interface Person ()

@property (strong, nonatomic) NSUserDefaults *userDefaults;

@end


@implementation Person

@synthesize avatar = _avatar;
@synthesize name = _name;
@synthesize birthday = _birthday;
@synthesize startDate = _startDate;
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize growth = _growth;

#pragma mark - Lifecycle

- (instancetype)initOnce {
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

#pragma mark - Custom accessors

- (NSData *)avatar {
    if (!_avatar) {
        _avatar = [self.userDefaults objectForKey:@"avatar"];
    }
    return _avatar;
}

-(void)setAvatar:(NSData *)avatar {
    [self.userDefaults setObject:avatar forKey:@"avatar"];
    if ([self.userDefaults synchronize]) {
        _avatar = avatar;
    }
}

- (NSString *)name {
    if (!_name) {
        _name = [self.userDefaults objectForKey:@"name"];
    }
    return _name;
}

- (void)setName:(NSString *)name {
    [self.userDefaults setObject:name forKey:@"name"];
    if ([self.userDefaults synchronize]) {
        _name = name;
    }
}

- (NSDate *)startDate {
    if (!_startDate) {
        _startDate = [self.userDefaults objectForKey:@"startDate"];
    }
    return _startDate;
}

- (void)setStartDate:(NSDate *)startDate {
    [self.userDefaults setObject:startDate forKey:@"startDate"];
    if ([self.userDefaults synchronize]) {
        _startDate = startDate;
    }
}

- (double)weight {
    if (!_weight) {
        _weight = [self.userDefaults doubleForKey:@"weight"];
    }
    return _weight;
}

- (void)setWeight:(double)weight {
    [self.userDefaults setDouble:weight forKey:@"weight"];
    if ([self.userDefaults synchronize]) {
        _weight = weight;
    }
}

- (double)growth {
    if (!_growth) {
        _growth = [self.userDefaults doubleForKey:@"growth"];
    }
    return _growth;
}

- (void)setGrowth:(double)growth {
    [self.userDefaults setDouble:growth forKey:@"growth"];
    if ([self.userDefaults synchronize]) {
        _growth = growth;
    }
}

- (NSDate *)birthday {
    if (!_birthday) {
        _birthday = [self.userDefaults objectForKey:@"birthday"];
    }
    return _birthday;
}

- (void)setBirthday:(NSDate *)birthday {
    [self.userDefaults setObject:birthday forKey:@"birthday"];
    if ([self.userDefaults synchronize]) {
        _birthday = birthday;
    }
}

- (NSString *)gender {
    if (!_gender) {
        _gender = [self.userDefaults objectForKey:@"gender"];
    }
    return _gender;
}

- (void)setGender:(NSString *)gender {
    [self.userDefaults setObject:gender forKey:@"gender"];
    if ([self.userDefaults synchronize]) {
        _gender = gender;
    }
}

#pragma mark - Static methods

+ (id)sharedPerson {
    static Person *sharedNewPerson = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNewPerson = [[self alloc] initOnce];
    });
    return sharedNewPerson;
}

@end