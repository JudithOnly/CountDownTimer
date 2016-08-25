//
//  ViewController.m
//  LearnCA
//
//  Created by Judith on 16/8/20.
//  Copyright © 2016年 Judith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    for (UIView *view in _digitViews)
    {
        UIImage *image = [UIImage imageNamed:@"11.jpg"];
        view.layer.contents = (__bridge id _Nullable)(image.CGImage);
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1);
    }
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
}


-(void)tick
{
    //convert time to hours, minutes and seconds
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:units fromDate:[NSDate date]];
    //set hours
    [self setDigit:components.hour / 10 forView:self.digitViews[0]];
    [self setDigit:components.hour % 10 forView:self.digitViews[1]];
    //set minutes
    [self setDigit:components.minute / 10 forView:self.digitViews[2]];
    [self setDigit:components.minute % 10 forView:self.digitViews[3]];
    //set seconds
    [self setDigit:components.second / 10 forView:self.digitViews[4]];
    [self setDigit:components.second % 10 forView:self.digitViews[5]];
}

-(void)setDigit:(float)digit forView:(UIView *)view
{
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0f);
}

@end
