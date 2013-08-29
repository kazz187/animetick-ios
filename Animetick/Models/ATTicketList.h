//
//  ATTicketList.h
//  Animetick
//
//  Created by yayugu on 2013/07/28.
//  Copyright (c) 2013年 Kazuki Akamine. All rights reserved.
//

#import "ATTicket.h"

@protocol ATTicketListDelegate

- (void)ticketListDidLoad;
- (void)ticketListMoreDidLoad;

@end

@interface ATTicketList : NSObject

@property (nonatomic) BOOL lastFlag;

- (id)initWithDelegate:(id<ATTicketListDelegate>)delegate;
- (ATTicket*)ticketAtIndex:(int)index;
- (int)count;
- (void)loadMore;
- (void)reload;

@end



