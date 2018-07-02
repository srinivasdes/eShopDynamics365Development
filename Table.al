tableextension 70009725 eShopShipmentMethodExtn extends "Shipment Method"
{
    fields
    {
        field(70009700; "eShop Shipping Method"; code[50])
        {
            Caption = 'eShop Shipping Method';

        }
    }
}
tableextension 70009726 eSHopCustomerTabExtn extends Customer
{
    fields
    {
        field(70009700; "eShop B2C Customer"; Boolean)
        {
            Caption = 'eShop B2C Customer';
        }
    }
}

tableextension 70009727 eSHopItemTabExtn extends Item
{
    fields
    {
        field(70009700; "eShop Enabled"; Boolean)
        {
            Caption = 'eShop Enabled';
        }
        field(70009701; "eShop Category ID"; Code[25])
        {
            Caption = 'eShop Category ID';
            TableRelation = "eShop Categories";
            ValidateTableRelation = false;

        }
        field(70009702; "eShop Featured Item"; Boolean)
        {
            Caption = 'eShop Featured Item';
        }
        field(70009703; "eShop Shipping Allowed"; Boolean)
        {
            Caption = 'eShop Shipping Allowed';
        }
        field(70009704; "eShop Free Shipping"; Boolean)
        {
            Caption = 'eShop Free Shipping';
        }
        field(70009705; "eShop Additional Shipping Charge"; Decimal)
        {
            Caption = 'eShop Additional Shipping Charge';
        }
        field(70009706; "eShop Tax Exempt"; Boolean)
        {
            Caption = 'eShop Tax Exempt';
        }
        field(70009707; "eShop ID"; Integer)
        {
            Caption = 'eShop ID';
        }
        field(70009708; "eShop Picture Name 1"; Text[250])
        {
            Caption = 'eShop Picture Name 1';
        }
        field(70009709; "eShop Picture Name 2"; Text[250])
        {
            Caption = 'eShop Picture Name 2';
        }
        field(70009710; "eShop Picture Name 3"; Text[250])
        {
            Caption = 'eShop Picture Name 3';
        }
    }
}

tableextension 70009728 eSHopSalesHeaderExtn extends "Sales Header"
{
    fields
    {
        field(70009700; "eShop Web Order"; Boolean)
        {
            Caption = 'Web Order';
        }
        field(70009701; "eShop Login Email"; Text[75])
        {
            Caption = 'eShop Login Email';
        }
        field(70009702; "eShop Shopping Cart No."; code[20])
        {
            Caption = 'eShop Shopping Cart No.';
        }
        field(70009703; "eShop Web Order No."; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
        field(70009704; "eShop NAV Shipping Amount"; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
        field(70009705; "eShop NAV Tax Amount"; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
        field(70009706; "eShop Discount Amount"; Decimal)
        {
            Caption = 'eShop Discount Amount';
        }
        field(70009707; "eShop Shipping Amount"; Decimal)
        {
            Caption = 'eShop Shipping Amount';
        }
        field(70009708; "eShop Tax Amount"; Decimal)
        {
            Caption = 'eShop Tax Amount';
        }
        field(70009709; "eShop Paid With"; code[30])
        {
            Caption = 'eShop Paid With';
        }
        field(70009710; "eShop Transaction Reference"; code[40])
        {
            Caption = 'eShop Transaction Reference';
        }
        field(70009711; "eShop Shipped Via"; code[30])
        {
            Caption = 'eShop Shipped Via';
        }
        field(70009712; "eShop Coupon Code 1"; code[20])
        {
            Caption = 'eShop Coupon Code 1';
        }
        field(70009713; "eShop Coupon Code 1 Amount"; Decimal)
        {
            Caption = 'eShop Coupon Code 1 Amount';
        }
        field(70009714; "eShop Coupon Code 2"; Code[20])
        {
            Caption = 'eShop Coupon Code 2';
        }
        field(70009715; "eShop Coupon Code 2 Amount"; Decimal)
        {
            Caption = 'eShop Coupon Code 2 Amount';
        }
        field(70009716; "eShop Gift Card 1 No."; Code[20])
        {
            Caption = 'eShop Gift Card 1 No.';
        }
        field(70009717; "eShop Gift Card 1 Amount"; Decimal)
        {
            Caption = 'eShop Gift Card 1 Amount';
        }
        field(70009718; "eShop Gift Card 2 No."; Code[20])
        {
            Caption = 'eShop Gift Card 2 No.';
        }
        field(70009719; "eShop Gift Card 2 Amount"; Decimal)
        {
            Caption = 'eShop Gift Card 2 Amount';
        }
        field(70009720; "eShop Web CC"; Code[20])
        {
            Caption = 'eShop Web CC';
        }
        field(70009721; "eShop CC Expiration Month"; Code[2])
        {
            Caption = 'eShop CC Expiration Month';
        }
        field(70009722; "eShop CC Expiration Year"; Code[2])
        {
            Caption = 'eShop CC Expiration Year';
        }
        field(70009723; "eShop CC Card Type"; Option)
        {
            Caption = 'eShop CC Card Type';
            OptionCaption = 'Visa,MasterCard,Amex,Discover';
            OptionMembers = Visa,MasterCard,Amex,Discover;
        }
        field(70009724; "eShop CC Cvv2"; Code[4])
        {
            Caption = 'eShop CC Cvv2';
        }
        field(70009725; "eShop Web CC Name"; Text[30])
        {
            Caption = 'eShop Web CC Name';
        }
        field(70009726; "eShop Web CC Encrypted"; Blob)
        {
            Caption = 'eShop Web CC Encrypted';
        }
        field(70009727; "eShop Coupon Code"; Code[20])
        {
            Caption = 'eShop Coupon Code';
        }
        field(70009728; "eShop Shipping Line No"; Integer)
        {
        }
    }



}

tableextension 70009729 eSHopSalesLineTabExtn extends "Sales Line"
{
    fields
    {
        field(70009700; "eShop Tax Amount"; Decimal)
        {
            Caption = 'eShop Tax Amount';
        }
        field(70009701; "eShop Item Disc. Group"; Code[10])
        {
            Caption = 'eShop Item Disc. Group';
        }
        field(70009702; "eShop Category ID"; Code[60])
        {
            Caption = 'eShop Category ID';
        }
        field(70009703; "eShop AttributeDescription"; Blob)
        {
            Caption = 'eShop AttributeDescription';
        }
        field(70009704; "eShop AttributeXML"; Blob)
        {
            Caption = 'eShop AttributeXML';
        }
        field(70009705; "eShop Kit Option Group"; Code[10])
        {
            Caption = 'eShop Kit Option Group';
        }
    }
}

tableextension 70009730 eSHopSalesCommentLineTabExtn extends "Sales Comment Line"
{
    fields
    {
        field(70009700; "eShop IsCartDescription"; Boolean)
        {
            Caption = 'IsCartDescription';
        }
    }
}

tableextension 70009731 eSHopBomComponentTabExtn extends "BOM Component"
{
    fields
    {
        field(70009700; "eShop Option Group"; Code[10])
        {
            Caption = 'Option Group';
        }
    }
}

tableextension 70009732 eSHopSalesInvoiceHeaderTabExtn extends "Sales Invoice Header"
{
    fields
    {
        field(70009700; "eShop Web Order"; Boolean)
        {
            Caption = 'eShop Web Order';
        }
        field(70009701; "eShop Login Email"; Text[75])
        {
            Caption = 'eShop Login Email';
        }
        field(70009702; "eShop Shopping Cart No."; code[20])
        {
            Caption = 'eShop Shopping Cart No.';
        }
        field(70009703; "eShop Web Order No."; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
        field(70009704; "eShop NAV Shipping Amount"; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
        field(70009705; "eShop NAV Tax Amount"; code[20])
        {
            Caption = 'eShop Web Order No.';
        }
       
        field(70009706; "eShop Discount Amount"; Decimal)
        {
            Caption = 'eShop Discount Amount';
        }
        field(70009707; "eShop Shipping Amount"; Decimal)
        {
            Caption = 'eShop Shipping Amount';
        }
        field(70009708; "eShop Tax Amount"; Decimal)
        {
            Caption = 'eShop Tax Amount';
        }
        field(70009709; "eShop Paid With"; code[30])
        {
            Caption = 'eShop Paid With';
        }
        field(70009710; "eShop Transaction Reference"; code[40])
        {
            Caption = 'eShop Transaction Reference';
        }
        field(70009711; "eShop Shipped Via"; code[30])
        {
            Caption = 'eShop Shipped Via';
        }
        field(70009712; "eShop Coupon Code 1"; code[20])
        {
            Caption = 'eShop Coupon Code 1';
        }
        field(70009713; "eShop Coupon Code 1 Amount"; Decimal)
        {
            Caption = 'eShop Coupon Code 1 Amount';
        }
        field(70009714; "eShop Coupon Code 2"; Code[20])
        {
            Caption = 'eShop Coupon Code 2';
        }
        field(70009715; "eShop Coupon Code 2 Amount"; Decimal)
        {
            Caption = 'eShop Coupon Code 2 Amount';
        }
        field(70009716; "eShop Gift Card 1 No."; Code[20])
        {
            Caption = 'eShop Gift Card 1 No.';
        }
        field(70009717; "eShop Gift Card 1 Amount"; Decimal)
        {
            Caption = 'eShop Gift Card 1 Amount';
        }
        field(70009718; "eShop Gift Card 2 No."; Code[20])
        {
            Caption = 'eShop Gift Card 2 No.';
        }
        field(70009719; "eShop Gift Card 2 Amount"; Decimal)
        {
            Caption = 'eShop Gift Card 2 Amount';
        }
        field(70009720; "eShop Web CC"; Code[20])
        {
            Caption = 'eShop Web CC';
        }
        field(70009721; "eShop CC Expiration Month"; Code[2])
        {
            Caption = 'eShop CC Expiration Month';
        }
        field(70009722; "eShop CC Expiration Year"; Code[2])
        {
            Caption = 'eShop CC Expiration Year';
        }
        field(70009723; "eShop CC Card Type"; Option)
        {
            Caption = 'eShop CC Card Type';
            OptionCaption = 'Visa,MasterCard,Amex,Discover';
            OptionMembers = Visa,MasterCard,Amex,Discover;
        }
        field(70009724; "eShop CC Cvv2"; Code[4])
        {
            Caption = 'eShop CC Cvv2';
        }
        field(70009725; "eShop Web CC Name"; Text[30])
        {
            Caption = 'eShop Web CC Name';
        }
        field(70009726; "eShop Web CC Encrypted"; Blob)
        {
            Caption = 'eShop Web CC Encrypted';
        }
        field(70009727; "eShop Coupon Code"; Code[20])
        {
            Caption = 'eShop Coupon Code';
        }
    }

}

tableextension 70009733 eSHopSalesInvoiceLineTabExtn extends "Sales Invoice Line"
{
    fields
    {
        field(70009700; "eShop Tax Amount"; Decimal)
        {
            Caption = 'eShop Tax Amount';
        }
        field(70009701; "eShop Item Disc. Group"; Code[10])
        {
            Caption = 'eShop Item Disc. Group';
        }
        field(70009702; "eShop Category ID"; Code[60])
        {
            Caption = 'eShop Category ID';
        }
        field(70009703; "eShop AttributeDescription"; Blob)
        {
            Caption = 'eShop AttributeDescription';
        }
        field(70009704; "eShop AttributeXML"; Blob)
        {
            Caption = 'eShop AttributeXML';
        }
        field(70009705; "eShop Kit Option Group"; Code[10])
        {
            Caption = 'eShop Kit Option Group';
        }
    }
}

tableextension 70009734 eSHopPaymentMethodTabExtn extends "Payment Method"
{
    fields
    {
        field(70009700; "eShop Payment Method"; Code[30])
        {
            Caption = 'eShop Payment Method';
        }
    }
}

tableextension 70009735 eSHopShippingAgentTabExtn extends "Shipping Agent"
{
    fields
    {
        field(70009700; "eShop Shipping Method"; text[30])
        {
            Caption = 'eShop Shipping Method';
        }
    }
}

tableextension 70009736 eSHopAssemblyLineTabExtn extends "Assembly Line"
{
    fields
    {
        field(70009700; "eShop Option Group"; Code[10])
        {
            Caption = 'eShop Option Group';
        }
        field(70009701; "eShop Option No."; Integer)
        {
            Caption = 'eShop Option No.';
        }
        field(70009702; "eShop Document Line No."; Decimal)
        {
            Caption = 'eShop Document Line No.';
        }
    }
}


tableextension 70009737 eSHopItemVariantTabExtn extends "Item Variant"
{
    fields
    {
        field(70009700; "eShop Attribute 1"; Code[10])
        {
            Caption = 'eShop Attribute 1';
        }
        field(70009701; "eShop Attribute 2"; Code[10])
        {
            Caption = 'eShop Attribute 2';
        }
        field(70009702; "eShop Attribute 3"; Code[10])
        {
            Caption = 'eShop Attribute 3';
        }
        field(70009703; "eShop Block"; Boolean)
        {
            Caption = 'eShop Block';
        }
        field(70009704; "eShop Attribute 4"; Code[10])
        {
            Caption = 'eShop Attribute 4';
        }
        field(70009705; "eShop Attribute 5"; Code[10])
        {
            Caption = 'eShop Attribute 5';
        }
        field(70009706; "eShop Attribute 6"; Code[10])
        {
            Caption = 'eShop Attribute 6';
        }
        field(70009707; "eShop Web Item No."; Code[20])
        {
            Caption = 'eShop Web Item No.';
        }
    }

}

tableextension 70009738 eSHopIUOMTabExtn extends "Item Unit of Measure"
{
    fields
    {
        field(70009700; "eShop Published"; Boolean)
        {
            Caption = 'eShop Published';
        }
    }
}

// ---eShop Tables---
table 70009700 "eShop Setup"
{
    // version ES1.00.1

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------
    // 
    // <changelog>
    //   <add id="AP0000" dev="v-hellem" date="2006-05-11" area="Kitting"
    //    releaseversion="KITNA5.00" feature="280">
    //    Kitting Functionality -
    //   </add>
    //   <add id="NA0001" dev="elynch" date="2006-02-08" area="NASalesTax"
    //    releaseversion="NAVUS3.10.01" feature="617">
    //    Added field 10015
    //   </add>
    //   <change id="NA0002" dev="elynch" date="2006-02-08" area="Reports SR"
    //    baseversion="NAVUS3.10.01" releaseversion="NAVUS3.10.01" feature="622">
    //    Add key "by Salesperson".
    //   </change>
    //   <change id="NA0003" dev="elynch" date="2006-02-08" area="Elec. Pay"
    //    baseversion="NAVUS3.10.01" releaseversion="NAVUS3.10.01" feature="608">
    //    Add North American Electronic Payments functionality.
    //    Add field 10017, Bank Communication.
    //   </change>
    // </changelog>
    // 
    // <changelog>
    //   <add id="AP0000" dev="v-hellem" date="2006-05-11" area="Kitting"
    //    releaseversion="KITNA5.00" feature="280">
    //    Kitting Functionality -
    //   </add>
    //   <add id="NA0001" dev="elynch" date="2006-02-08" area="NASalesTax"
    //    releaseversion="NAVUS3.10.01" feature="617">
    //    Added field 10015
    //   </add>
    //   <change id="NA0002" dev="elynch" date="2006-02-08" area="Reports SR"
    //    baseversion="NAVUS3.10.01" releaseversion="NAVUS3.10.01" feature="622">
    //    Add key "by Salesperson".
    //   </change>
    //   <change id="NA0003" dev="elynch" date="2006-02-08" area="Elec. Pay"
    //    baseversion="NAVUS3.10.01" releaseversion="NAVUS3.10.01" feature="608">
    //    Add North American Electronic Payments functionality.
    //    Add field 10017, Bank Communication.
    //   </change>
    // </changelog>
    // 
    // 
    // 
    // 3.11 (2007.04.12):
    // Word Merge Fields implementation.
    // [] char implementation removed.


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Web Customer Code"; Code[20])
        {
            TableRelation = Customer;
        }
        field(3; "User No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4; "eShop URL"; Text[75])
        {

            trigger OnValidate();
            begin
                IF "eShop URL" <> '' THEN BEGIN
                    "eShop Admin URL" := "eShop URL" + '/Admin';
                    "eShop Web Service URL" := "eShop URL" + '/erpservice/service1.asmx';
                END;
            end;
        }
        field(5; "eShop Web Service URL"; Text[75])
        {
        }
        field(6; "Nav Web Service URL"; Text[250])
        {
        }
        field(7; "License Key"; Text[250])
        {
            Editable = true;
        }
        field(8; "Category No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9; "eShop Admin URL"; Text[75])
        {
        }
        field(10; "Browser Addin Exists"; Boolean)
        {
        }
        field(11; "Web Customer No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12; "Gift Card GL No."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Web Coupon Code GL No."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(14; "Web Customer Bus Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(15; "Web Customer Posting group"; Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(16; "Web Customer Payment Method"; Code[20])
        {
            TableRelation = "Payment Method";
        }
        field(17; "eShop Customer Template"; Code[20])
        {
            TableRelation = "Customer Template";
        }
        field(18; "Quote No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(19; "Web Shipping GL No."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(20; "Web Tax GL No."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(21; "Default Inventory Location"; Code[20])
        {
            TableRelation = Location;
            ValidateTableRelation = false;
        }
        field(22; "Available Inventory"; Boolean)
        {
        }
        field(23; "Report Path"; Text[150])
        {
        }
        field(48; "Shipment Template"; BLOB)
        {
        }
        field(49; "Sender E-Mail ID"; Text[50])
        {
        }
        field(50; "Default SalesPerson E-Mail"; Text[50])
        {
        }
        field(51; "Send Shipment Mail"; Boolean)
        {
        }
        field(52; "Item Image Path"; Text[250])
        {
            Description = 'ES1.00.1';
        }
        field(53; "Web Service URL"; Text[250])
        {

        }


    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Eshopsetup: Record 70009700;

    procedure EnterLicense(LicenseKey: Text[30]);
    begin
        "License Key" := LicenseKey;
    end;
}

table 70009701 "eShop Users"
{
    // version ES1.00.1

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------

    DrillDownPageID = "eShop Users";
    LookupPageID = "eShop Users";

    fields
    {
        field(1; UserID; Code[10])
        {
        }
        field(2; Email; Text[75])
        {

            trigger OnValidate();
            begin
                ESUser.RESET;
                ESUser.SETRANGE(Email, Email);
                IF ESUser.FINDFIRST THEN
                    ERROR('User already exists with  this email id');
            end;
        }
        field(3; "First Name"; Text[50])
        {
        }
        field(4; Password; Text[30])
        {
        }
        field(5; "User Type"; Option)
        {


            OptionMembers = Customer,Salesperson,Contact,Supplier;
        }
        field(6; "No."; Code[20])
        {
            TableRelation = IF ("User Type" = CONST (Customer)) Customer."No."
            ELSE
            IF ("User Type" = CONST (Contact)) Contact."No."
            ELSE
            IF ("User Type" = CONST (Salesperson)) "Salesperson/Purchaser".Code
            ELSE
            IF ("User Type" = CONST (Supplier)) Vendor."No.";
        }
        field(7; Blocked; Boolean)
        {

            trigger OnValidate();
            begin
                MESSAGE('Push the Update Button');
            end;
        }
        field(8; "Created Date"; Date)
        {
        }
        field(9; "Last Modified Date"; Date)
        {
        }
        field(10; "Contact Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
        field(11; "Created on eShop"; Boolean)
        {

            trigger OnValidate();
            begin
                IF "No." = '' THEN BEGIN
                    GetESSetup.GET;
                    GetESSetup.TESTFIELD("eShop Customer Template");
                    GetESSetup.TESTFIELD("Web Customer No. Series");
                    Customer.INIT;
                    //Customer.VALIDATE("No.",'');
                    Customer.VALIDATE("No.", NoSeriesMgt.GetNextNo(GetESSetup."Web Customer No. Series", TODAY, TRUE));
                    Customer.INSERT(TRUE);
                    IF Custemplate.GET(GetESSetup."eShop Customer Template") THEN BEGIN
                        Customer."Gen. Bus. Posting Group" := Custemplate."Gen. Bus. Posting Group";
                        Customer."Customer Posting Group" := Custemplate."Customer Posting Group";
                        Customer."Payment Method Code" := Custemplate."Payment Method Code";
                        Customer."Customer Price Group" := Custemplate."Customer Price Group";
                        Customer."Payment Terms Code" := Custemplate."Payment Terms Code";
                        Customer."Invoice Disc. Code" := Custemplate."Invoice Disc. Code";
                        Customer."Customer Disc. Group" := Custemplate."Customer Disc. Group";
                        Customer."Allow Line Disc." := Custemplate."Allow Line Disc.";
                        Customer."Credit Limit (LCY)" := Custemplate."Credit Limit (LCY)";
                        Customer."Tax Liable" := Custemplate."Tax Liable";
                        Customer."Tax Area Code" := Custemplate."Tax Area Code";
                        Customer.MODIFY;
                    END ELSE BEGIN
                        Customer."Gen. Bus. Posting Group" := GetESSetup."Web Customer Bus Posting Group";
                        Customer."Customer Posting Group" := GetESSetup."Web Customer Posting group";
                        Customer."Payment Method Code" := GetESSetup."Web Customer Payment Method";
                        Customer.MODIFY;
                    END;

                    "User Type" := "User Type"::Customer;
                    "No." := Customer."No.";
                END;
            end;
        }
        field(12; "Last Name"; Text[50])
        {
        }
        field(13; "eShop Enabled"; Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD("First Name");
                TESTFIELD("Last Name");
                TESTFIELD(Email);
                TESTFIELD(Password);
                TESTFIELD("No.");
                /*
                IF "Parent Category ID" = 0 THEN
                  IF NOT CONFIRM('Parent Caetgory is Blank , Due you still want to enable?',TRUE) THEN
                    ERROR('Asssign parent category ID');
                 */
                IF "eShop Enabled" THEN
                    MESSAGE('Push the Publish Button');
                IF NOT "eShop Enabled" THEN
                    MESSAGE('Push the Update Button');

            end;
        }
        field(14; "eShop ID"; Integer)
        {
        }
        field(15; "Published Date"; Date)
        {
        }
        field(16; NeedUpdate; Boolean)
        {
        }
        field(17; "Permission Type"; Option)
        {

            OptionMembers = " ",Admin,Super,Regular;
        }
    }

    keys
    {
        key(Key1; UserID)
        {
            Clustered = true;
        }
        key(Key2; Email)
        {
        }
        key(Key3; "No.")
        {
        }
        key(Key4; "Created Date")
        {
        }
    }


    trigger OnDelete();
    begin
        //ERROR('You do not have permission to delete a eShop User');
    end;

    trigger OnInsert();
    begin

        GetESSetup.GET('');
        GetESSetup.TESTFIELD(GetESSetup."User No. Series");
        UserID := NoSeriesMgt.GetNextNo(GetESSetup."User No. Series", TODAY, TRUE);
        "Created Date" := TODAY;


    end;

    trigger OnModify();
    begin
        "Last Modified Date" := TODAY;

        /*ESUser.SETRANGE(Email,Email);
        IF ESUser.FINDFIRST THEN
          ERROR('User already exists with  this email id');*/


    end;

    trigger OnRename();
    begin
        //ERROR('You do not have permission to delete a eShop User');
    end;

    var
        NoSeriesMgt: Codeunit 396;
        GetESSetup: Record 70009700;
        Customer: Record 18;
        ESUser: Record "eShop Users";
        Custemplate: Record 5105;
}

table 70009702 "eShop Categories"
{
    // version ES1.00.1

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------

    DrillDownPageID = "eShop Categories List";
    LookupPageID = "eShop Categories List";

    fields
    {
        field(1; "Category ID"; Code[20])
        {
        }
        field(2; Name; Text[30])
        {

            trigger OnValidate();
            begin
                Description := Name;
            end;
        }
        field(3; "Parent Category ID"; Code[20])
        {
            TableRelation = "eShop Categories";
        }
        field(4; "Display Order"; Integer)
        {
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Meta Keywords"; Text[30])
        {
        }
        field(7; "Meta Description"; Text[30])
        {
        }
        field(8; "eShop Enabled"; Boolean)
        {

            trigger OnValidate();
            begin
                TESTFIELD(Name);
                IF "Parent Category ID" = '' THEN
                    IF NOT CONFIRM('Parent Caetgory is Blank , Due you still want to enable?', TRUE) THEN
                        ERROR('Asssign parent category ID');

                IF "eShop Enabled" THEN
                    MESSAGE('Push the Publish Button');
                IF NOT "eShop Enabled" THEN
                    MESSAGE('Push the Update Button');
            end;
        }
        field(9; "Sorting Text"; Text[100])
        {
        }
        field(10; Sorting; Integer)
        {
        }
        field(11; "eShop ID"; Integer)
        {
        }
        field(12; "Published Date"; Date)
        {
        }
        field(13; "Item Category Code"; Code[20])
        {
            TableRelation = "Item Category";
        }
        field(33; Level; Integer)
        {

            trigger OnValidate();
            begin
                //IF Level < 0 THEN Level := 0;
                //IF Level > 5 THEN Level := 5;
            end;
        }
        field(35; "New Sorting"; Integer)
        {
        }
        field(36; "Variant 1"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
        field(37; "Variant 2"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
        field(38; "Variant 3"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
        field(39; "Variant 4"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
        field(40; "Variant 5"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
        field(41; "Variant 6"; Text[250])
        {
            TableRelation = "eShop Attribute Type";
        }
    }

    keys
    {
        key(Key1; "Category ID")
        {
            Clustered = true;
        }
        key(Key2; "Parent Category ID")
        {
        }
        key(Key3; "eShop ID")
        {
        }
        key(Key4; Sorting)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Category ID", Name, "Parent Category ID")
        {
        }
    }

    trigger OnDelete();
    begin
        //ERROR('You do not have permission to delete a eShop category');
    end;

    trigger OnInsert();
    begin
        GetESSetup.GET;
        IF "Category ID" = '' THEN BEGIN
            GetESSetup.TESTFIELD(GetESSetup."Category No. Series");
            EVALUATE("Category ID", NoSeriesMgt.GetNextNo(GetESSetup."Category No. Series", TODAY, TRUE));
        END;
    end;

    trigger OnRename();
    begin
        //ERROR('You do not have permission to rename a eShop category');
    end;

    var
        GetESSetup: Record 70009700;
        NoSeriesMgt: Codeunit 396;
}

table 70009703 "eShop Attributes"
{
    // version ES1.00

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------

    DrillDownPageID = "eShop Attributes";
    LookupPageID = "eShop Attributes";

    fields
    {
        field(1; "Attribute Code"; Code[10])
        {
        }
        field(2; "Attribute Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Attribute Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009704 "eShop Item Attributes"
{
    // version ES1.00

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------

    DrillDownPageID = "eShop Item Attributes";
    LookupPageID = "eShop Item Attributes";

    fields
    {
        field(1; "Item No."; Code[20])
        {
            TableRelation = Item;
        }
        field(2; "Attribute Code"; Code[10])
        {
            TableRelation = "eShop Attributes";
        }
        field(3; "Attribute Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Item No.", "Attribute Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009705 "eShop Discount Codes"
{
    // version ES1.00

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------


    fields
    {
        field(1; "Document Type"; Option)
        {
            //Option//Caption = te,Order,Invoice;
            OptionMembers = Quote,"Order",Invoice;
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Line No."; Integer)
        {
        }
        field(4; Type; Option)
        {

            OptionMembers = "Coupon Code","Gift Card";
        }
        field(5; "Code"; Code[30])
        {
        }
        field(6; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009706 "eShop Cue"
{
    // version ES1.00

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------

    //Caption = 'Sales Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            //Caption = 'Primary Key';
        }
        field(2; "Sales Quotes - Open"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Quote),
                                              Status = FILTER (Open)));
            //Caption = 'Sales Quotes - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Sales Orders - Open"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                              Status = FILTER (Open)));
            //Caption = 'Sales Orders - Open';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Ready to Ship"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                              Status = FILTER (Released),
                                              Ship = FILTER (false),
                                              "Shipment Date" = FIELD ("Date Filter2")));
            //Caption = 'Ready to Ship';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Delayed; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                              Status = FILTER (Released),
                                              "Shipment Date" = FIELD ("Date Filter")));
            //Caption = 'Delayed';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Sales Return Orders - All"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER ("Return Order"),
                                              Status = FILTER (Open)));
            //Caption = 'Sales Return Orders - All';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Sales Credit Memos - All"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER ("Credit Memo"),
                                              Status = FILTER (Open)));
            //Caption = 'Sales Credit Memos - All';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Partially Shipped"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                              Status = FILTER (Released),
                                              Ship = FILTER (true),
                                              "Completely Shipped" = FILTER (false),
                                              "Shipment Date" = FIELD ("Date Filter2")));
            //Caption = 'Partially Shipped';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Date Filter"; Date)
        {
            //Caption = 'Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Date Filter2"; Date)
        {
            //Caption = 'Date Filter2';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(37103000; "B2C Customers"; Integer)
        {
            CalcFormula = Count (Customer WHERE ("eShop B2C Customer" = FILTER (true)));
            Description = 'ES1.00';
            FieldClass = FlowField;
        }
        field(37103001; "eShop Orders"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Order),
                                              "eShop Web Order" = FILTER (true)));
            Description = 'ES1.00';
            FieldClass = FlowField;
        }
        field(37103002; "eShop Quotes"; Integer)
        {
            CalcFormula = Count ("Sales Header" WHERE ("Document Type" = FILTER (Quote),
                                              "eShop Web Order" = FILTER (true)));
            Description = 'ES1.00';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009707 "eShop Taxable States"
{
    // version ES1.00

    // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
    // ---------------------------------------------------------------------------------------------------------
    // Copyright © 2011-2012 Dynamics eShop Inc.
    // All rights reserved
    // This object contains proprietary information of  Dynamics eShop Inc.; it is provided under a license
    // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
    // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
    // and the client and remains the exclusive property of Dynamics eShop Inc.
    // Visit www.dynamicseshop.com for news and updates.
    // ---------------------------------------------------------------------------------------------------------


    fields
    {
        field(1; "State Code"; Code[10])
        {
        }
        field(2; "State Name"; Text[30])
        {
        }
        field(3; "Tax Liable"; Boolean)
        {
            InitValue = true;
        }
        field(4; "Tax Area Code"; Code[20])
        {
            TableRelation = "Tax Area";
        }
        field(5; "Customer Template Code"; Code[20])
        {
            TableRelation = "Customer Template";
        }
        field(6; "Payment Terms Code"; Code[10])
        {
            //Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(7; "Payment Method Code"; Code[10])
        {
            //Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
    }

    keys
    {
        key(Key1; "State Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009708 "eSHop Coupon Setup"
{
    // version ES1.00

    // [!@#] MS WO12278 10.16.12 SCSKM
    //       - New Table

    DrillDownPageID = "eShop Coupon Setup List";
    LookupPageID = "eShop Coupon Setup List";
    

    fields
    {
        field(1; "Coupon Code"; Code[20])
        {
        }
        field(2; "Coupon Description"; Text[50])
        {
        }
        field(3; "Coupon Type"; Option)
        {
            OptionMembers = " ","Buy 1 Get 1 Free","% Discount","$ Discount","Min Order";

            trigger OnValidate();
            begin
                CASE "Coupon Type" OF
                    "Coupon Type"::" ":
                        BEGIN
                            "Discount %" := 0;
                            "Discount $" := 0;
                        END;
                    "Coupon Type"::"Buy 1 Get 1 Free":
                        BEGIN
                            "Discount %" := 100;
                            "Discount $" := 0;
                        END;
                    "Coupon Type"::"% Discount":
                        "Discount $" := 0;
                    "Coupon Type"::"$ Discount":
                        "Discount %" := 0;
                END;
            end;
        }
        field(4; "Sales Type"; Option)
        {
            OptionMembers = " ","All Customer",Customer,"Customer Price Group";

            trigger OnValidate();
            begin
                TESTFIELD("Coupon Type");

                IF "Sales Type" <> xRec."Sales Type" THEN
                    VALIDATE("Sales Code", '');
            end;
        }
        field(5; "Sales Code"; Code[20])
        {
            TableRelation = IF ("Sales Type" = CONST ("Customer Price Group")) "Customer Price Group"
            ELSE
            IF ("Sales Type" = CONST (Customer)) Customer;
        }
        field(6; "Qualifier Type"; Option)
        {
            OptionMembers = " ",Item,"Item Disc. Group",Categories;

            trigger OnValidate();
            begin
                TESTFIELD("Coupon Type");
                TESTFIELD("Sales Type");

                IF "Qualifier Type" <> xRec."Qualifier Type" THEN
                    VALIDATE("Qualifier Code", '');
            end;
        }
        field(7; "Qualifier Code"; Code[20])
        {
            TableRelation = IF ("Qualifier Type" = CONST (Item)) Item
            ELSE
            IF ("Qualifier Type" = CONST ("Item Disc. Group")) "Item Discount Group"
            ELSE
            IF ("Qualifier Type" = CONST (Categories)) "eShop Categories";
        }
        field(8; "Min. Qty."; Integer)
        {
        }
        field(9; "Promo Type"; Option)
        {
            OptionMembers = " ",Item,"Item Disc. Group",Category;

            trigger OnValidate();
            begin
                TESTFIELD("Coupon Type");
                TESTFIELD("Sales Type");
                TESTFIELD("Qualifier Type");

                IF "Promo Type" <> xRec."Promo Type" THEN
                    VALIDATE("Promo Code", '');
            end;
        }
        field(10; "Promo Code"; Code[20])
        {
            TableRelation = IF ("Promo Type" = CONST (Item)) Item
            ELSE
            IF ("Promo Type" = CONST ("Item Disc. Group")) "Item Discount Group";
        }
        field(11; Quantity; Integer)
        {
        }
        field(12; "Discount %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate();
            begin
                IF ("Discount %" <> 0) AND (NOT ("Coupon Type" IN ["Coupon Type"::"Buy 1 Get 1 Free", "Coupon Type"::"% Discount"])) THEN
                    ERROR('Discount % field can only have a value of Coupon Type is Buy 1 Get 1 Free OR % Discount');
            end;
        }
        field(13; "Discount $"; Decimal)
        {

            trigger OnValidate();
            begin
                IF ("Discount $" <> 0) AND ("Coupon Type" <> "Coupon Type"::"$ Discount") THEN
                    ERROR('Discount $ field can only have a value of Coupon Type is $ Discount');
            end;
        }
        field(14; "Start Date"; Date)
        {
        }
        field(15; "End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Coupon Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        IF "Coupon Type" = "Coupon Type"::"$ Discount" THEN
            TESTFIELD("Discount $");
        IF "Coupon Type" = "Coupon Type"::"% Discount" THEN
            TESTFIELD("Discount %");
    end;
}

table 70009709 "eShop Reports"
{
    // version ES1.00


    fields
    {
        field(1; "Report ID"; Code[20])
        {
        }
        field(2; "Report Name"; Text[50])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; "User Type"; Code[10])
        {
        }
        field(6; "User ID"; Code[20])
        {
        }
        field(7; "Report Link"; Text[50])
        {
        }
        field(8; "Customer No."; Code[20])
        {
            TableRelation = Customer;
        }
        field(9; "SalesPerson Code"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(10; "External Doc No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Report ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009710 "eShop Variations"
{
    // version ES1.00


    fields
    {
        field(10; "Item No."; Code[20])
        {
            NotBlank = true;
            TableRelation = Item;
        }
        field(20; "Attribute Code"; Option)
        {
            OptionCaption = '" ",Attribute1,Attribute2,Attribute3,"Attribute4 ","Attribute5 ",Attribute6';
            OptionMembers = " ",Attribute1,Attribute2,Attribute3,"Attribute4 ","Attribute5 ",Attribute6;
        }
        field(30; "Attribute Type"; Code[20])
        {
            NotBlank = true;
            TableRelation = "eShop Attribute Type";
        }
        field(35; "Attribute Value"; Code[20])
        {
            TableRelation = "eShop Attribute Value"."Attribute Value" WHERE ("Attribute Type" = FIELD ("Attribute Type"));

            trigger OnValidate();
            begin
                Description := "Attribute Value";
            end;
        }
        field(40; Description; Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Attribute Code", "Attribute Type", "Attribute Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        Description := "Attribute Value";
    end;

    trigger OnModify();
    begin
        Description := "Attribute Value";
    end;

    var
        ItemVarinat: Record 5401;
}

table 70009711 "eShop Attribute Type"
{
    // version ES1.00

    DrillDownPageID = "eShop Attribute Type";
    LookupPageID = "eShop Attribute Type";

    fields
    {
        field(1; "Attribute Types"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Attribute Types")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009712 "eShop Attribute Value"
{
    // version ES1.00

    DrillDownPageID = "eShop Attribute Values";
    LookupPageID = "eShop Attribute Values";

    fields
    {
        field(1; "Attribute Type"; Code[20])
        {
        }
        field(2; "Attribute Value"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Attribute Type", "Attribute Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

table 70009714 "eShop Group Items"
{
    // version ES1.00


    fields
    {
        field(1; "Parent Item No."; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate();
            begin
                IF ItemRec.GET("Parent Item No.") THEN
                    "Parent Decription" := ItemRec.Description;
            end;
        }
        field(2; "Unit Of Measure Code."; Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(3; "Child Item No."; Code[20])
        {
            TableRelation = Item;

            trigger OnValidate();
            begin
                IF ItemRec.GET("Child Item No.") THEN
                    "Child Description" := ItemRec.Description;
            end;
        }
        field(4; "eShop Enabled"; Boolean)
        {
        }
        field(5; "Parent Decription"; Text[80])
        {
        }
        field(6; "Child Description"; Text[80])
        {
        }
    }

    keys
    {
        key(Key1; "Parent Item No.", "Unit Of Measure Code.", "Child Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemRec: Record 27;
}

