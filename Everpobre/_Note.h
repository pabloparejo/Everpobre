// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Note.h instead.

#import <CoreData/CoreData.h>

extern const struct NoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *title;
} NoteAttributes;

extern const struct NoteRelationships {
	__unsafe_unretained NSString *notebook;
} NoteRelationships;

@class Notebook;

@interface NoteID : NSManagedObjectID {}
@end

@interface _Note : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) NoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Notebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@end

@interface _Note (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (Notebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(Notebook*)value;

@end
