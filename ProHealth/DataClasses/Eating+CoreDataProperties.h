//
//  Eating+CoreDataProperties.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Eating.h"

NS_ASSUME_NONNULL_BEGIN

@interface Eating (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *calories;
@property (nullable, nonatomic, retain) NSDate *date;

@end

NS_ASSUME_NONNULL_END
