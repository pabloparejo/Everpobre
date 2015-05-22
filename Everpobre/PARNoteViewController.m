//
//  PARNoteViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNoteViewController.h"
#import "PARPhotoViewController.h"

#define VIEW_PHOTO_SEGUE @"VIEW_PHOTO"

@interface PARNoteViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation PARNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Delete textView padding
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.textField.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.15].CGColor;
    self.textField.layer.borderWidth = .5f;
    self.textField.layer.cornerRadius = 5.0f;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    self.titleField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleField.text = self.note.title;
    self.textField.text = self.note.text;
    if (self.note.photo != nil) {
        self.imageView.image = [UIImage imageWithData:self.note.photo];
    }
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.note.title = self.titleField.text;
    self.note.text = self.textField.text;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(IBAction)goBackFromPhoto:(UIStoryboardSegue *)segue{
    [segue.sourceViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:VIEW_PHOTO_SEGUE]) {
        PARPhotoViewController *photoVC = (PARPhotoViewController *) segue.destinationViewController;
        photoVC.note = self.note;
    }
}


#pragma mark - Keyboard methods
- (void) keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardSize = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    [UIView animateWithDuration:[[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] floatValue] animations:^{
        self.bottomConstraint.constant = keyboardSize.size.height + 8;
        [self.view layoutIfNeeded];
    }];
}

- (void) keyboardWillHide:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{
        self.bottomConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (void) hideKeyboard{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    self.note.title = textField.text;
    // here we get the text without last typped char.
    return YES;
}

@end
