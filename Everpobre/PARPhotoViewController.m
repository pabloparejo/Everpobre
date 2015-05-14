//
//  PARPhotoViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARPhotoViewController.h"

@interface PARPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation PARPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.note.photo != nil) {
        self.photoView.image = self.note.photo;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.allowsEditing = NO;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(UIStatusBarStyle) preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UIImagePickerControllerDelegate

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.photoView.image = image;
    self.note.photo = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)deleteImage:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        self.photoView.frame = CGRectMake(self.view.frame.size.width, self.view.frame.size.height, 0, 0);
        self.photoView.alpha = 0;
    } completion:^(BOOL finished) {
        self.photoView.image = [UIImage imageNamed:@"placeholder"];
        self.photoView.transform = CGAffineTransformIdentity;
        self.photoView.alpha = 1;
        [self.view layoutIfNeeded];
    }];
}

@end
