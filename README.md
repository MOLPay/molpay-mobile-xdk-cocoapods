<!--
 # license: Copyright © 2011-2016 MOLPay Sdn Bhd. All Rights Reserved. 
 -->

# molpay-mobile-xdk-cocoapods

This is the complete and functional MOLPay iOS payment module that is ready to be implemented into Xcode application project through Cocoapods framework. An example Cocoapods application project (Example) is provided for MOLPayXDK framework integration reference.

这是完整的功能性MOLPay iOS支付模块，可以通过Cocoapods框架实现到Xcode应用程序项目中。为MOLPayXDK框架集成参考提供了一个示例Cocoapods应用程序项目（示例）。

## Recommended configurations

    - Xcode version: 8 ++

    - Minimum target version: iOS 8

## Installation

### For Objective-C

    Step 1 - Add pod 'MOLPayXDK', '~> <put latest release version here>' to the Podfile, then Pod install.

    Step 2 - Add #import <MOLPayXDK/MOLPayLib.h>

    Step 3 - Add <MOLPayLibDelegate> to @interface

    Step 4 - Add -(void)transactionResult:(NSDictionary *)result for all delegate callbacks

    Step 5 - Add 'App Transport Security Settings > Allow Arbitrary Loads > YES' to the application project info.plist

    Step 6 - Add 'NSPhotoLibraryUsageDescription' > 'Payment images' to the application project info.plist

    Step 7 - Add 'NSPhotoLibraryAddUsageDescription' > 'Payment images' to the application project info.plist

### For Swift
    
    Step 1 - Add pod 'MOLPayXDK', '~> <put latest release version here>' to the Podfile, then Pod install.
    
    Step 2 - Create a bridging header file for MOLPay XDK Obj-c framework.
    Then add the bridging header file to the Swift Compiler under Objective-C Bridging Header. (Refer https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html)
    
    Step 3 - Add #import <MOLPayXDK/MOLPayLib.h> to the last line of the bridging header file.
    
    Step 4 - Add MOLPayLibDelegate to the view controller class declaration
    
    Step 5 - Add func transactionResult(_ result: [AnyHashable: Any]!) for all delegate callbacks
    
    Step 6 - Add 'App Transport Security Settings > Allow Arbitrary Loads > YES' to the application project info.plist
    
    Step 7 - Add 'NSPhotoLibraryUsageDescription' > 'Payment images' to the application project info.plist

    Step 8 - Add 'NSPhotoLibraryAddUsageDescription' > 'Payment images' to the application project info.plist

## Prepare the Payment detail object

### For Objective-C

    NSDictionary * paymentRequestDict = @{
        // Mandatory String. A value more than '1.00'
        @"mp_amount": @"1.10",
    
        // Mandatory String. Values obtained from MOLPay
        @"mp_username": @"username",
        @"mp_password": @"password",
        @"mp_merchant_ID": @"merchantid",
        @"mp_app_name": @"appname",
        @"mp_verification_key": @"vkey123",
    
        // Mandatory String. Payment values
        @"mp_order_ID": @"orderid123",
        @"mp_currency": @"MYR",
        @"mp_country": @"MY",
        
        // Optional String.
        @"mp_channel": @"multi", // Use 'multi' for all available channels option. For individual channel seletion, please refer to https://github.com/MOLPay/molpay-mobile-xdk-examples/blob/master/channel_list.tsv.
        @"mp_bill_description": @"billdesc",
        @"mp_bill_name": @"billname",
        @"mp_bill_email": @"email@domain.com",
        @"mp_bill_mobile": @"+1234567",
        @"mp_channel_editing": [NSNumber numberWithBool:NO], // Option to allow channel selection.
        @"mp_editing_enabled": [NSNumber numberWithBool:NO], // Option to allow billing information editing.
    
        // Optional for Escrow
        @"mp_is_escrow": @"0", // Put "1" to enable escrow
    
        // Optional for credit card BIN restrictions
        @"mp_bin_lock": [NSArray arrayWithObjects:@"414170", @"414171", nil], 
        @"mp_bin_lock_err_msg": @"Only UOB allowed",
        
        // For transaction request use only, do not use this on payment process
        @"mp_transaction_id": @"", // Optional, provide a valid cash channel transaction id here will display a payment instruction screen.
        @"mp_request_type": @"",
    
        // Optional, use this to customize the UI theme for the payment info screen, the original XDK custom.css file is provided at Example project source for reference and implementation.
        @"mp_custom_css_url": [[NSBundle mainBundle] pathForResource:@"custom.css" ofType:nil],
    
        // Optional, set the token id to nominate a preferred token as the default selection, set "new" to allow new card only
        @"mp_preferred_token": @"",
    
        // Optional, credit card transaction type, set "AUTH" to authorize the transaction
        @"mp_tcctype": @"",
    
        // Optional, set true to process this transaction through the recurring api, please refer the MOLPay Recurring API pdf  
        @"mp_is_recurring": [NSNumber numberWithBool:NO],
    
        // Optional for channels restriction 
        @"mp_allowed_channels": [NSArray arrayWithObjects:@"credit", @"credit3", nil],
    
        // Optional for sandboxed development environment, set boolean value to enable. 
        @"mp_sandbox_mode": [NSNumber numberWithBool:YES],
    
        // Optional, required a valid mp_channel value, this will skip the payment info page and go direct to the payment screen.
        @"mp_express_mode": [NSNumber numberWithBool:YES],
    
        // Optional, enable this for extended email format validation based on W3C standards.
        @"mp_advanced_email_validation_enabled": [NSNumber numberWithBool:YES],
    
        // Optional, enable this for extended phone format validation based on Google i18n standards.
        @"mp_advanced_phone_validation_enabled": [NSNumber numberWithBool:YES],
    
        // Optional, explicitly force disable billing name edit.
        @"mp_bill_name_edit_disabled": [NSNumber numberWithBool:YES],
    
        // Optional, explicitly force disable billing email edit.
        @"mp_bill_email_edit_disabled": [NSNumber numberWithBool:YES],
    
        // Optional, explicitly force disable billing mobile edit.
        @"mp_bill_mobile_edit_disabled": [NSNumber numberWithBool:YES],
    
        // Optional, explicitly force disable billing description edit.
        @"mp_bill_description_edit_disabled": [NSNumber numberWithBool:YES],
    
        // Optional, EN, MS, VI, TH, FIL, MY, KM, ID, ZH.
        @"mp_language": @"EN",
    
        // Optional, enable for online sandbox testing.
        @"mp_dev_mode": [NSNumber numberWithBool:NO]
    };

### For Swift

    let paymentRequestDict: [String:Any] = [
        // Mandatory String. A value more than '1.00'
        "mp_amount": "1.10",
    
        // Mandatory String. Values obtained from MOLPay
        "mp_username": "username",
        "mp_password": "password",
        "mp_merchant_ID": "merchantid",
        "mp_app_name": "appname",
        "mp_verification_key": "vkey123",
    
        // Mandatory String. Payment values
        "mp_order_ID": "orderid123",
        "mp_currency": "MYR",
        "mp_country": "MY",
        
        // Optional String.
        "mp_channel": "multi", // Use 'multi' for all available channels option. For individual channel seletion, please refer to "Channel Parameter" in "Channel Lists" in the MOLPay API Spec for Merchant pdf. 
        "mp_bill_description": "billdesc",
        "mp_bill_name": "billname",
        "mp_bill_email": "email@domain.com",
        "mp_bill_mobile": "+1234567"
        //"mp_channel_editing": NSNumber.init(booleanLiteral:false), // Option to allow channel selection.
        //"mp_editing_enabled": NSNumber.init(booleanLiteral:false), // Option to allow billing information editing.
    
        // Optional for Escrow
        //"mp_is_escrow": "0", // Put "1" to enable escrow
    
        // Optional for credit card BIN restrictions
        //"mp_bin_lock": ["414170", "414171"], 
        //"mp_bin_lock_err_msg": "Only UOB allowed",
        
        // For transaction request use only, do not use this on payment process
        //"mp_transaction_id": "", // Optional, provide a valid cash channel transaction id here will display a payment instruction screen.
        //"mp_request_type": "",
    
        // Optional, use this to customize the UI theme for the payment info screen, the original XDK custom.css file is provided at Example project source for reference and implementation.
        //"mp_custom_css_url": Bundle.main.path(forResource: "custom.css", ofType: nil)!,
    
        // Optional, set the token id to nominate a preferred token as the default selection, set "new" to allow new card only
        //"mp_preferred_token": "",
    
        // Optional, credit card transaction type, set "AUTH" to authorize the transaction
        //"mp_tcctype": "",
    
        // Optional, set true to process this transaction through the recurring api, please refer the MOLPay Recurring API pdf  
        //"mp_is_recurring": NSNumber.init(booleanLiteral:false),
    
        // Optional for channels restriction 
        //"mp_allowed_channels": ["credit", "credit3"],
    
        // Optional for sandboxed development environment, set boolean value to enable. 
        //"mp_sandbox_mode": NSNumber.init(booleanLiteral:true),
    
        // Optional, required a valid mp_channel value, this will skip the payment info page and go direct to the payment screen.
        //"mp_express_mode": NSNumber.init(booleanLiteral:true),
    
        // Optional, enable this for extended email format validation based on W3C standards.
        //"mp_advanced_email_validation_enabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, enable this for extended phone format validation based on Google i18n standards.
        //"mp_advanced_phone_validation_enabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, explicitly force disable billing name edit.
        //"mp_bill_name_edit_disabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, explicitly force disable billing email edit.
        //"mp_bill_email_edit_disabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, explicitly force disable billing mobile edit.
        //"mp_bill_mobile_edit_disabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, explicitly force disable billing description edit.
        //"mp_bill_description_edit_disabled": NSNumber.init(booleanLiteral:true),
    
        // Optional, EN, MS, VI, TH, FIL, MY, KM, ID, ZH.
        //"mp_language": "EN",
    
        // Optional, enable for online sandbox testing.
        //"mp_dev_mode": NSNumber.init(booleanLiteral:false)
    ]

## Start the payment module

### For Objective-C
    MOLPayLib mp = [[MOLPayLib alloc] initWithDelegate:self andPaymentDetails:paymentRequestDict];

### For Swift
    let mp = MOLPayLib(delegate:self, andPaymentDetails: paymentRequestDict)

## Show the payment UI

### For Objective-C
    [self presentViewController:mp animated:NO completion:nil];

### For Swift
    self.present(nc, animated: false) {}

## Close the payment module

### For Objective-C
    [mp closemolpay];

### For Swift
    mp.closemolpay()
    
    * Note: The host application needs to implement the MOLPay payment module manually upon getting a final callback from the close event.

## Payment module callback

### For Objective-C
    - (void)transactionResult: (NSDictionary *)result

### For Swift
    func transactionResult(_ result: [AnyHashable: Any]!) {}
    
    =========================================
    Sample transaction result in JSON string:
    =========================================
    
    {"status_code":"11","amount":"1.01","chksum":"34a9ec11a5b79f31a15176ffbcac76cd","pInstruction":0,"msgType":"C6","paydate":1459240430,"order_id":"3q3rux7dj","err_desc":"","channel":"Credit","app_code":"439187","txn_ID":"6936766"}
    
    Parameter and meaning:
    
    "status_code" - "00" for Success, "11" for Failed, "22" for *Pending. 
    (*Pending status only applicable to cash channels only)
    "amount" - The transaction amount
    "paydate" - The transaction date
    "order_id" - The transaction order id
    "channel" - The transaction channel description
    "txn_ID" - The transaction id generated by MOLPay
    
    * Notes: You may ignore other parameters and values not stated above
    
    =====================================
    * Sample error result in JSON string:
    =====================================
    
    {"Error":"Communication Error"}
    
    Parameter and meaning:
    
    "Communication Error" - Error starting a payment process due to several possible reasons, please contact MOLPay support should the error persists.
    1) Internet not available
    2) API credentials (username, password, merchant id, verify key)
    3) MOLPay server offline.

## Cash channel payment process (How does it work?)

    This is how the cash channels work on XDK:
    
    1) The user initiate a cash payment, upon completed, the XDK will pause at the “Payment instruction” screen, the results would return a pending status.
    
    2) The user can then click on “Close” to exit the MOLPay XDK aka the payment screen.
    
    3) When later in time, the user would arrive at say 7-Eleven to make the payment, the host app then can call the XDK again to display the “Payment Instruction” again, then it has to pass in all the payment details like it will for the standard payment process, only this time, the host app will have to also pass in an extra value in the payment details, it’s the “mp_transaction_id”, the value has to be the same transaction returned in the results from the XDK earlier during the completion of the transaction. If the transaction id provided is accurate, the XDK will instead show the “Payment Instruction" in place of the standard payment screen.
    
    4) After the user done the paying at the 7-Eleven counter, they can close and exit MOLPay XDK by clicking the “Close” button again.

## XDK built-in checksum validator caveats 

    All XDK come with a built-in checksum validator to validate all incoming checksums and return the validation result through the "mp_secured_verified" parameter. However, this mechanism will fail and always return false if merchants are implementing the private secret key (which the latter is highly recommended and prefereable.) If you would choose to implement the private secret key, you may ignore the "mp_secured_verified" and send the checksum back to your server for validation. 

## Private Secret Key checksum validation formula

    chksum = MD5(mp_merchant_ID + results.msgType + results.txn_ID + results.amount + results.status_code + merchant_private_secret_key)

## Support

Submit issue to this repository or email to our support@molpay.com

Merchant Technical Support / Customer Care : support@molpay.com<br>
Sales/Reseller Enquiry : sales@molpay.com<br>
Marketing Campaign : marketing@molpay.com<br>
Channel/Partner Enquiry : channel@molpay.com<br>
Media Contact : media@molpay.com<br>
R&D and Tech-related Suggestion : technical@molpay.com<br>
Abuse Reporting : abuse@molpay.com
