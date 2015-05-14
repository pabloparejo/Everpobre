//
//  Note.h
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//


#import "_Note.h"
@import Foundation;
@import CoreData;


@interface Note : _Note

+ (instancetype) noteWithContext:(NSManagedObjectContext *)context title:(NSString *)title text:(NSString *)text;

@end
