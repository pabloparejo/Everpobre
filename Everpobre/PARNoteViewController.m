//
//  PARNoteViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNoteViewController.h"

@interface PARNoteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PARNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Delete textView padding
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.textField.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.15].CGColor;
    self.textField.layer.borderWidth = .5f;
    self.textField.layer.cornerRadius = 5.0f;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.titleField.text = self.note.title;
    self.textField.text = self.note.text;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.note.title = self.titleField.text;
    self.note.text = self.textField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goBackFromPhoto:(UIStoryboardSegue *)segue{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
