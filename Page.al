pageextension 70009775 eSHopShipmentMethodPageExtn extends "Shipment Methods"
{
    layout
    {
        addafter(Description)
        {
            field("eShop Shipping Method"; "eShop Shipping Method")
            {
                Caption = 'eShop Shipping Method';
            }
        }
    }
}
pageextension 70009776 eSHopCustomerCardPageExtn extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("eShop B2C Customer"; "eShop B2C Customer")
            {
                Caption = 'B2C Customer';
                ApplicationArea = All;

            }
        }
    }

    actions
    {
        addafter(History)
        {
            group(eShop)
            {
                action("eShop Users")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    //Caption = 'eShop Users';
                    Image = Users;
                    trigger OnAction();

                    begin

                    end;
                }
                action("Create eShop Users")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    //Caption = 'Create eShop Users';
                    Image = UserInterface;
                    trigger OnAction();

                    begin

                    end;
                }
            }


        }
    }

}
pageextension 70009777 eSHopItemCardPageExtn extends "Item Card"
{

    layout
    {
        addafter(Item)
        {
            group(eShop)
            {
                field("eShop Enabled"; "eShop Enabled")
                {
                    Caption = 'eShop Enabled';
                    ApplicationArea = ALL;
                }

                field("eShop Category ID"; "eShop Category ID")
                {
                    Caption = 'eShop Category ID';
                    ApplicationArea = ALL;
                }

                field("Manufacturer Code"; "Manufacturer Code")
                {
                    Caption = 'Manufacturer Code';
                    ApplicationArea = ALL;
                }

                field("eShop ID"; "eShop ID")
                {
                    Caption = 'eShop ID';
                    ApplicationArea = ALL;
                }

                field("eShop Featured Item"; "eShop Featured Item")
                {
                    Caption = 'eShop Featured Item';
                    ApplicationArea = ALL;
                }
                field("eShop Free Shipping"; "eShop Free Shipping")
                {
                    Caption = 'eShop Free Shipping';
                    ApplicationArea = ALL;
                    Visible = false;
                }
                field("eShop Shipping Allowed"; "eShop Shipping Allowed")
                {
                    Caption = 'eShop Shipping Allowed';
                    ApplicationArea = ALL;
                    Visible = false;
                }
                group("eShop Image Details")
                {

                    field("eShop Picture Name 1"; "eShop Picture Name 1")
                    {
                        Caption = 'Picture Name 1';
                        ApplicationArea = ALL;
                    }
                    field("eShop Picture Name 2"; "eShop Picture Name 2")
                    {
                        Caption = 'Picture Name 2';
                        ApplicationArea = ALL;
                    }
                    field("eShop Picture Name 3"; "eShop Picture Name 3")
                    {
                        Caption = 'Picture Name 3';
                        ApplicationArea = ALL;
                    }
                }

            }
        }
    }
    actions
    {
        addafter("S&ales")
        {
            group("eShop Process")
            {

                Caption = 'eShop';
                action("eShop Publish")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Publish';
                    Image = AddAction;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Update")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Update';
                    Image = AddAction;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Preview Item")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Preview Item';
                    Image = View;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Edit Item")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Edit Item';
                    Image = Edit;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Insert All")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Insert All';
                    Image = AddAction;
                    PromotedCategory = Category6;
                    Visible = false;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Item Specification")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Item Specifications';
                    Image = ViewDetails;
                    PromotedCategory = Category6;
                    Visible = false;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Item Variantions")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Item Variations';
                    Image = ItemVariant;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Item Variations TO Variants")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Item Variations TO Variants';
                    Image = ItemVariant;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
                action("eShop Item Variants TO Variations")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Item Variants TO Variations';
                    Image = ItemVariant;
                    PromotedCategory = Category6;
                    trigger OnAction();

                    begin

                    end;
                }
            }


        }
    }

}
pageextension 70009778 eSHopAssemblyBomPageExtn extends "Assembly BOM"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("eShop Option Group"; "eShop Option Group")
            {
                Caption = 'Option Group';
                ApplicationArea = ALL;
            }
        }
    }
}
pageextension 70009779 eSHopSalesQuotePageExtn extends "Sales Quote"
{
    layout
    {
        addafter("Shipping and Billing")
        {
            group(eShop)
            {
                field("eShop Web Order"; "eShop Web Order")
                {
                    Caption = 'Web Order';
                    ApplicationArea = ALL;
                }
                
            }
        }
    }
}
pageextension 70009780 eSHopSalesOrderPageExtn extends "Sales Order"
{
    layout
    {
        addafter("Foreign Trade")
        {
            group(eShop)
            {
                field("eShop Login Email"; "eShop Login Email")
                {
                    Caption = 'Login Email';
                    ApplicationArea = ALL;
                }
                field("eShop Paid With"; "eShop Paid With")
                {
                    Caption = 'Paid With';
                    ApplicationArea = ALL;
                }
                field("eShop Shipped Via"; "eShop Shipped Via")
                {
                    Caption = 'Shipped Via';
                    ApplicationArea = ALL;
                }
                field("eShop Web CC"; "eShop Web CC")
                {
                    Caption = 'Web CC';
                    ApplicationArea = ALL;
                }
                field("eShop CC Expiration Month"; "eShop CC Expiration Month")
                {
                    Caption = 'CC Expiration Month';
                    ApplicationArea = ALL;
                }
                field("eShop CC Expiration Year"; "eShop CC Expiration Year")
                {
                    Caption = 'CC Expiration Year';
                    ApplicationArea = ALL;
                }
                field("eShop CC Card Type"; "eShop CC Card Type")
                {
                    Caption = 'CC Card Type';
                    ApplicationArea = ALL;
                }
                field("eShop CC Cvv2"; "eShop CC Cvv2")
                {
                    Caption = 'CC Cvv2';
                    ApplicationArea = ALL;
                }
                field("eShop Web Order"; "eShop Web Order")
                {
                    Caption = 'Web Order';
                    ApplicationArea = ALL;
                }
                
            }


        }


    }

    actions
    {
        addafter(AssemblyOrders)
        {
            group("eShop Process")
            {
                Caption = 'eShop';
                action("eShop Create Assembly Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Create Assembly Orders';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = CreateDocument;

                }

            }
        }
    }



}

pageextension 70009781 eSHopSalesSubFormExtn extends "Sales Order Subform"
{
    actions
    {
        addafter(BlanketOrder)
        {
            group("eShop")
            {
                Caption = 'eShop';
            
                action("eShop Preview Options")
                {
                    ApplicationArea = All;
                    Caption = 'Preview Options';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Image = View;
                }

            }
        }
    }
}
pageextension 70009782 eSHopPaymentMethodsPageExtn extends "Payment Methods"
{
    layout
    {
        addafter("Use for Invoicing")
        {
            field("eShop Payment Method"; "eShop Payment Method")
            {
                Caption = 'eShop Payment Method';
                ApplicationArea = All;
            }
        }
    }
}
pageextension 70009783 eSHopShippingAgentsPageExtn extends "Shipping Agents"
{
    layout
    {
        addafter("Account No.")
        {
            field("eShop Shipping Method"; "eShop Shipping Method")
            {
                Caption = 'eShop Shipping Method';
                ApplicationArea = ALL;
            }
        }
    }
}

pageextension 70009784 eSHopIUOMPageExtn extends "Item Units of Measure"
{
    layout
    {
        addafter(Weight)
        {
            field("eShop Published"; "eShop Published")
            {
                Caption = 'eShop Enabled';
                ApplicationArea = All;

            }
        }
    }
}

pageextension 70009785 eSHopSalesManagerRCPageExtn extends "Sales Manager Role Center"
{
    actions
    {
        addafter("Sales Line &Discounts")
        {
            group("eShop")
            {
                Caption = 'eShop';
                action("eShop Account &Registration")
                {
                    ApplicationArea = All;
                    Caption = 'eShop Account &Registration';
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    RunObject = page "eShop Wizard";

                }
                action("eShop Setup Card")
                {
                    ApplicationArea = All;
                    Caption = 'eShop Setup Card';
                    Image = DocumentEdit;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = page "eShop Setup Card";

                }
                action("eShop Help Site")
                {
                    ApplicationArea = All;
                    Caption = 'Help Site';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = codeunit "eShop Dotnet Service";

                }
            }
        }
    }

}

pageextension 70009786 eSHopOrderPrssorRCPageExtn extends "Order Processor Role Center"
{
    actions
    {
        addbefore("Sales &Quote")
        {
            action("eShop Account &Registration")
            {
                ApplicationArea = All;
                Caption = 'eShop Account &Registration';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Wizard";

            }
            action("eShop Setup Card")
            {
                ApplicationArea = All;
                Caption = 'eShop Setup Card';
                Image = DocumentEdit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Setup Card";

            }
            action("eShop Help Site")
            {
                ApplicationArea = All;
                Caption = 'Help Site';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = codeunit "eShop Dotnet Service";

            }

        }
    }

}

pageextension 70009787 eSHopBusinessMngrRCPageExtn extends "Business Manager Role Center"
{

    actions
    {
        addbefore("Sales Quote")
        {
            action("eShop Account &Registration")
            {
                ApplicationArea = All;
                Caption = 'eShop Account &Registration';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Wizard";

            }
            action("eShop Setup Card")
            {
                ApplicationArea = All;
                Caption = 'eShop Setup Card';
                Image = DocumentEdit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Setup Card";

            }
            action("eShop Help Site")
            {
                ApplicationArea = All;
                Caption = 'Help Site';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = codeunit "eShop Dotnet Service";

            }

        }
    }

}

pageextension 70009788 eSHopSecurityAdminRCPageExtn extends "Security Admin Role Center"
{
    actions
    {
        addbefore("User Groups")
        {
            action("eShop Account &Registration")
            {
                ApplicationArea = All;
                Caption = 'eShop Account &Registration';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Wizard";

            }
            action("eShop Setup Card")
            {
                ApplicationArea = All;
                Caption = 'eShop Setup Card';
                Image = DocumentEdit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Setup Card";

            }
            action("eShop Help Site")
            {
                ApplicationArea = All;
                Caption = 'Help Site';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = codeunit "eShop Dotnet Service";

            }
        }
    }

}

pageextension 70009789 eSHopAccountantRCPageExtn extends "Accountant Role Center"
{
    actions
    {
        addbefore(Vendor)
        {
            action("eShop Account &Registration")
            {
                ApplicationArea = All;
                Caption = 'eShop Account &Registration';

                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Wizard";

            }
            action("eShop Setup Card")
            {
                ApplicationArea = All;
                Caption = 'eShop Setup Card';
                Image = DocumentEdit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "eShop Setup Card";

            }
            action("eShop Help Site")
            {
                ApplicationArea = All;
                Caption = 'Help Site';
                Image = Web;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = codeunit "eShop Dotnet Service";

            }

        }
    }

}

//---eShop Pages---

page 70009700 "eShop Setup"
{
    // version ES1.00WS

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

    PageType = Card;
    SourceTable = "eShop Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Web Customer Code"; "Web Customer Code")
                {
                    ApplicationArea = All;
                }
                part(Manufacturers; "eShop Manufacturers")
                {
                    Visible = false;
                }
                field("eShop URL"; "eShop URL")
                {
                    ApplicationArea = All;
                    Caption = 'eShop URL';
                }
                field("License Key"; "License Key")
                {
                    ApplicationArea = All;
                }
                field("Company Name"; COMPANYNAME)
                {
                    ApplicationArea = All;
                    Caption = 'Company Name';
                }
                field("ERP License No"; ERPLicenseNo)
                {
                    ApplicationArea = All;
                    Caption = 'ERP License No';
                }
                field("Shipment Template"; "Shipment Template")
                {
                    ApplicationArea = All;
                }
                field("Send Shipment Mail"; "Send Shipment Mail")
                {
                    ApplicationArea = All;
                }
                field("Item Image Path"; "Item Image Path")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("<Action4>")
            {
                Caption = 'Mail Templates';

                group("<Action22>")
                {
                    Caption = 'Approval Mail Template';

                    action("<Action23>")
                    {
                        Caption = 'Import';

                        Ellipsis = true;

                        trigger OnAction();
                        var
                            RBAutoMgt: Codeunit 419;
                            BLOBRef: Record 99008535;
                            TempBlob: Record TempBlob;
                            Name: Text[30];
                            EMethods: Codeunit "eShop Methods";
                        begin
                            CALCFIELDS("Shipment Template");
                            IF "Shipment Template".HASVALUE THEN
                                ShpmtTemplateExists := TRUE;
                            Name := '*.HTM';

                            EMethods.BlobImport(TempBlob, Name);
                            "Shipment Template" := TempBlob.Blob;

                            IF ShpmtTemplateExists THEN
                                IF NOT CONFIRM(Text002, FALSE, FIELDCaption("Shipment Template")) THEN
                                    EXIT;
                            CurrPage.SAVERECORD;
                        end;
                    }
                    action("<Action24>")
                    {
                        Caption = 'E&xport';

                        Ellipsis = true;
                        Image = Export;

                        trigger OnAction();
                        var
                            RBAutoMgt: Codeunit 419;
                            BLOBRef: Record TempBlob;
                            EMethods: Codeunit "eShop Methods";
                            NVInstream: InStream;
                            FileDownLoaded: Boolean;
                        begin
                            CALCFIELDS("Shipment Template");
                            IF "Shipment Template".HASVALUE THEN BEGIN
                                BLOBRef.Blob := "Shipment Template";
                                EMethods.BlobExport(BLOBRef, '');
                            END;
                        end;
                    }
                    action("<Action25>")
                    {
                        //Caption = 'Delete';

                        Ellipsis = true;

                        trigger OnAction();
                        begin
                            CALCFIELDS("Shipment Template");
                            IF "Shipment Template".HASVALUE THEN
                                IF CONFIRM(Text003, FALSE, FIELDCaption("Shipment Template")) THEN BEGIN
                                    CLEAR("Shipment Template");
                                    CurrPage.SAVERECORD;
                                END;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

    end;

    var
        ERPLicenseNo: Text[250];

        ShpmtTemplateExists: Boolean;
        Text002: Label 'Do you replace %1';
        Text003: Label 'Do you replace %1';
}


page 70009701 "eShop Users"
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

    PageType = List;
    SourceTable = "eShop Users";
    SourceTableView = SORTING ("Created Date");
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Users';
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserID; UserID)
                {
                    ApplicationArea = All;
                }
                field(Email; Email)
                {
                    ApplicationArea = All;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = All;
                }
                field(Password; Password)
                {
                    ApplicationArea = All;
                    HideValue = true;
                }
                field("User Type"; "User Type")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field("eShop Enabled"; "eShop Enabled")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Enabled';
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                    ApplicationArea = All;
                }
                field("eShop ID"; "eShop ID")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop ID';
                }
                field("Permission Type"; "Permission Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("<Action1000000015>")
            {
                Caption = 'eShop';
                action("Publish")
                {
                    ApplicationArea = All;
                    Caption = 'Publish';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CLEAR(EshopDotNetService);
                        //EshopDotNetService.InsertUser(FORMAT(UserID), TRUE);
                        EshopDotNetService.PubishMasters(UserID, 'insertuserbyerpid', true);
                    end;
                }
                action("update")
                {
                    ApplicationArea = All;
                    Caption = 'Update';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction();
                    begin
                        CLEAR(EshopDotNetService);
                        //EshopDotNetService.UpdateUser(FORMAT(UserID), TRUE);
                        EshopDotNetService.PubishMasters(UserID, 'updateuserbyerpid', true);
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        /* IF CustomerNo <> '' THEN BEGIN
             "User Type" := "User Type"::Customer;
             "No." := CustomerNo;
         END; */
        //CurrPage.Update(false);
    end;

    trigger OnOpenPage();
    begin

        //Clear(Rec);
    end;

    var
        EshopSetup: Record 70009700;
        EshopDotNetService: Codeunit 70009703;
        CustomerNo: Code[20];
        IsHidePswd: Boolean;

    procedure GetCustomerno(CustNo: Code[20]);
    begin

        //CustomerNo := '10000';
    end;
}

page 70009702 "eShop User Card"
{
    // version ES1.00WS

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

    PageType = Card;
    SourceTable = "eShop Users";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(UserID; UserID)
                {
                    ApplicationArea = All;
                }
                field(Email; Email)
                {
                    ApplicationArea = All;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = All;
                }
                field(Password; Password)
                {
                    ApplicationArea = All;
                }
                field("Created on eShop"; "Created on eShop")
                {
                    ApplicationArea = All;
                }
                field("User Type"; "User Type")
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = All;
                }
                field("Last Modified Date"; "Last Modified Date")
                {
                    ApplicationArea = All;
                }
                field("Permission Type"; "Permission Type")
                {
                    ApplicationArea = All;
                }
                part("eShop Customer Setup"; "eShop Customer")
                {
                    //Caption = 'WebShop Customer';
                    SubPageLink = "No." = FIELD ("No.");
                }
                field("eShop ID"; "eShop ID")
                {
                    ApplicationArea = All;
                    //Caption = '<eShop ID>';
                }
                field("eShop Enabled"; "eShop Enabled")
                {
                    ApplicationArea = All;
                    //Caption = '<eShop ID>';
                }
            }
        }
    }

    actions
    {
    }
}

page 70009703 "eShop Categories"
{
    // version ES1.00WS

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

    PageType = List;
    SourceTable = "eShop Categories";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category ID"; "Category ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field("Parent Category ID"; "Parent Category ID")
                {
                    ApplicationArea = All;
                }
                field("Display Order"; "Display Order")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("Meta Keywords"; "Meta Keywords")
                {
                    ApplicationArea = All;
                }
                field("Meta Description"; "Meta Description")
                {
                    ApplicationArea = All;
                }
                field("eShop Enabled"; "eShop Enabled")
                {
                    ApplicationArea = All;
                }
                field("eShop ID"; "eShop ID")
                {
                    ApplicationArea = All;
                }
                field("Variant 1"; "Variant 1")
                {
                    ApplicationArea = All;
                }
                field("Variant 2"; "Variant 2")
                {
                    ApplicationArea = All;
                }
                field("Variant 3"; "Variant 3")
                {
                    ApplicationArea = All;
                }
                field("Variant 4"; "Variant 4")
                {
                    ApplicationArea = All;
                }
                field("Variant 5"; "Variant 5")
                {
                    ApplicationArea = All;
                }
                field("Variant 6"; "Variant 6")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009704 "eShop Item Card"
{
    // version ES1.00WS

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

    //Caption = 'WebShop Item Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Description; Description + "Description 2")
                {
                    //Caption = 'Description';
                    ApplicationArea = All;
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Shelf No."; "Shelf No.")
                {
                    ApplicationArea = All;
                }
                field("Automatic Ext. Texts"; "Automatic Ext. Texts")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    ApplicationArea = All;
                    trigger OnValidate();
                    begin
                        //EnableCostingControls;
                    end;
                }
                field("Product Group Code"; "Product Group Code")
                {
                    ApplicationArea = All;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = All;
                }
                field(Inventory; Inventory)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    ApplicationArea = All;
                }
                field("Item Disc. Group"; "Item Disc. Group")
                {
                    ApplicationArea = All;
                }
                field("Sales Unit of Measure"; "Sales Unit of Measure")
                {
                    ApplicationArea = All;
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Country/Region of Origin Code"; "Country/Region of Origin Code")
                {
                    ApplicationArea = All;
                }
                field("Net Weight"; "Net Weight")
                {
                    ApplicationArea = All;
                }
                field("Gross Weight"; "Gross Weight")
                {
                    ApplicationArea = All;
                }
            }
            group("E - Commerce")
            {
                //Caption = 'E - Commerce';
                group(BizTalk)
                {
                    //Caption = 'BizTalk';
                    field("Common Item No."; "Common Item No.")
                    {
                        ApplicationArea = All;
                    }
                    field("eShop Enabled"; "eShop Enabled")
                    {
                        ApplicationArea = All;
                    }
                    field("eShop Category ID"; "eShop Category ID")
                    {
                        ApplicationArea = All;
                    }
                    field("eShop ID"; "eShop ID")
                    {
                        ApplicationArea = All;
                    }
                    field("Manufacturer Code"; "Manufacturer Code")
                    {
                        ApplicationArea = All;
                    }
                    field("eShop Featured Item"; "eShop Featured Item")
                    {
                        ApplicationArea = All;
                    }
                    field("Shipping Allowed"; "eShop Shipping Allowed")
                    {
                        ApplicationArea = All;
                    }
                    field("Free Shipping"; "eShop Free Shipping")
                    {
                        ApplicationArea = All;
                    }
                    field("Additional Shipping Charge"; "eShop Additional Shipping Charge")
                    {
                        ApplicationArea = All;
                    }
                    field("Tax Exempt"; "eShop Tax Exempt")
                    {
                        ApplicationArea = All;
                    }
                    field("Tax Group Code"; "Tax Group Code")
                    {
                        ApplicationArea = All;
                        Importance = Promoted;
                    }
                    field("Picture Name 1"; "eShop Picture Name 1")
                    {
                        ApplicationArea = All;
                    }
                    field("Picture Name 2"; "eShop Picture Name 2")
                    {
                        ApplicationArea = All;
                    }
                    field("Picture Name 3"; "eShop Picture Name 3")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            part(ItemVariants; "eShop Item Variants")
            {
                Caption = 'ItemVariants';
                SubPageLink = "Item No." = FIELD ("No.");
            }
            part(RelatedItems; "eShop Item Substitutions")
            {
                SubPageLink = "No." = FIELD ("No.");
            }
            part(ItemUOM; "eShop Item Units of Measure")
            {
                SubPageLink = "Item No." = FIELD ("No."),
    "eShop Published" = CONST (true);
            }
            part(LongDescription; "Extended Text Lines")
            {
                SubPageLink = "Table Name" = CONST (Item),
    "No." = FIELD ("No.");
                Visible = true;
            }
            part(ItemAttributes; "eShop Item Attributes")
            {
                SubPageLink = "No." = FIELD ("No.");
            }
            part(KitItems; "eShop Kit Items")
            {
                SubPageLink = "Parent Item No." = FIELD ("No.");
            }
            part(ItemVariantOptions; "eShop Variations")
            {
                Caption = 'ItemVariantOptions';
                SubPageLink = "Item No." = FIELD ("No.");
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        EshopSetup.GET;
        "eShop Picture Name 1" := EshopSetup."Item Image Path" + "eShop Picture Name 1";
        "eShop Picture Name 2" := EshopSetup."Item Image Path" + "eShop Picture Name 2";
        "eShop Picture Name 3" := EshopSetup."Item Image Path" + "eShop Picture Name 3";
    end;

    var
        ESFunc: Codeunit 70009700;
        Price: Decimal;
        SalesPrice: Decimal;
        DiscountPercent: Decimal;
        EshopSetup: Record 70009700;
}

page 70009705 "eShop Customer"
{
    // version ES1.00WS

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

    PageType = ListPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field("No."; "No.")
            {
            }
            field(Name; Name)
            {
            }
            field("Name 2"; "Name 2")
            {
            }
            field(Address; Address)
            {
            }
            field("Address 2"; "Address 2")
            {
            }
            field(City; City)
            {
            }
            field(Contact; Contact)
            {
            }
            field("Phone No."; "Phone No.")
            {
            }
            field("Fax No."; "Fax No.")
            {
            }
            field("Customer Price Group"; "Customer Price Group")
            {
            }
            field("Payment Terms Code"; "Payment Terms Code")
            {
            }
            field("Salesperson Code"; "Salesperson Code")
            {
            }
            field("Shipment Method Code"; "Shipment Method Code")
            {
            }
            field("Shipping Agent Code"; "Shipping Agent Code")
            {
            }
            field("Customer Disc. Group"; "Customer Disc. Group")
            {
            }
            field("Country/Region Code"; "Country/Region Code")
            {
            }
            field("Balance (LCY)"; "Balance (LCY)")
            {
            }
            field("Post Code"; "Post Code")
            {
            }
            field(County; County)
            {

                trigger OnValidate();
                var
                    ESMETHODS: Codeunit "eShop Methods";
                    ESTaxstates: Record "eShop Taxable States";
                begin
                    //<<DES1.00
                    IF NOT GUIALLOWED THEN BEGIN
                        IF ESMETHODS.CheckTaxableStates(County) <> '' THEN BEGIN
                            "Tax Area Code" := ESMETHODS.CheckTaxableStates(County);
                            "Tax Liable" := TRUE;
                            ESTaxstates.SETRANGE("Tax Area Code", ESMETHODS.CheckTaxableStates(County));
                            IF ESTaxstates.FINDFIRST THEN BEGIN
                                IF ESTaxstates."Payment Terms Code" <> '' THEN
                                    "Payment Terms Code" := ESTaxstates."Payment Terms Code";
                                IF ESTaxstates."Payment Method Code" <> '' THEN
                                    "Payment Method Code" := ESTaxstates."Payment Method Code";
                            END;
                        END;
                    END;
                    //>>DES1.00
                end;
            }
            field("E-Mail"; "E-Mail")
            {
            }
            field("Home Page"; "Home Page")
            {
            }
            field("Tax Area Code"; "Tax Area Code")
            {
            }
            field("Tax Liable"; "Tax Liable")
            {
            }
            field("Tax Exemption No."; "Tax Exemption No.")
            {
            }
            field("B2C Customer"; "eShop B2C Customer")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF "E-Mail" = '' THEN BEGIN
            ESUSER.SETCURRENTKEY("No.");
            ESUSER.SETRANGE("No.", "No.");
            IF ESUSER.FINDFIRST THEN
                "E-Mail" := ESUSER.Email;
        END;
        IF County = '' THEN
            County := 'Other';
    end;

    var
        ESUSER: Record "eShop Users";
}

page 70009706 "eShop Item Attributes"
{
    // version ES1.00WS

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

    PageType = ListPart;
    SourceTable = "Item Attribute Value Mapping";
    SourceTableView = WHERE ("Table ID" = CONST (27));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "No.")
                {
                    ApplicationArea = All;
                    //Caption = 'Item No.';
                }
                field("Attribute Code"; Attribute)
                {
                    ApplicationArea = All;
                    //Caption = 'Attribute Code';
                }
                field("Attribute Name"; AttributeName)
                {
                    ApplicationArea = All;
                    //Caption = 'Attribute Name';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF AttributeRec.GET("Item Attribute ID") THEN
            Attribute := AttributeRec.Name;
        IF AttributeValueRec.GET("Item Attribute ID", "Item Attribute Value ID") THEN
            AttributeName := AttributeValueRec.Value;
    end;

    var
        Attribute: Code[100];
        AttributeName: Code[100];
        AttributeRec: Record 7500;
        AttributeValueRec: Record 7501;
}

page 70009707 "eShop Sales Quote"
{
    // version ES1.00WS

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

    Caption = 'eShop Sales Quote';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote));
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {

                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer Template Code"; "Sell-to Customer Template Code")
                {
                    Enabled = SelltoCustomerTemplateCodeEnab;
                    Importance = Additional;
                    ApplicationArea = All;

                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Sell-to City"; "Sell-to City")
                {
                }
                field("Sell-to County"; "Sell-to County")
                {
                    Caption = 'Sell-to State / ZIP Code';
                    ApplicationArea = All;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Order Date"; "Order Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                    ApplicationArea = All;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    ApplicationArea = All;
                }

                field("Salesperson Code"; "Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Campaign No."; "Campaign No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Status)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Purchase Order No."; "External Document No.")
                {
                    Caption = 'Purchase Order No.';
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "eShop Sales Quote Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD ("No.");
            }
            part(DiscountCodes; "eShop Discount Codes")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD ("No.");
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Enabled = "Bill-to Customer No.Enable";
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer Template Code"; "Bill-to Customer Template Code")
                {
                    Enabled = BilltoCustomerTemplateCodeEnab;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Bill-to City"; "Bill-to City")
                {
                    ApplicationArea = All;
                }
                field("Bill-to County"; "Bill-to County")
                {
                    Caption = 'State / ZIP Code';
                    ApplicationArea = All;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Bill-to Country/Region Code"; "Bill-to Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Due Date"; "Due Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    ApplicationArea = All;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    ApplicationArea = All;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    ApplicationArea = All;
                }
            }
            group(Shipping)
            {
                //Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Ship-to City"; "Ship-to City")
                {
                    ApplicationArea = All;
                }
                field("Ship-to County"; "Ship-to County")
                {
                    Caption = 'Ship-to State / ZIP Code';
                    ApplicationArea = All;

                    trigger OnValidate();
                    var
                        ESMethods: Codeunit "eShop Methods";
                    begin
                        //<<DES
                        /* IF NOT GUIALLOWED THEN BEGIN
                             IF ESMethods.CheckTaxableStates("Ship-to County") <> '' THEN BEGIN
                                 "Tax Area Code" := ESMethods.CheckTaxableStates("Ship-to County");
                                 "Tax Liable" := TRUE;
                                 CLEAR(SalesLine);
                                 SalesLine.SETRANGE("Document Type", "Document Type");
                                 SalesLine.SETRANGE("Document No.", "No.");
                                 SalesLine.SETFILTER("No.", '<>%', '');
                                 IF SalesLine.FINDFIRST THEN
                                     REPEAT
                                   SalesLine."Tax Area Code" := "Tax Area Code";
                                     SalesLine."Tax Liable" := TRUE;
                                     SalesLine.MODIFY;
                                     UNTIL SalesLine.NEXT = 0;
                             END ELSE BEGIN
                                 IF "Tax Area Code" <> '' THEN BEGIN
                                     "Tax Area Code" := '';
                                     CLEAR(SalesLine);
                                     SalesLine.SETRANGE("Document Type","Document Type");
                                     SalesLine.SETRANGE("Document No.","No.");
                                     SalesLine.SETFILTER("No.",'<>%','');
                                     IF SalesLine.FINDFIRST THEN
                                       REPEAT
                                         SalesLine."Tax Area Code" := '';
                                         SalesLine.MODIFY;
                                       UNTIL SalesLine.NEXT = 0;

                                 END;
                             END;
                         END;*/
                        //>>DES

                    end;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; "Location Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    ApplicationArea = All;
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';

                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;
                }
            }
            group("E-Commerce")
            {
                Caption = 'E-Commerce';

                field(Comments; Comments)
                {
                    ApplicationArea = All;
                    Caption = ' Comments';

                    trigger OnValidate();
                    var
                        EshopMethods: Codeunit "eShop Methods";
                    begin
                        IF Comments <> '' THEN
                            EshopMethods.InsertSalesComments(Rec, Comments);
                    end;
                }
                field("eShop Shipping Amount"; "eShop Shipping Amount")
                {
                    ApplicationArea = All;
                }
                field("eShop Tax Amount"; "eShop Tax Amount")
                {
                    ApplicationArea = All;
                }
                field("eShop Paid With"; "eShop Paid With")
                {
                    ApplicationArea = All;
                }
                field("eShop Transaction Reference"; "eShop Transaction Reference")
                {
                    ApplicationArea = All;
                }
                field("eShop Shipped Via"; "eShop Shipped Via")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1"; "eShop Coupon Code 1")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1 Amount"; "eShop Coupon Code 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2"; "eShop Coupon Code 2")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2 Amount"; "eShop Coupon Code 2 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 No."; "eShop Gift Card 1 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 Amount"; "eShop Gift Card 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 No."; "eShop Gift Card 2 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 Amount"; "eShop Gift Card 2 Amount")
                {
                    ApplicationArea = All;
                }
                field("Web CC"; "eShop Web CC")
                {
                    ApplicationArea = All;
                }
                field("CC Expiration Month"; "eShop CC Expiration Month")
                {
                    ApplicationArea = All;
                }
                field("CC Expiration Year"; "eShop CC Expiration Year")
                {
                    ApplicationArea = All;
                }
                field("CC Card Type"; "eShop CC Card Type")
                {
                    ApplicationArea = All;
                }
                field("CC Cvv2"; "eShop CC Cvv2")
                {
                    ApplicationArea = All;
                }
                field("Web Order"; "eShop Web Order")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("eShop Login Email"; "eShop Login Email")
                {
                    ApplicationArea = All;
                }
                field("Shopping Cart No."; "eShop Shopping Cart No.")
                {
                    ApplicationArea = All;
                }
                field("Web Order No."; "eShop Web Order No.")
                {
                    ApplicationArea = All;
                }
                field("Web CC Name"; "eShop Web CC Name")
                {
                    ApplicationArea = All;
                }
            }
            systempart(Part1905767507; Notes)
            {
                Visible = true;

            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin


    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        //CheckCreditMaxBeforeInsert;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin

    end;

    var
        [InDataSet]
        SalesHistoryBtnVisible: Boolean;
        [InDataSet]
        BillToCommentPictVisible: Boolean;
        [InDataSet]
        BillToCommentBtnVisible: Boolean;
        [InDataSet]
        SalesHistoryStnVisible: Boolean;
        [InDataSet]
        BilltoCustomerTemplateCodeEnab: Boolean;
        [InDataSet]
        SelltoCustomerTemplateCodeEnab: Boolean;
        [InDataSet]
        "Sell-to Customer No.Enable": Boolean;
        [InDataSet]
        "Bill-to Customer No.Enable": Boolean;
        Comments: Text[1024];
        SalesLine: Record 37;


}

page 70009708 "eShop Sales Quote Subform"
{
    // version ES1.00WS

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

    AutoSplitKey = true;
    //Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote));

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {

                    trigger OnValidate();
                    begin
                        NoOnAfterValidate;
                    end;
                }
                field("Variant Code"; VariantCode)
                {
                    //Caption = 'Variant Code';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        IF ItemVariant.GET("No.", COPYSTR(VariantCode, 1, 10)) THEN
                            "Variant Code" := COPYSTR(VariantCode, 1, 10);
                    end;
                }
                field("Variant Code1"; VariantCode)
                {
                    //Caption = '<Variant Code1>';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        IF ItemVariant.GET("No.", COPYSTR(VariantCode, 1, 10)) THEN
                            "Variant Code" := COPYSTR("Variant Code", 1, 10);
                    end;
                }
                field("Substitution Available"; "Substitution Available")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit Price"; "Unit Price")
                {
                    BlankZero = true;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Editable = true;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                }
                field("eShop Tax Amount"; "eShop Tax Amount")
                {
                    ApplicationArea = All;
                }
                field(ERPAttributesXML; ERPAttributesXML)
                {
                    ApplicationArea = All;
                    //Caption = 'ERPAttributesXML';

                    trigger OnValidate();
                    var
                        Strinstream: InStream;
                        OStream1: OutStream;
                    begin
                        CLEAR(OStream1);
                        "eShop AttributeXML".CREATEOUTSTREAM(OStream1);
                        ERPAttributesXML.WRITE(OStream1);
                        MODIFY(TRUE);
                    end;
                }
                field(ERPAttributesDescription; ERPAttributesDescription)
                {
                    ApplicationArea = All;
                    //Caption = 'ERPAttributesDescription';

                    trigger OnValidate();
                    var
                        Outstream1: OutStream;
                    begin
                        CLEAR(Outstream1);
                        "eShop AttributeDescription".CREATEOUTSTREAM(Outstream1);
                        ERPAttributesDescription.WRITE(Outstream1);
                        MODIFY;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean;
    var
        ReserveSalesLine: Codeunit 99000832;
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Type := xRec.Type;
    end;

    var
        ERPAttributesXML: BigText;
        ERPAttributesDescription: BigText;
        VariantCode: Code[20];
        ItemVariant: Record 5401;

    local procedure NoOnAfterValidate();
    begin
        /*IF(Type = Type::"Charge (Item)") AND("No." <> xRec."No.") AND
         (xRec."No." <> '')
      THEN
            CurrPage.SAVERECORD;*/
    end;
}

page 70009709 "eShop Sales Order"
{
    // version ES1.00WS

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

    //Caption = 'Sales Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE ("Document Type" = FILTER (Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    Importance = Promoted;
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                    Importance = Additional;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    Importance = Additional;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    Importance = Additional;
                }
                field("Sell-to City"; "Sell-to City")
                {
                }
                field("Sell-to County"; "Sell-to County")
                {
                    //Caption = 'Sell-to State / ZIP Code';
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Importance = Additional;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    Importance = Additional;
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Order Date"; "Order Date")
                {
                }
                field("Requested Delivery Date"; "Requested Delivery Date")
                {
                }
                field("Promised Delivery Date"; "Shipment Date")
                {
                    //Caption = 'Promised Delivery Date';
                    Importance = Additional;
                }
                field("Quote No."; "Quote No.")
                {
                    Importance = Additional;
                }
                field("Purchase Order No."; "External Document No.")
                {
                    //Caption = 'Purchase Order No.';
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("Campaign No."; "Campaign No.")
                {
                    Importance = Additional;
                }
                field(Status; Status)
                {
                    Importance = Promoted;
                }
            }
            part(SalesLines; "eShop Sales Order Subform")
            {
                SubPageLink = "Document No." = FIELD ("No."),
    "No." = FILTER (<> ''),
    Type = CONST (Item);
            }
            part(DiscountCodes; "eShop Discount Codes")
            {
                SubPageLink = "Document No." = FIELD ("Quote No.");
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Importance = Promoted;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                    Importance = Additional;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                    Importance = Additional;
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                    Importance = Additional;
                }
                field("Bill-to City"; "Bill-to City")
                {
                }
                field("Bill-to County"; "Bill-to County")
                {
                    //Caption = 'State / ZIP Code';
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Importance = Additional;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    Importance = Additional;
                }
                field("Bill-to Country/Region Code"; "Bill-to Country/Region Code")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Due Date"; "Due Date")
                {
                    Importance = Promoted;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                }
                field("Payment Method Code"; PaymentMethod)
                {
                    //Caption = 'Payment Method Code';
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Importance = Promoted;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Importance = Promoted;
                }
            }
            group(Shipping)
            {
                //Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    Importance = Promoted;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Importance = Additional;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    Importance = Additional;
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to County"; "Ship-to County")
                {
                    //Caption = 'Ship-to State / ZIP Code';
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Importance = Promoted;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    Importance = Additional;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                }
                field("Sell-to Country/Region Code"; "Sell-to Country/Region Code")
                {
                }
                field("Ship-to UPS Zone"; "Ship-to UPS Zone")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    Importance = Additional;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    Importance = Additional;
                }
                field("Shipping Time"; "Shipping Time")
                {
                }
                field("Package Tracking No."; TrackNumbers)
                {
                    //Caption = 'Package Tracking No.';
                    Importance = Additional;
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Importance = Promoted;
                }
                field("Shipping Advice"; "Shipping Advice")
                {
                    Importance = Promoted;
                }
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;
                }
                field("Tax Amount"; TaxAmount)
                {
                    //Caption = 'Tax Amount';
                }
                field("Invoice Discount Amount"; InvoiceDiscount)
                {
                    //Caption = 'Invoice Discount Amount';
                }
                field("Sub Total"; Amount)
                {
                    //Caption = 'Sub Total';
                }
                field("Order Total"; OrderTotal)
                {
                    //Caption = 'Order Total';
                }
            }
            group("E-Commerce")
            {
                //Caption = 'E-Commerce';
                field("Shipment Method Code"; "eShop Shipped Via")
                {
                    ApplicationArea = All;
                    //Caption = 'Shipment Method Code';
                }
                field("Web Order"; "eShop Web Order")
                {
                    ApplicationArea = All;
                }
                field("eShop Login Email"; "eShop Login Email")
                {
                    ApplicationArea = All;
                }
                field("Shopping Cart No."; "eShop Shopping Cart No.")
                {
                    ApplicationArea = All;
                }
                field("Web Order No."; "eShop Web Order No.")
                {
                    ApplicationArea = All;
                }
                field("Shipping Amount"; "eShop Shipping Amount")
                {
                    ApplicationArea = All;
                    //Caption = 'Shipping Amount';
                }
                field("eShop Paid With"; "eShop Paid With")
                {
                    ApplicationArea = All;
                }
                field("eShop Transaction Reference"; "eShop Transaction Reference")
                {
                    ApplicationArea = All;
                }
                field("eShop Shipped Via"; "eShop Shipped Via")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1"; "eShop Coupon Code 1")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1 Amount"; "eShop Coupon Code 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2"; "eShop Coupon Code 2")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2 Amount"; "eShop Coupon Code 2 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 No."; "eShop Gift Card 1 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 Amount"; "eShop Gift Card 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 No."; "eShop Gift Card 2 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 Amount"; "eShop Gift Card 2 Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        CLEAR(OrderTotal);
        CLEAR(TaxAmount);
        CLEAR(InvoiceDiscount);

        IF Status = Status::Released THEN BEGIN
            CALCFIELDS("Amount Including VAT", Amount);
            OrderTotal := "Amount Including VAT";
            TaxAmount := "Amount Including VAT" - Amount;
            InvoiceDiscount := "eShop Discount Amount";
        END ELSE BEGIN
            WebFunctions.GetTotals(1, "No.", SubTotal, InvoiceDiscount, TaxAmount, ShippingAmount, TotalAmount);
            OrderTotal := TotalAmount;// + "eShop Shipping Amount";

        END;
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean;
    begin
        //CheckCreditMaxBeforeInsert;
    end;

    trigger OnOpenPage();
    begin
        SETRANGE("Date Filter", 0D, WORKDATE - 1);
    end;

    var
        WebFunctions: Codeunit 70009700;
        SubTotal: Decimal;
        InvoiceDiscount: Decimal;
        ShippingAmount: Decimal;
        TotalAmount: Decimal;
        WebshopMethods: Codeunit "eShop Methods";
        OrderTotal: Decimal;
        TaxAmount: Decimal;
        PaymentMethod: Text[30];
        TrackNumbers: Text[1000];
}

page 70009710 "eShop Sales Order Subform"
{
    // version ES1.00WS

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

    AutoSplitKey = true;
    //Caption = 'Lines';
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Sales Line";
    SourceTableView = WHERE ("Document Type" = FILTER (Order));

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Package Tracking No."; "Package Tracking No.")
                {
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit Price"; "Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Quantity Shipped"; "Quantity Shipped")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Promised Delivery Date"; "Promised Delivery Date")
                {
                    Visible = false;
                }
                field("Shipment Date"; "Shipment Date")
                {
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                    Visible = false;
                }
                field(ERPAttributesXML; ERPAttributesXML)
                {
                    ApplicationArea = All;
                    //Caption = 'ERPAttributesXML';
                }
                field(ERPAttributesDescription; ERPAttributesDescription)
                {
                    ApplicationArea = All;
                    //Caption = 'ERPAttributesDescription';

                    trigger OnDrillDown();
                    var
                        Outstream1: OutStream;
                    begin
                        CLEAR(Outstream1);
                        Rec."eShop AttributeDescription".CREATEOUTSTREAM(Outstream1);
                        ERPAttributesDescription.WRITE(Outstream1);
                        MODIFY;
                    end;

                    trigger OnValidate();
                    var
                        Strinstream: InStream;
                        OutStream: OutStream;
                    begin
                        "eShop AttributeDescription".CREATEOUTSTREAM(OutStream);
                        ERPAttributesDescription.WRITE(OutStream);
                        MODIFY(TRUE);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean;
    var
        ReserveSalesLine: Codeunit 99000832;
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        Type := xRec.Type;
    end;

    var
        Text001: Label 'You can not use the Explode BOM function because a prepayment of the sales order has been invoiced.';
        ERPAttributesXML: BigText;
        ERPAttributesDescription: BigText;
}

page 70009711 "eShop Posted Sales Invoice"
{
    // version ES1.00WS

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

    //Caption = 'Posted Sales Invoice';
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Invoice Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Sell-to Contact No."; "Sell-to Contact No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name"; "Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Sell-to Address"; "Sell-to Address")
                {
                    Editable = false;
                }
                field("Sell-to Address 2"; "Sell-to Address 2")
                {
                    Editable = false;
                }
                field("Sell-to City"; "Sell-to City")
                {
                    Editable = false;
                }
                field("Sell-to County"; "Sell-to County")
                {
                    //Caption = 'Sell-to State / ZIP Code';
                    Editable = false;
                }
                field("Sell-to Post Code"; "Sell-to Post Code")
                {
                    Editable = false;
                }
                field("Sell-to Contact"; "Sell-to Contact")
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                }
                field("Quote No."; "Quote No.")
                {
                }
                field("Order No."; "Order No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Pre-Assigned No."; "Pre-Assigned No.")
                {
                    Editable = false;
                }
                field("Purchase Order No."; "External Document No.")
                {
                    //Caption = 'Purchase Order No.';
                    Editable = false;
                    Importance = Promoted;
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                    Editable = false;
                }
                field("Package Tracking No."; TrackNumbers)
                {
                    //Caption = 'Package Tracking No.';
                }
                field("Tax Amount"; "eShop Tax Amount")
                {
                }
                field("Invoice Discount Amount"; "eShop Discount Amount")
                {
                    //Caption = 'Invoice Discount Amount';
                }
                field("Sub Total"; Amount)
                {
                    //Caption = 'Sub Total';
                }
                field("Order Total"; "Amount Including VAT")
                {
                    //Caption = 'Order Total';
                }
            }
            part(SalesInvLines; "eShop Post Sales Inv Subform")
            {
                SubPageLink = "Document No." = FIELD ("No."),
    Type = CONST (Item);
            }
            part(DiscountCodes; "eShop Discount Codes")
            {
                SubPageLink = "Document No." = FIELD ("Quote No.");
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Bill-to Customer No."; "Bill-to Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Bill-to Contact No."; "Bill-to Contact No.")
                {
                    Editable = false;
                }
                field("Bill-to Name"; "Bill-to Name")
                {
                    Editable = false;
                }
                field("Bill-to Address"; "Bill-to Address")
                {
                    Editable = false;
                }
                field("Bill-to Address 2"; "Bill-to Address 2")
                {
                    Editable = false;
                }
                field("Bill-to City"; "Bill-to City")
                {
                    Editable = false;
                }
                field("Bill-to County"; "Bill-to County")
                {
                    //Caption = 'State / ZIP Code';
                    Editable = false;
                }
                field("Bill-to Post Code"; "Bill-to Post Code")
                {
                    Editable = false;
                }
                field("Bill-to Contact"; "Bill-to Contact")
                {
                    Editable = false;
                }
                field("Bill-to Country/Region Code"; "Bill-to Country/Region Code")
                {
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Method Code"; PaymentMethod)
                {
                    //Caption = 'Payment Method Code';
                }
                field("Due Date"; "Due Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    Editable = false;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Editable = false;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Editable = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Editable = false;
                }
            }
            group(Shipping)
            {
                //Caption = 'Shipping';
                field("Ship-to Code"; "Ship-to Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Ship-to Name"; "Ship-to Name")
                {
                    Editable = false;
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Editable = false;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    Editable = false;
                }
                field("Ship-to City"; "Ship-to City")
                {
                    Editable = false;
                }
                field("Ship-to County"; "Ship-to County")
                {
                    //Caption = 'Ship-to State / ZIP Code';
                    Editable = false;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    Editable = false;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                }
                field("Ship-to UPS Zone"; "Ship-to UPS Zone")
                {
                    Editable = false;
                }
                field("Location Code"; "Location Code")
                {
                    Editable = false;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    Editable = false;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                }
                field("Shipment Date"; "Shipment Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;
                }
            }
            group("E-Commerce")
            {
                //Caption = 'E-Commerce';
                field("Web Order"; "eShop Web Order")
                {
                    ApplicationArea = All;
                }
                field("eShop Login Email"; "eShop Login Email")
                {
                    ApplicationArea = All;
                }
                field("Shopping Cart No."; "eShop Shopping Cart No.")
                {
                    ApplicationArea = All;
                }
                field("Web Order No."; "eShop Web Order No.")
                {
                    ApplicationArea = All;
                }
                field("Shipping Amount"; "eShop Shipping Amount")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1"; "eShop Coupon Code 1")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 1 Amount"; "eShop Coupon Code 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2"; "eShop Coupon Code 2")
                {
                    ApplicationArea = All;
                }
                field("Coupon Code 2 Amount"; "eShop Coupon Code 2 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 No."; "eShop Gift Card 1 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 1 Amount"; "eShop Gift Card 1 Amount")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 No."; "eShop Gift Card 2 No.")
                {
                    ApplicationArea = All;
                }
                field("Gift Card 2 Amount"; "eShop Gift Card 2 Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        CALCFIELDS("Amount Including VAT", Amount);
        "eShop Tax Amount" := "Amount Including VAT" - Amount;

        CLEAR(PaymentMethod);
        IF "eShop Paid With" <> '' THEN
            PaymentMethod := "eShop Paid With"
        ELSE
            PaymentMethod := "Payment Method Code";
    end;

    var
        SalesInvHeader: Record 112;
        PaymentMethod: Text[30];
        I: Integer;
        TrackNumbers: Text[1000];
}

page 70009712 "eShop Post Sales Inv Subform"
{
    // version ES1.00WS

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

    AutoSplitKey = true;
    //Caption = 'Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Sales Invoice Line";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Package Tracking No."; "Package Tracking No.")
                {
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit Price"; "Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009713 "eShop Customer Transactions"
{
    // version ES1.00WS

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

    Caption = 'Customer Ledger Entries';
    DataCaptionFields = "Customer No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Cust. Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("Posting Date"; "Posting Date")
                {
                    Editable = false;
                }
                field("Customer No."; "Customer No.")
                {
                }
                field("Document Type"; "Document Type")
                {
                    Editable = false;
                }
                field("Document No."; "Document No.")
                {
                    Editable = false;
                }
                field(Description; Description)
                {
                    Editable = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    Editable = false;
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                    Editable = false;
                }
                field("Due Date"; "Due Date")
                {
                }
                field(Open; Open)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009714 "eShop Discount Codes"
{
    // version ES1.00WS

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

    AutoSplitKey = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "eShop Discount Codes";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote));
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("Code"; Code)
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009715 "eShop Posted Discount Codes"
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

    AutoSplitKey = true;
    //Caption = 'eShop Discount Codes';
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "eShop Discount Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("Code"; Code)
                {
                    ApplicationArea = All;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009716 "eShop Setup Card"
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

    PageType = Card;
    SourceTable = "eShop Setup";
    UsageCategory = Documents;
    ApplicationArea = All;
    Caption = 'eShop Setup Card';


    layout
    {
        area(content)
        {
            group(General)
            {
                field("eShop URL"; "eShop URL")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop URL';
                    ExtendedDatatype = URL;
                }
                field("eShop Admin URL"; "eShop Admin URL")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Admin URL';
                    ExtendedDatatype = URL;
                }
                field("eShop Web Service URL"; "eShop Web Service URL")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Web Service URL';
                    ExtendedDatatype = URL;
                    Visible = false;
                }
                field("D365 Web Service URL"; "Nav Web Service URL")
                {
                    ApplicationArea = All;
                    ExtendedDatatype = URL;
                    Caption = 'Web Service URL';
                }

            }
            
            group(Numbering)
            {
                field("User No. Series"; "User No. Series")
                {
                    ApplicationArea = All;
                }
                field("Category No. Series"; "Category No. Series")
                {
                    ApplicationArea = All;
                }
                field("Web Customer No. Series"; "Web Customer No. Series")
                {
                    ApplicationArea = All;
                }
                field("Quote No. Series"; "Quote No. Series")
                {
                    ApplicationArea = All;
                }
            }
            group(License)
            {

                field("License Key"; "License Key")
                {
                    ApplicationArea = All;
                }
                field(EnterLicenseKey; EnterLicenseKey)
                {
                    ApplicationArea = All;
                    Visible = false;
                    //Caption = 'Enter License Key';
                }
                field("Company Name"; COMPANYNAME)
                {
                    ApplicationArea = All;
                    Visible = false;
                    //Caption = 'Company Name';
                }
                field("ERP License No"; ERPLicenseNo)
                {
                    ApplicationArea = All;
                    //Caption = 'ERP License No';
                    Editable = false;
                    Visible = false;
                }
            }
            group(Defaults)
            {
                field("Gift Card GL No."; "Gift Card GL No.")
                {
                    ApplicationArea = All;
                }
                field("Web Coupon Code GL No."; "Web Coupon Code GL No.")
                {
                    ApplicationArea = All;
                }
                field("Web Shipping GL No."; "Web Shipping GL No.")
                {
                    ApplicationArea = All;
                }
                field("Web Tax GL No."; "Web Tax GL No.")
                {
                    ApplicationArea = All;
                }
                field("Web Customer Bus Posting Group"; "Web Customer Bus Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Web Customer Posting group"; "Web Customer Posting group")
                {
                    ApplicationArea = All;
                }
                field("Web Customer Code"; "Web Customer Code")
                {
                    ApplicationArea = All;
                }
                field("eShop Customer Template"; "eShop Customer Template")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Customer Template';
                }
                field("Default Inventory Location"; "Default Inventory Location")
                {
                    ApplicationArea = All;
                }
                field("Available Inventory"; "Available Inventory")
                {
                    ApplicationArea = All;
                }
                field("Report Path"; "Report Path")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Send Shipment Mail"; "Send Shipment Mail")
                {
                    ApplicationArea = All;
                }
                field("Item Image Path"; "Item Image Path")
                {
                    ApplicationArea = All;
                }
            }
        }

    }

    actions
    {
        area(processing)
        {
            ////Caption = 'Functions';
            action("Enter License Key")
            {
                //Caption = 'Enter License Key';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    IF ("License Key" = '') OR ("License Key" = xRec."License Key") THEN
                        EnterLicense(EnterLicenseKey)
                end;
            }

            action("Run Default Setup")
            {
                ApplicationArea = All;
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Run Default Setup';
                trigger OnAction()
                var
                    EMethods: Codeunit "eShop Methods";
                begin
                    EMethods.eShopDefaultSetup();
                end;
            }

            action("Web Service Login Info")
            {
                ApplicationArea = All;
                Image = Info;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    User: Record User;
                begin
                    user.SetRange("User Name", UserId());
                    Page.run(9807, user);
                end;
            }
            action("One Click Install")
            {
                ApplicationArea = All;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
            action("One Click Import")
            {
                ApplicationArea = All;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
            }
            action("eShop Categories")
            {
                ApplicationArea = All;
                Image = Category;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "eShop Categories List";
            }
            action("Items List")
            {
                ApplicationArea = All;
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "eShop Item List";
            }
            action("eShop Users")
            {
                ApplicationArea = All;
                Image = User;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "eShop Users";
            }
            action("Web Services")
            {
                ApplicationArea = All;
                Image = ServiceSetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Web Services";
                Visible = false;
            }
            action("eShop Reports")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "eShop Reports";
            }
            action("Coupons")
            {
                ApplicationArea = All;
                Image = Discount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "eShop Coupon Setup List";
            }
             
        }

    }

    trigger OnAfterGetRecord();
    begin
        UserName := UserId();

    end;

    var
        ERPLicenseNo: Text[250];
        //LicenseNo : Record 2000000040;
        EnterLicenseKey: Text[30];
        UserName: Code[50];
        WebServiceKey: Boolean;
        IdentityManagement: Codeunit "Identity Management";

}

page 70009717 "eShop Categories List"
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

    PageType = List;
    SourceTable = "eShop Categories";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Category List';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category ID"; "Category ID")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field("Parent Category ID"; "Parent Category ID")
                {
                    ApplicationArea = All;
                }
                field("eShop Enabled"; "eShop Enabled")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Enabled';
                }
                field("eShop ID"; "eShop ID")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop ID';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("eShop")
            {
                //Caption = 'eShop';
                action(Edit)
                {
                    ApplicationArea = All;
                    //Caption = 'Edit';
                    Image = Edit;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    RunObject = Page "eShop Categories List";
                }
                action(Publish)
                {
                    ApplicationArea = All;
                    //Caption = 'Publish';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CLEAR(EshopService);
                        // EshopService.InsertCategories(FORMAT("Category ID"), TRUE);
                        EshopService.PubishMasters("Category ID", 'insertcategorybyerpid', true);

                    end;
                }
                action(Update)
                {
                    ApplicationArea = All;
                    //Caption = 'Update';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        CLEAR(EshopService);
                        // EshopService.UpdateCategories(FORMAT("Category ID"), TRUE);
                        EshopService.PubishMasters("Category ID", 'updatecategorybyerpid', true);
                    end;
                }
                action("Preview Category")
                {
                    ApplicationArea = All;
                    //Caption = 'Preview Category';
                    Image = view;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                }
                action("Edit Category")
                {
                    ApplicationArea = All;
                    //Caption = 'Edit Category';
                    Image = Edit;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                }
                action("Tree View")
                {
                    ApplicationArea = All;
                    //Caption = 'Tree View';
                    Image = ExplodeBOM;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    
                }

            }
        }
    }

    var
        EshopSetup: Record 70009700;
        EshopService: Codeunit 70009703;
        EshopBrowser: Page 70009723;
}

page 70009718 "eShop Taxable States"
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

    PageType = List;
    SourceTable = "eShop Taxable States";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Taxable States';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("State Code"; "State Code")
                {
                    ApplicationArea = All;
                }
                field("State Name"; "State Name")
                {
                    ApplicationArea = All;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    ApplicationArea = All;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    ApplicationArea = All;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Template Code"; "Customer Template Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009719 "eShop Attributes"
{
    // version ES1.00

    PageType = List;
    SourceTable = "eShop Attributes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attribute Code"; "Attribute Code")
                {
                    ApplicationArea = All;
                }
                field("Attribute Name"; "Attribute Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009721 "eShop Activities"
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

    //Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "eShop Cue";

    layout
    {
        area(content)
        {
            cuegroup("eShop")
            {
                //Caption = 'eShop Orders';
                field("B2C Customers"; "B2C Customers")
                {
                    ApplicationArea = All;
                }
                field("eShop Orders"; "eShop Orders")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Orders';
                    DrillDownPageID = "Sales Order List";
                }
                field("eShop Quotes"; "eShop Quotes")
                {
                    ApplicationArea = All;
                    //Caption = 'eShop Quotes';
                    DrillDownPageID = "Sales Quotes";
                }
            }
            cuegroup("For Release")
            {
                //Caption = 'For Release';
                field("Sales Quotes - Open"; "Sales Quotes - Open")
                {
                    DrillDownPageID = "Sales Quotes";
                }
                field("Sales Orders - Open"; "Sales Orders - Open")
                {
                    DrillDownPageID = "Sales Order List";
                }
            }
            cuegroup("Sales Orders Released Not Shipped")
            {
                //Caption = 'Sales Orders Released Not Shipped';
                field("Ready to Ship"; "Ready to Ship")
                {
                    DrillDownPageID = "Sales Order List";
                }
                field("Partially Shipped"; "Partially Shipped")
                {
                    DrillDownPageID = "Sales Order List";
                }
                field(Delayed; Delayed)
                {
                    DrillDownPageID = "Sales Order List";
                }
            }
            cuegroup(Returns)
            {
                //Caption = 'Returns';
                field("Sales Return Orders - All"; "Sales Return Orders - All")
                {
                    DrillDownPageID = "Sales Return Order List";
                }
                field("Sales Credit Memos - All"; "Sales Credit Memos - All")
                {
                    DrillDownPageID = "Sales Credit Memos";
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RESET;
        IF NOT GET THEN BEGIN
            INIT;
            INSERT;
        END;

        SETRANGE("Date Filter", 0D, WORKDATE - 1);
        SETFILTER("Date Filter2", '>=%1', WORKDATE);
    end;
}

page 70009722 "eShop Browser AddIn"
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

    PageType = CardPart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            ////Caption = 'Browser AddIn Sample Page';
            group(Group1000000000)
            {
            }
            fixed(Group1000000003)
            {
                field("<URL>"; URL1)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        URL1 := 'http://localhost:8083/Admin';
        //GetURL(URL);
    end;

    var
        URL1: Text[1000];
        Text: Label 'http://krussell.dyndns.org/ViewStat.aspx?StatValue=99057e0b-443d-401e-9f3e-8aa956c0bd46&StartedFromClient=';
        Text1: Label 'Yes&ShowQuota=&mStatValue1=&mStatValue2=&mStatValue3=&mStatValue4=&mStatValue5=&mStatValue6=';
        Text2: Label '&StatEndDate=12/18/2011&Frequency=WeeklyShowingWeekly&NumOfIntervals=13&Anim=TrendLines=False';

    procedure GetURL(UrlLink: Text[250]);
    begin
        //UrlLink := 'http://localhost:91/Admin';
        URL1 := UrlLink;
    end;
}

page 70009723 "eShop Browser"
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

    PageType = CardPart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            ////Caption = 'Browser AddIn Sample Page';
            fixed(Group1000000000)
            {
                field("<URL>"; URL1)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit();
    begin
        //URL := 'http://localhost:91/Admin';
        //GetURL(URL1);
    end;

    var
        URL1: Text[1000];
        Text: Label 'http://krussell.dyndns.org/ViewStat.aspx?StatValue=99057e0b-443d-401e-9f3e-8aa956c0bd46&StartedFromClient=';
        Text1: Label 'Yes&ShowQuota=&mStatValue1=&mStatValue2=&mStatValue3=&mStatValue4=&mStatValue5=&mStatValue6=';
        Text2: Label '&StatEndDate=12/18/2011&Frequency=WeeklyShowingWeekly&NumOfIntervals=13&Anim=TrendLines=False';

    procedure GetURL(UrlLink: Text[250]);
    begin
        //UrlLink := 'http://localhost:91/Admin';
        URL1 := UrlLink;
    end;
}

page 70009724 "eShop Coupon Setup List"
{
    // version ES1.00

    // [!@#] MS WO12278 10.16.12 SCSKM
    //       - New Page

    DelayedInsert = true;
    PageType = List;
    SourceTable = "eSHop Coupon Setup";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Coupon Setup List';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Coupon Code"; "Coupon Code")
                {
                    ApplicationArea = All;
                }
                field("Coupon Description"; "Coupon Description")
                {
                    ApplicationArea = All;
                }
                field("Coupon Type"; "Coupon Type")
                {
                    ApplicationArea = All;
                }
                field("Sales Type"; "Sales Type")
                {
                    ApplicationArea = All;
                }
                field("Sales Code"; "Sales Code")
                {
                    ApplicationArea = All;
                }
                field("Qualifier Type"; "Qualifier Type")
                {
                    ApplicationArea = All;
                }
                field("Qualifier Code"; "Qualifier Code")
                {
                    ApplicationArea = All;
                }
                field("Min. Qty."; "Min. Qty.")
                {
                    ApplicationArea = All;
                }
                field("Promo Type"; "Promo Type")
                {
                    ApplicationArea = All;
                }
                field("Promo Code"; "Promo Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field("Discount %"; "Discount %")
                {
                    ApplicationArea = All;
                }
                field("Discount $"; "Discount $")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        DiscountEditable: Boolean;
}

page 70009725 "eShop All in One Publish"
{
    // version ES1.00

    PageType = CardPart;

    layout
    {
        area(content)
        {
            ////Caption = 'Selection Page'; Removed DESSG
            group(Group1000000014)
            {
                group(Group1000000020)
                {
                    group(Group1000000021)
                    {
                    }
                    field(InsertProducts; InsertProducts)
                    {
                        ApplicationArea = All;
                        //Caption = 'InsertProducts';
                    }
                    field("InsertProductsID.""No."""; InsertProductsID."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                }
                group(Group1000000022)
                {
                    field(UpdateProducts; UpdateProducts)
                    {
                        ApplicationArea = All;
                        //Caption = 'UpdateProducts';
                    }
                    field("UpdateProductsID.""No."""; UpdateProductsID."No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item;
                    }
                }
                field(InsertCategories; InsertCategories)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertCategories';
                }
                field("InsertCategoriesID.""Category ID"""; InsertCategoriesID."Category ID")
                {
                    ApplicationArea = All;
                    TableRelation = "eShop Categories";
                }
                field(UpdateCategories; UpdateCategories)
                {
                    ApplicationArea = All;
                    //Caption = 'UpdateCategories';
                }
                field("UpdateCategoriesID.""Category ID"""; UpdateCategoriesID."Category ID")
                {
                    ApplicationArea = All;
                    TableRelation = "eShop Categories";
                }
                field(InsertUser; InsertUser)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertUser';
                }
                field("InsertUserID.UserID"; InsertUserID.UserID)
                {
                    ApplicationArea = All;
                    TableRelation = "eShop Users";
                }
                field(UpdateUser; UpdateUser)
                {
                    ApplicationArea = All;
                    //Caption = 'UpdateUser';
                }
                field("UpdateUserID.UserID"; UpdateUserID.UserID)
                {
                    ApplicationArea = All;
                }
                field(InsertAllCategories; InsertAllCategories)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertAllCategories';
                }
                field(InsertAllProducts; InsertAllProducts)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertAllProducts';
                }
                field(InsertAllUsers; InsertAllUsers)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertAllUsers';
                }
                field(InsertManufacturer; InsertManufacturer)
                {
                    ApplicationArea = All;
                    //Caption = 'InsertManufacturer';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            ////Caption = 'Actions'; Removed DESSG
            action(Process)
            {
                ApplicationArea = All;
                //Caption = 'Process';

                trigger OnAction();
                begin
                    IF InsertProducts AND (InsertProductsID."No." = '') THEN
                        ERROR(Text001);
                    IF UpdateProducts AND (UpdateProductsID."No." = '') THEN
                        ERROR(Text001);
                    IF InsertCategories AND (InsertCategoriesID."Category ID" = '') THEN
                        ERROR(Text002);
                    IF UpdateCategories AND (InsertCategoriesID."Category ID" = '') THEN
                        ERROR(Text002);
                    IF InsertUser AND (InsertUserID.UserID = '') THEN
                        ERROR(Text003);
                    IF UpdateUser AND (UpdateUserID.UserID <> '') THEN
                        ERROR(Text003);


                    IF InsertProducts THEN
                        EShopDotnetService.InsertProducts(Item, FALSE);

                    IF UpdateProducts THEN
                        EShopDotnetService.UpdateProducts(Item, FALSE);

                    IF InsertCategories THEN
                        EShopDotnetService.InsertCategories(FORMAT(InsertCategoriesID."Category ID"), TRUE);
                    IF UpdateCategories THEN
                        EShopDotnetService.UpdateCategories(FORMAT(UpdateCategoriesID."Category ID"), TRUE);
                    IF InsertUser THEN
                        EShopDotnetService.InsertUser(InsertUserID.UserID, FALSE);
                    IF UpdateUser THEN
                        EShopDotnetService.UpdateUser(UpdateUserID.UserID, FALSE);
                    IF InsertAllCategories THEN
                        EShopDotnetService.InsertAllCategories;
                    IF InsertAllProducts THEN
                        EShopDotnetService.InsertAllProducts;
                    IF InsertAllUsers THEN
                        EShopDotnetService.InsertAllUsers;
                    IF InsertManufacturer THEN
                        EShopDotnetService.InsertManufacturer;
                end;
            }
        }
    }

    var
        InsertProducts: Boolean;
        UpdateProducts: Boolean;
        InsertCategories: Boolean;
        UpdateCategories: Boolean;
        InsertUser: Boolean;
        UpdateUser: Boolean;
        InsertAllCategories: Boolean;
        InsertAllProducts: Boolean;
        InsertAllUsers: Boolean;
        InsertManufacturer: Boolean;
        InsertProductsID: Record 27;
        UpdateProductsID: Record 27;
        InsertCategoriesID: Record 70009702;
        UpdateCategoriesID: Record 70009702;
        InsertUserID: Record "eShop Users";
        UpdateUserID: Record "eShop Users";
        EShopDotnetService: Codeunit 70009703;
        Text001: Label 'Please Select Product from the list';
        Text002: Label 'Please Select Category from the list';
        Text003: Label 'Please Select User from the list';
        Item: Record 27;
}

page 70009726 "eShop Reports"
{
    // version ES1.00WS

    PageType = List;
    SourceTable = "eShop Reports";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Reports';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Report ID"; "Report ID")
                {
                    ApplicationArea = All;
                }
                field("Report Name"; "Report Name")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = All;
                }
                field("User Type"; "User Type")
                {
                    ApplicationArea = All;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = All;
                }
                field("Report Link"; "Report Link")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; "Customer No.")
                {
                    ApplicationArea = All;
                }
                field("SalesPerson Code"; "SalesPerson Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009727 "eShop Purchase Order"
{
    // version ES1.00

    //Caption = 'Purchase Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote | Order));

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BuyfromVendorNoOnAfterValidate;
                    end;
                }
                field("Buy-from Contact No."; "Buy-from Contact No.")
                {
                }
                field("Buy-from Vendor Name"; "Buy-from Vendor Name")
                {
                }
                field("Buy-from Address"; "Buy-from Address")
                {
                    Importance = Additional;
                }
                field("Buy-from Address 2"; "Buy-from Address 2")
                {
                    Importance = Additional;
                }
                field("Buy-from City"; "Buy-from City")
                {
                }
                field("Buy-from County"; "Buy-from County")
                {
                    //Caption = 'Buy-from State / ZIP Code';
                }
                field("Buy-from Post Code"; "Buy-from Post Code")
                {
                    Importance = Additional;
                }
                field("Buy-from Contact"; "Buy-from Contact")
                {
                    Importance = Additional;
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                    Importance = Additional;
                }
                field("Posting Description"; "Posting Description")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Order Date"; "Order Date")
                {
                    Importance = Promoted;
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Quote No."; "Quote No.")
                {
                    Importance = Additional;
                }
                field("Vendor Order No."; "Vendor Order No.")
                {
                }
                field("Vendor Shipment No."; "Vendor Shipment No.")
                {
                }
                field("Vendor Invoice No."; "Vendor Invoice No.")
                {
                }
                field("Order Address Code"; "Order Address Code")
                {
                    Importance = Additional;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        PurchaserCodeOnAfterValidate;
                    end;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    Importance = Additional;
                }
                field(Comments; Comments)
                {

                    trigger OnValidate();
                    var
                        EshopMethods: Codeunit "eShop Methods";
                    begin
                        IF Comments <> '' THEN
                            EshopMethods.InsertPurchaseComments(Rec, Comments);
                    end;
                }
                field(Status; Status)
                {
                    Importance = Promoted;
                }
            }
            part(PurchLines; "Eshop Purchase Order Subform")
            {
                SubPageLink = "Document No." = FIELD ("No.");
            }
            part(DiscountCodes; "eShop Discount Codes")
            {
                SubPageLink = "Document No." = FIELD ("Quote No.");
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        PaytoVendorNoOnAfterValidate;
                    end;
                }
                field("Pay-to Contact No."; "Pay-to Contact No.")
                {
                    Importance = Additional;
                }
                field("Pay-to Name"; "Pay-to Name")
                {
                }
                field("Pay-to Address"; "Pay-to Address")
                {
                    Importance = Additional;
                }
                field("Pay-to Address 2"; "Pay-to Address 2")
                {
                    Importance = Additional;
                }
                field("Pay-to City"; "Pay-to City")
                {
                }
                field("Pay-to County"; "Pay-to County")
                {
                    //Caption = 'State / ZIP Code';
                }
                field("Pay-to Post Code"; "Pay-to Post Code")
                {
                    Importance = Additional;
                }
                field("Pay-to Contact"; "Pay-to Contact")
                {
                    Importance = Additional;
                }
                field("Pay-to Country/Region Code"; "Pay-to Country/Region Code")
                {
                }
                field("IRS 1099 Code"; "IRS 1099 Code")
                {
                    Importance = Promoted;
                }
                field("On Hold"; "On Hold")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                }
                field("Due Date"; "Due Date")
                {
                    Importance = Promoted;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Importance = Additional;
                }
                field("Tax Liable"; "Tax Liable")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field("Tax Exemption No."; "Tax Exemption No.")
                {
                }
                field("Invoice Discount Value"; "Invoice Discount Value")
                {
                }
                field("Sub Total"; Amount)
                {
                    //Caption = 'Sub Total';
                }
                field("Order Total"; "Amount Including VAT")
                {
                    //Caption = 'Order Total';
                }
                field("Provincial Tax Area Code"; "Provincial Tax Area Code")
                {
                }
            }
            group(Shipping)
            {
                //Caption = 'Shipping';
                field("Ship-to Name"; "Ship-to Name")
                {
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Importance = Additional;
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    Importance = Additional;
                }
                field("Ship-to City"; "Ship-to City")
                {
                }
                field("Ship-to County"; "Ship-to County")
                {
                    //Caption = 'Ship-to State / ZIP Code';
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Importance = Additional;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                }
                field(Field1000000002; '')
                {
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                }
                field("Ship-to UPS Zone"; "Ship-to UPS Zone")
                {
                }
                field("Location Code"; "Location Code")
                {
                    Importance = Promoted;
                }
                field("Inbound Whse. Handling Time"; "Inbound Whse. Handling Time")
                {
                    Importance = Additional;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Importance = Additional;
                }
                field("Requested Receipt Date"; "Requested Receipt Date")
                {
                }
                field("Promised Receipt Date"; "Promised Receipt Date")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                    Importance = Promoted;
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Ship-to Code"; "Ship-to Code")
                {
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        CurrencyCodeOnAfterValidate;
                    end;
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Transaction Specification"; "Transaction Specification")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Entry Point"; "Entry Point")
                {
                }
                field("Area"; Area)
                {
                }
            }
            group(Prepayment)
            {
                //Caption = 'Prepayment';
                field("Prepayment %"; "Prepayment %")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment"; "Compress Prepayment")
                {
                }
                field("Prepmt. Payment Terms Code"; "Prepmt. Payment Terms Code")
                {
                }
                field("Prepayment Due Date"; "Prepayment Due Date")
                {
                    Importance = Promoted;
                }
                field("Prepmt. Payment Discount %"; "Prepmt. Payment Discount %")
                {
                }
                field("Prepmt. Pmt. Discount Date"; "Prepmt. Pmt. Discount Date")
                {
                }
                field("Vendor Cr. Memo No."; "Vendor Cr. Memo No.")
                {
                }
                field("Prepmt. Include Tax"; "Prepmt. Include Tax")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        /*CLEAR(OrderTotal);
        CLEAR(TaxAmount);
        CLEAR(InvoiceDiscount);
        //"Tax Amount" := "Amount Including VAT" - Amount;
        //"Discount Amount" := Amount * ("Invoice Discount Value"/100);
        //WebFunctions.GetTotals(1,"No.",SubTotal,InvoiceDiscount,TaxAmount,ShippingAmount,TotalAmount);

        //"Amount Including VAT" := WebshopMethods.GetTotalOrderAmountIncTax(Rec);
        IF  Status = Status::Released THEN  BEGIN
          CALCFIELDS("Amount Including VAT","Discount Amount",Amount);
          OrderTotal := "Amount Including VAT";
          TaxAmount := "Amount Including VAT" - Amount;
          InvoiceDiscount := "Discount Amount";
        END ELSE BEGIN
          WebFunctions.GetTotalsPurch(1,"No.",SubTotal,InvoiceDiscount,TaxAmount,ShippingAmount,TotalAmount);
          OrderTotal := 100;// TotalAmount ;//+ "eShop Shipping Amount";
        END;
         */
        OrderTotal := 100;
        TaxAmount := 12;
        InvoiceDiscount := 2;

    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    var
        Text001: Label 'There are non posted Prepayment Amounts on %1 %2.';
        Text002: Label 'There are unpaid Prepayment Invoices related to %1 %2. Do you wish to continue?';
        OrderTotal: Decimal;
        TaxAmount: Decimal;
        InvoiceDiscount: Decimal;
        WebFunctions: Codeunit 70009700;
        SubTotal: Decimal;
        ShippingAmount: Decimal;
        TotalAmount: Decimal;
        Comments: Text[1024];

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure UpdateInfoPanel();
    var
        DifferBuyFromPayTo: Boolean;
    begin
        DifferBuyFromPayTo := "Buy-from Vendor No." <> "Pay-to Vendor No.";
        /*PurchHistoryBtn1Visible := PurchInfoPaneMgmt.DocExist(Rec,"Buy-from Vendor No.");
        IF DifferBuyFromPayTo THEN
          PurchHistoryBtnVisible := PurchInfoPaneMgmt.DocExist(Rec,"Pay-to Vendor No.")
          */

    end;

    local procedure BuyfromVendorNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PurchaserCodeOnAfterValidate();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PaytoVendorNoOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure CurrencyCodeOnAfterValidate();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure Prepayment37OnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

page 70009728 "eShop Vendor Card"
{
    // version ES1.00

    // [!@#] SCS1.2 SCS MODS 10/10/2011 SCS mattr - SCS Standard Mods
    //   -Added Default G/L Account and RemitToName
    //     //POPN  Add Pop-Up Notes field to form
    //         Add menu item to Vendor Button
    //         Add a PopUp entry area from the Vendor Card
    //         Add global variables
    // //POPN5.01  Added the User ID Insert on POPup note entry
    // //POPN6  Changed form on Pop-Up Note menu choice

    //Caption = 'Vendor Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Name; Name)
                {
                    Importance = Promoted;
                }
                field(Address; Address)
                {
                }
                field("Address 2"; "Address 2")
                {
                }
                field(City; City)
                {
                }
                field(County; County)
                {
                    //Caption = 'State / ZIP Code';
                }
                field("Post Code"; "Post Code")
                {
                    Importance = Promoted;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Primary Contact No."; "Primary Contact No.")
                {
                }
                field(Contact; Contact)
                {
                    Importance = Promoted;
                }
                field("Search Name"; "Search Name")
                {
                }
                field("Balance (LCY)"; "Balance (LCY)")
                {

                    trigger OnDrillDown();
                    var
                        VendLedgEntry: Record 25;
                        DtldVendLedgEntry: Record 380;
                    begin
                        DtldVendLedgEntry.SETRANGE("Vendor No.", "No.");
                        COPYFILTER("Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        COPYFILTER("Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        COPYFILTER("Currency Filter", DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                }
                field(Blocked; Blocked)
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field(Field1100768000; '')
                {
                }
                field(Field1000000000; '')
                {
                }
                field("Remit-to Name"; '')
                {
                    //Caption = 'Remit-to Name';
                }
            }
            group(Communication)
            {
                //Caption = 'Communication';
                field(Field44; '')
                {
                    Importance = Promoted;
                }
                field("Fax No."; "Fax No.")
                {
                }
                field("E-Mail"; "E-Mail")
                {
                    Importance = Promoted;
                }
                field("Home Page"; "Home Page")
                {
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                }
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {
                }
                field("Tax Liable"; "Tax Liable")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    Importance = Promoted;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                }
                field("Vendor Posting Group"; "Vendor Posting Group")
                {
                    Importance = Promoted;
                }
                field("Invoice Disc. Code"; "Invoice Disc. Code")
                {
                }
                field("Prices Including VAT"; "Prices Including VAT")
                {
                }
                field("Prepayment %"; "Prepayment %")
                {
                }
            }
            group(Payments)
            {
                //Caption = 'Payments';
                field("Application Method"; "Application Method")
                {
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                    Importance = Promoted;
                }
                field(Priority; Priority)
                {
                }
                field("IRS 1099 Code"; "IRS 1099 Code")
                {
                    Importance = Promoted;
                }
                field("Federal ID No."; "Federal ID No.")
                {
                    Importance = Promoted;
                }
                field("Tax Identification Type"; "Tax Identification Type")
                {
                }
                field("VAT Registration No."; "VAT Registration No.")
                {
                }
                field("Our Account No."; "Our Account No.")
                {
                }
                field("Block Payment Tolerance"; "Block Payment Tolerance")
                {
                }
            }
            group(Receiving)
            {
                //Caption = 'Receiving';
                field("Location Code"; "Location Code")
                {
                    Importance = Promoted;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    Importance = Promoted;
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Importance = Promoted;
                }
                field("Base Calendar Code"; "Base Calendar Code")
                {
                    DrillDown = false;
                }
                field("Customized Calendar"; '')
                {
                    //Caption = 'Customized Calendar';
                    Editable = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        TESTFIELD("Base Calendar Code");
                    end;
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;
                }
                field("Language Code"; "Language Code")
                {
                }
                field("Bank Communication"; "Bank Communication")
                {
                }
                field("Check Date Format"; "Check Date Format")
                {
                }
                field("Check Date Separator"; "Check Date Separator")
                {
                }
                field(Field58; '')
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin


    end;

    trigger OnFindRecord(Which: Text): Boolean;
    var
        RecordFound: Boolean;
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin

    end;

    trigger OnOpenPage();
    var
        MapMgt: Codeunit 802;
    begin
    end;


}

page 70009729 "eShop Vendor list"
{
    // version ES1.00

    // [!@#] SCS1.2 SCS MODS 10/10/2011 SCS mattr - SCS Standard Mods
    //   - Showed the following fields:
    //     Balance, Balance (LCY), State, City, Pay-To Vendor No.
    // 
    //     //POPN6.2  Add menu items to Vendor Button
    //         Add global variables

    //Caption = 'Vendor List';
    CardPageID = "Vendor Card";
    Editable = false;
    PageType = List;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("No."; "No.")
                {
                }
                field(Name; Name)
                {
                }
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field(City; City)
                {
                }
                field(County; County)
                {
                }
                field("Post Code"; "Post Code")
                {
                    Visible = false;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    Visible = false;
                }
                field("Phone No."; "Phone No.")
                {
                }
                field("Fax No."; "Fax No.")
                {
                    Visible = false;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Visible = false;
                }
                field(Contact; Contact)
                {
                }
                field(Balance; Balance)
                {
                    Visible = false;
                }
                field("Balance (LCY)"; "Balance (LCY)")
                {
                    Visible = false;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    Visible = false;
                }
                field("Vendor Posting Group"; "Vendor Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group"; "Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Visible = false;
                }
                field("Fin. Charge Terms Code"; "Fin. Charge Terms Code")
                {
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    Visible = false;
                }
                field("Language Code"; "Language Code")
                {
                    Visible = false;
                }
                field("Search Name"; "Search Name")
                {
                }
                field(Blocked; Blocked)
                {
                    Visible = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Visible = false;
                }
                field("Application Method"; "Application Method")
                {
                    Visible = false;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    Visible = false;
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Base Calendar Code"; "Base Calendar Code")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009730 "eShop Posted Purchase Invoice"
{
    // version ES1.00

    //Caption = 'Posted Purchase Invoice';
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purch. Inv. Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Buy-from Contact No."; "Buy-from Contact No.")
                {
                    Editable = false;
                }
                field("Buy-from Vendor Name"; "Buy-from Vendor Name")
                {
                    Editable = false;
                }
                field("Buy-from Address"; "Buy-from Address")
                {
                    Editable = false;
                }
                field("Buy-from Address 2"; "Buy-from Address 2")
                {
                    Editable = false;
                }
                field("Buy-from City"; "Buy-from City")
                {
                    Editable = false;
                }
                field("Buy-from County"; "Buy-from County")
                {
                    //Caption = 'Buy-from State / ZIP Code';
                    Editable = false;
                }
                field("Buy-from Post Code"; "Buy-from Post Code")
                {
                    Editable = false;
                }
                field("Buy-from Contact"; "Buy-from Contact")
                {
                    Editable = false;
                }
                field("No. Printed"; "No. Printed")
                {
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Document Date"; "Document Date")
                {
                    Editable = false;
                }
                field("Quote No."; "Quote No.")
                {
                }
                field("Order No."; "Order No.")
                {
                    Editable = false;
                }
                field("Pre-Assigned No."; "Pre-Assigned No.")
                {
                    Editable = false;
                }
                field("Vendor Order No."; "Vendor Order No.")
                {
                    Editable = false;
                }
                field("Vendor Invoice No."; "Vendor Invoice No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Order Address Code"; "Order Address Code")
                {
                    Editable = false;
                }
                field("Purchaser Code"; "Purchaser Code")
                {
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Editable = false;
                }
            }
            part(DiscountCodes; "eShop Discount Codes")
            {
                SubPageLink = "Document No." = FIELD ("Quote No.");
            }
            part(PurchInvLines; "Posted Purch. Invoice Subform")
            {
                SubPageLink = "Document No." = FIELD ("No.");
            }
            group(Invoicing)
            {
                //Caption = 'Invoicing';
                field("Pay-to Vendor No."; "Pay-to Vendor No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Pay-to Contact No."; "Pay-to Contact No.")
                {
                    Editable = false;
                }
                field("Pay-to Name"; "Pay-to Name")
                {
                    Editable = false;
                }
                field("Pay-to Address"; "Pay-to Address")
                {
                    Editable = false;
                }
                field("Pay-to Address 2"; "Pay-to Address 2")
                {
                    Editable = false;
                }
                field("Pay-to Country/Region Code"; "Pay-to Country/Region Code")
                {
                }
                field("Pay-to City"; "Pay-to City")
                {
                    Editable = false;
                }
                field("Pay-to County"; "Pay-to County")
                {
                    //Caption = 'State / ZIP Code';
                    Editable = false;
                }
                field("Pay-to Post Code"; "Pay-to Post Code")
                {
                    Editable = false;
                }
                field("Pay-to Contact"; "Pay-to Contact")
                {
                    Editable = false;
                }
                field("IRS 1099 Code"; "IRS 1099 Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Due Date"; "Due Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                    Editable = false;
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Editable = false;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Editable = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Editable = false;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                }
                field("Tax Exemption No."; "Tax Exemption No.")
                {
                    Editable = false;
                }
                field("Order Total"; "Amount Including VAT")
                {
                }
                field("Invoice Discount Amount"; "Invoice Discount Amount")
                {
                    //Caption = 'Invoice Discount Amount';
                }
                field("Provincial Tax Area Code"; "Provincial Tax Area Code")
                {
                }
                field("Tax Amount"; "Tax Amount")
                {
                }
            }
            group(Shipping)
            {
                //Caption = 'Shipping';
                field("Ship-to Name"; "Ship-to Name")
                {
                    Editable = false;
                }
                field("Ship-to Address"; "Ship-to Address")
                {
                    Editable = false;
                }
                field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                {
                }
                field("Ship-to Address 2"; "Ship-to Address 2")
                {
                    Editable = false;
                }
                field("Ship-to City"; "Ship-to City")
                {
                    Editable = false;
                }
                field("Ship-to County"; "Ship-to County")
                {
                    //Caption = 'Ship-to State / ZIP Code';
                    Editable = false;
                }
                field("Ship-to Post Code"; "Ship-to Post Code")
                {
                    Editable = false;
                }
                field("Ship-to Contact"; "Ship-to Contact")
                {
                    Editable = false;
                }
                field("Location Code"; "Location Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                    Editable = false;
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;
                }
            }
        }
    }

    actions
    {
    }

    var
        PurchInvHeader: Record 122;
        "Tax Amount": Decimal;
}

page 70009731 "eShop Posted Purch. Inv Line"
{
    // version ES1.00

    AutoSplitKey = true;
    //Caption = 'Lines';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Purch. Inv. Line";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field("Cross-Reference No."; "Cross-Reference No.")
                {
                    Visible = false;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Visible = false;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Return Reason Code"; "Return Reason Code")
                {
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    Visible = false;
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    BlankZero = true;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price (LCY)"; "Unit Price (LCY)")
                {
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Visible = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Visible = false;
                }
                field("Provincial Tax Area Code"; "Provincial Tax Area Code")
                {
                    Visible = false;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field("Use Tax"; "Use Tax")
                {
                    Visible = false;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Job No."; "Job No.")
                {
                    Visible = false;
                }
                field("Insurance No."; "Insurance No.")
                {
                    Visible = false;
                }
                field("Budgeted FA No."; "Budgeted FA No.")
                {
                    Visible = false;
                }
                field("FA Posting Type"; "FA Posting Type")
                {
                    Visible = false;
                }
                field("Depr. until FA Posting Date"; "Depr. until FA Posting Date")
                {
                    Visible = false;
                }
                field("Depreciation Book Code"; "Depreciation Book Code")
                {
                    Visible = false;
                }
                field("Depr. Acquisition Cost"; "Depr. Acquisition Cost")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("IRS 1099 Liable"; "IRS 1099 Liable")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                //Caption = '&Line';
                action(Dimensions)
                {
                    ApplicationArea = All;
                    //Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #138. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchInvLines.FORM.*/
                        _ShowDimensions;

                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    //Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #138. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchInvLines.FORM.*/
                        _ShowLineComments;

                    end;
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = All;
                    //Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #138. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchInvLines.FORM.*/
                        _ShowItemTrackingLines;

                    end;
                }
                action("Item Receipt &Lines")
                {
                    ApplicationArea = All;
                    //Caption = 'Item Receipt &Lines';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #138. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchInvLines.FORM.*/
                        _ShowItemReceiptLines;

                    end;
                }
            }
        }
    }

    procedure _ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    procedure ShowDimensions();
    begin
        Rec.ShowDimensions;
    end;

    procedure _ShowItemTrackingLines();
    begin
        Rec.ShowItemTrackingLines;
    end;

    procedure ShowItemTrackingLines();
    begin
        Rec.ShowItemTrackingLines;
    end;

    procedure _ShowItemReceiptLines();
    begin
        IF NOT (Type IN [Type::Item, Type::"Charge (Item)"]) THEN
            TESTFIELD(Type);
        Rec.ShowItemReceiptLines;
    end;

    procedure ShowItemReceiptLines();
    begin
        IF NOT (Type IN [Type::Item, Type::"Charge (Item)"]) THEN
            TESTFIELD(Type);
        Rec.ShowItemReceiptLines;
    end;

    procedure _ShowLineComments();
    begin
        Rec.ShowLineComments;
    end;

    procedure ShowLineComments();
    begin
        Rec.ShowLineComments;
    end;
}

page 70009732 "eShop Variations"
{
    // version ES1.00WS

    PageType = ListPart;
    SourceTable = "eShop Variations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Attribute Code"; "Attribute Code")
                {
                    ApplicationArea = All;
                }
                field("Attribute Type"; "Attribute Type")
                {
                    ApplicationArea = All;
                }
                field("Attribute Value"; "Attribute Value")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009733 "eShop Kit Items"
{
    // version ES1.00WS

    PageType = ListPart;
    SourceTable = "BOM Component";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Variant Code"; "Variant Code")
                {
                }
                field("Quantity per"; "Quantity per")
                {
                }
                field("Option Group"; "eShop Option Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009734 "eShop Purchase Order Subform"
{
    // version ES1.00

    AutoSplitKey = true;
    //Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote | Order));

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {

                    trigger OnValidate();
                    begin
                        NoOnAfterValidate;
                        TypeChosen := Type <> Type::" "
                    end;
                }
                field("No."; "No.")
                {
                    ShowMandatory = TypeChosen;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field("Cross-Reference No."; "Cross-Reference No.")
                {
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                        NoOnAfterValidate;
                    end;

                    trigger OnValidate();
                    begin
                        CrossReferenceNoOnAfterValidat;
                        NoOnAfterValidate;
                    end;
                }
                field("IC Partner Code"; "IC Partner Code")
                {
                    Visible = false;
                }
                field("IC Partner Ref. Type"; "IC Partner Ref. Type")
                {
                    Visible = false;
                }
                field("IC Partner Reference"; "IC Partner Reference")
                {
                    Visible = false;
                }
                field("Variant Code"; "Variant Code")
                {
                    Visible = false;
                }
                field("Line No."; "Line No.")
                {
                }
                field(Nonstock; Nonstock)
                {
                    Visible = false;
                }
                field("GST/HST"; "GST/HST")
                {
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field(Description; Description)
                {
                }
                field("Drop Shipment"; "Drop Shipment")
                {
                    Visible = false;
                }
                field("Return Reason Code"; "Return Reason Code")
                {
                    Visible = false;
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Bin Code"; "Bin Code")
                {
                    Visible = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                    ShowMandatory = TypeChosen;
                }
                field("Reserved Quantity"; "Reserved Quantity")
                {
                    BlankZero = true;
                }
                field("Job Remaining Qty."; "Job Remaining Qty.")
                {
                    BlankZero = true;
                    Visible = false;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    Visible = false;
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    BlankZero = true;
                    ShowMandatory = TypeChosen;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price (LCY)"; "Unit Price (LCY)")
                {
                    BlankZero = true;
                    Visible = false;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Visible = false;
                }
                field("Provincial Tax Area Code"; "Provincial Tax Area Code")
                {
                    Visible = false;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                }
                field("Use Tax"; "Use Tax")
                {
                    Visible = false;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    Visible = false;
                }
                field("Prepayment %"; "Prepayment %")
                {
                    Visible = false;
                }
                field("Prepmt. Line Amount"; "Prepmt. Line Amount")
                {
                    Visible = false;
                }
                field("Prepmt. Amt. Inv."; "Prepmt. Amt. Inv.")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Inv. Discount Amount"; "Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Receive"; "Qty. to Receive")
                {
                    BlankZero = true;
                }
                field("Quantity Received"; "Quantity Received")
                {
                    BlankZero = true;
                }
                field("Qty. to Invoice"; "Qty. to Invoice")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced"; "Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Prepmt Amt to Deduct"; "Prepmt Amt to Deduct")
                {
                    Visible = false;
                }
                field("Prepmt Amt Deducted"; "Prepmt Amt Deducted")
                {
                    Visible = false;
                }
                field("Allow Item Charge Assignment"; "Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Qty. to Assign"; "Qty. to Assign")
                {
                    BlankZero = true;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Qty. Assigned"; "Qty. Assigned")
                {
                    BlankZero = true;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Job No."; "Job No.")
                {
                    Visible = false;
                }
                field("Job Task No."; "Job Task No.")
                {
                    Visible = false;
                }
                field("Job Planning Line No."; "Job Planning Line No.")
                {
                    Visible = false;
                }
                field("Job Line Type"; "Job Line Type")
                {
                    Visible = false;
                }
                field("Job Unit Price"; "Job Unit Price")
                {
                    Visible = false;
                }
                field("Job Line Amount"; "Job Line Amount")
                {
                    Visible = false;
                }
                field("Job Line Discount Amount"; "Job Line Discount Amount")
                {
                    Visible = false;
                }
                field("Job Line Discount %"; "Job Line Discount %")
                {
                    Visible = false;
                }
                field("Job Total Price"; "Job Total Price")
                {
                    Visible = false;
                }
                field("Job Unit Price (LCY)"; "Job Unit Price (LCY)")
                {
                    Visible = false;
                }
                field("Job Total Price (LCY)"; "Job Total Price (LCY)")
                {
                    Visible = false;
                }
                field("Job Line Amount (LCY)"; "Job Line Amount (LCY)")
                {
                    Visible = false;
                }
                field("Job Line Disc. Amount (LCY)"; "Job Line Disc. Amount (LCY)")
                {
                    Visible = false;
                }
                field("Requested Receipt Date"; "Requested Receipt Date")
                {
                    Visible = false;
                }
                field("Promised Receipt Date"; "Promised Receipt Date")
                {
                    Visible = false;
                }
                field("Planned Receipt Date"; "Planned Receipt Date")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
                field("Order Date"; "Order Date")
                {
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Planning Flexibility"; "Planning Flexibility")
                {
                    Visible = false;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    Visible = false;
                }
                field("Prod. Order Line No."; "Prod. Order Line No.")
                {
                    Visible = false;
                }
                field("Operation No."; "Operation No.")
                {
                    Visible = false;
                }
                field("Work Center No."; "Work Center No.")
                {
                    Visible = false;
                }
                field(Finished; Finished)
                {
                    Visible = false;
                }
                field("Whse. Outstanding Qty. (Base)"; "Whse. Outstanding Qty. (Base)")
                {
                    Visible = false;
                }
                field("Inbound Whse. Handling Time"; "Inbound Whse. Handling Time")
                {
                    Visible = false;
                }
                field("Blanket Order No."; "Blanket Order No.")
                {
                    Visible = false;
                }
                field("Blanket Order Line No."; "Blanket Order Line No.")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    //CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    //CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    //CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    //CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    //CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    //CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("IRS 1099 Liable"; "IRS 1099 Liable")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                //Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    //Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        ApplicationArea = All;
                        //Caption = 'Event';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = All;
                        //Caption = 'Period';
                        Image = Period;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = All;
                        //Caption = 'Variant';
                        Image = ItemVariant;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData 14 = R;
                        ApplicationArea = All;
                        //Caption = 'Location';
                        Image = Warehouse;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = All;
                        //Caption = 'BOM Level';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    AccessByPermission = TableData 27 = R;
                    ApplicationArea = All;
                    //Caption = 'Reservation Entries';
                    Image = ReservationLedger;

                    trigger OnAction();
                    begin
                        ShowReservationEntries(TRUE);
                    end;
                }
                action("Item Tracking Lines")
                {
                    ApplicationArea = All;
                    //Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines;
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    ApplicationArea = All;
                    //Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    //Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
                action(ItemChargeAssignment)
                {
                    AccessByPermission = TableData 5800 = R;
                    ApplicationArea = All;
                    //Caption = 'Item Charge &Assignment';

                    trigger OnAction();
                    begin
                        ShowItemChargeAssgnt;
                    end;
                }
            }
            group("F&unctions")
            {
                //Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    AccessByPermission = TableData 90 = R;
                    ApplicationArea = All;
                    //Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    AccessByPermission = TableData 279 = R;
                    ApplicationArea = All;
                    //Caption = 'Insert &Ext. Text';
                    Image = Text;

                    trigger OnAction();
                    begin
                        InsertExtendedText(TRUE);
                    end;
                }
                action(Reserve)
                {
                    ApplicationArea = All;
                    //Caption = '&Reserve';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction();
                    begin
                        FIND;
                        ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    ApplicationArea = All;
                    //Caption = 'Order &Tracking';
                    Image = OrderTracking;

                    trigger OnAction();
                    begin
                        ShowTracking;
                    end;
                }
            }
            group("O&rder")
            {
                //Caption = 'O&rder';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    //Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action("Sales &Order")
                    {
                        AccessByPermission = TableData 110 = R;
                        ApplicationArea = All;
                        //Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenSalesOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    //Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action1901038504)
                    {
                        AccessByPermission = TableData 110 = R;
                        ApplicationArea = All;
                        //Caption = 'Sales &Order';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenSpecOrderSalesOrderForm;
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        TypeChosen := Type <> Type::" ";
    end;

    trigger OnDeleteRecord(): Boolean;
    var
        ReservePurchLine: Codeunit 99000834;
    begin
        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
            COMMIT;
            IF NOT ReservePurchLine.DeleteLineConfirm(Rec) THEN
                EXIT(FALSE);
            ReservePurchLine.DeleteLine(Rec);
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    var
        PurchHeader: Record 38;
        TransferExtendedText: Codeunit 378;
        ItemAvailFormsMgt: Codeunit 353;
        Text000: Label 'Unable to run this function while in View mode.';
        PurchPriceCalcMgt: Codeunit 7010;
        Text001: Label 'You cannot use the Explode BOM function because a prepayment of the purchase order has been invoiced.';
        ShortcutDimCode: ARRAY[8] OF Code[20];
        UpdateAllowedVar: Boolean;
        TypeChosen: Boolean;

    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)", Rec);
    end;

    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Calc.Discount", Rec);
    end;

    procedure ExplodeBOM();
    begin
        IF "Prepmt. Amt. Inv." <> 0 THEN
            ERROR(Text001);
        CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM", Rec);
    end;

    procedure OpenSalesOrderForm();
    var
        SalesHeader: Record 36;
        SalesOrder: Page 42;
    begin
        SalesHeader.SETRANGE("No.", "Sales Order No.");
        SalesOrder.SETTABLEVIEW(SalesHeader);
        SalesOrder.EDITABLE := FALSE;
        SalesOrder.RUN;
    end;

    procedure InsertExtendedText(Unconditionally: Boolean);
    begin
        IF TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertPurchExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;

    procedure ShowTracking();
    var
        TrackingForm: Page 99000822;
    begin
        TrackingForm.SetPurchLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    procedure OpenSpecOrderSalesOrderForm();
    var
        SalesHeader: Record 36;
        SalesOrder: Page 42;
    begin
        SalesHeader.SETRANGE("No.", "Special Order Sales No.");
        SalesOrder.SETTABLEVIEW(SalesHeader);
        SalesOrder.EDITABLE := FALSE;
        SalesOrder.RUN;
    end;

    procedure UpdateForm(SetSaveRecord: Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    procedure SetUpdateAllowed(UpdateAllowed: Boolean);
    begin
        UpdateAllowedVar := UpdateAllowed;
    end;

    procedure UpdateAllowed(): Boolean;
    begin
        IF UpdateAllowedVar = FALSE THEN BEGIN
            MESSAGE(Text000);
            EXIT(FALSE);
        END;
        EXIT(TRUE);
    end;

    procedure ShowPrices();
    begin
        PurchHeader.GET("Document Type", "Document No.");
        CLEAR(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLinePrice(PurchHeader, Rec);
    end;

    procedure ShowLineDisc();
    begin
        PurchHeader.GET("Document Type", "Document No.");
        CLEAR(PurchPriceCalcMgt);
        PurchPriceCalcMgt.GetPurchLineLineDisc(PurchHeader, Rec);
    end;

    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
         (xRec."No." <> '')
      THEN
            CurrPage.SAVERECORD;
    end;

    local procedure CrossReferenceNoOnAfterValidat();
    begin
        InsertExtendedText(FALSE);
    end;
}

page 70009735 "eShop Attribute Type"
{
    // version ES1.00

    PageType = List;
    SourceTable = "eShop Attribute Type";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attribute Types"; "Attribute Types")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009736 "eShop Attribute Values"
{
    // version ES1.00

    PageType = List;
    SourceTable = "eShop Attribute Value";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Attribute Type"; "Attribute Type")
                {
                    ApplicationArea = All;
                }
                field("Attribute Value"; "Attribute Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009737 "eShop Item Variants"
{
    // version ES1.00WS

    // //<< DES1.00
    //   eShop Fields added.
    // //>> DES1.00

    //Caption = 'Item Variants';
    DataCaptionFields = "Item No.";
    PageType = ListPart;
    PromotedActionCategories = 'Item Variants';
    //PromotedActionCategoriesML=ENU='"Item Variants"';
    SourceTable = "Item Variant";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("Item No."; "Item No.")
                {
                    Visible = false;
                }
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
                field("Description 2"; "Description 2")
                {
                    Visible = false;
                }
                field("Attribute 1"; "eShop Attribute 1")
                {
                    ApplicationArea = All;
                }
                field("Attribute 2"; "eShop Attribute 2")
                {
                    ApplicationArea = All;
                }
                field("Attribute 3"; "eShop Attribute 3")
                {
                    ApplicationArea = All;
                }
                field(Block; "eShop Block")
                {
                    ApplicationArea = All;
                }
                field("Attribute 4"; "eShop Attribute 4")
                {
                    ApplicationArea = All;
                }
                field("Attribute 5"; "eShop Attribute 5")
                {
                    ApplicationArea = All;
                }
                field("Attribute 6"; "eShop Attribute 6")
                {
                    ApplicationArea = All;
                }
                field("Web Item No."; "eShop Web Item No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

page 70009738 "eShop Item Units of Measure"
{
    // version ES1.00WS

    // 
    // //<< DES1.00
    //   eShop Fields added.
    // //>> DES1.00

    //Caption = 'Item Units of Measure';
    DataCaptionFields = "Item No.";
    PageType = ListPart;
    SourceTable = "Item Unit of Measure";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("Item No."; "Item No.")
                {
                    Visible = false;
                }
                field("Code"; Code)
                {
                    StyleExpr = StyleName;
                }
                field("Qty. per Unit of Measure"; "Qty. per Unit of Measure")
                {
                    StyleExpr = StyleName;
                }
                field(Height; Height)
                {
                    Visible = false;
                }
                field(Width; Width)
                {
                    Visible = false;
                }
                field(Length; Length)
                {
                    Visible = false;
                }
                field(Cubage; Cubage)
                {
                    Visible = false;
                }
                field(Weight; Weight)
                {
                    Visible = false;
                }
                field("eShop Published"; "eShop Published")
                {
                    ApplicationArea = All;
                }
            }
            group("Current Base Unit of Measure")
            {
                //Caption = 'Current Base Unit of Measure';
                field(ItemUnitOfMeasure; ItemBaseUOM)
                {
                    //Caption = 'Base Unit of Measure';
                    Lookup = true;
                    TableRelation = "Unit of Measure".Code;

                    trigger OnValidate();
                    begin
                        Item.VALIDATE("Base Unit of Measure", ItemBaseUOM);
                        Item.MODIFY(TRUE);
                        CurrPage.UPDATE;
                    end;
                }
            }
        }

    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        SetStyle;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        SetStyle;
    end;

    trigger OnOpenPage();
    begin
        IF Item.GET("Item No.") THEN;
        ItemBaseUOM := Item."Base Unit of Measure";
    end;

    var
        Item: Record 27;
        ItemBaseUOM: Code[10];
        StyleName: Text;

    local procedure SetStyle();
    begin
        IF Code = ItemBaseUOM THEN
            StyleName := 'Strong'
        ELSE
            StyleName := '';
    end;
}

page 70009739 "eShop Ship-to Address"
{
    // version ES1.00WS

    //Caption = 'eShop Ship-to Address';
    DataCaptionExpression = Caption;
    PageType = Card;
    SourceTable = "Ship-to Address";

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("Code"; Code)
                {
                }
                field(Name; Name)
                {
                }
                field(Address; Address)
                {
                }
                field("Address 2"; "Address 2")
                {
                }
                field(City; City)
                {
                }
                field(County; County)
                {
                    //Caption = 'State / ZIP Code';

                    trigger OnValidate();
                    begin
                        //<<DES
                        IF (ESMethods.CheckTaxableStates(County) <> '') AND (NOT GUIALLOWED) THEN BEGIN
                            "Tax Area Code" := ESMethods.CheckTaxableStates(County);
                            "Tax Liable" := TRUE;
                        END;
                        //>>DES
                    end;
                }
                field("Post Code"; "Post Code")
                {
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                }
                field("Phone No."; "Phone No.")
                {
                }
                field(Contact; Contact)
                {
                }
                field("Location Code"; "Location Code")
                {
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                }
                field("Shipping Agent Code"; "Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code"; "Shipping Agent Service Code")
                {
                }
                field("Service Zone Code"; "Service Zone Code")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field("Tax Liable"; "Tax Liable")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                }
            }
            group(Communication)
            {
                //Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                }
                field("Fax No."; "Fax No.")
                {
                }
                field("E-Mail"; "E-Mail")
                {
                }
                field("Home Page"; "Home Page")
                {
                }
                field("Customer No."; "Customer No.")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Address")
            {
                //Caption = '&Address';
                Image = Addresses;
                separator(Separator49)
                {
                }
                action("Online Map")
                {
                    //Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction();
                    begin
                        DisplayMap;
                    end;
                }
            }
        }
    }

    trigger OnInit();
    begin
        MapPointVisible := TRUE;
    end;

    trigger OnOpenPage();
    var
        MapMgt: Codeunit 802;
    begin
        IF NOT MapMgt.TestSetup THEN
            MapPointVisible := FALSE;
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        ESMethods: Codeunit "eShop Methods";
}

page 70009745 "eShop Wizard"
{
    // version ES1.00

    Caption = 'eShop Account Registration';

    PageType = NavigatePage;

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Visible = Step1Visible;
                group("eShop Setup Wizard")
                {
                    Caption = 'eShop Setup Wizard';

                    InstructionalText = 'Welcome to the eShop Account Registration Wizard. Please submit the form with all the required fields. We use this information to generate URLs for a new test website that integrates with your Dynamics 365 Business Central.';

                    ShowCaption = true;

                }
            }
            group(Step2)
            {
                Visible = Step2Visible;
                group(Group1000000009)
                {
                    Caption = '';
                    InstructionalText = 'The information we gather from this page will be used to communicate with you and to setup your account with us.';
                    field(Email; Email)
                    {
                        ApplicationArea = All;
                        Caption = 'E-Mail';
                        ShowMandatory = true;
                    }
                    field(CnfmEmail; CnfmEmail)
                    {
                        ApplicationArea = All;
                        Caption = 'Confirm E-Mail';
                        ShowMandatory = true;

                        trigger OnValidate();
                        begin
                            IF Email <> CnfmEmail THEN
                                ERROR('Email Should Be Match');
                        end;
                    }
                    field("Dynamics 365 URL"; URL)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Caption = 'Business Central URL';
                    }
                    field("Contact Name"; Contact)
                    {
                        ApplicationArea = All;
                        Caption = 'Contact Name';
                        ShowMandatory = true;
                    }
                    field("Phone No."; Phone)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                    }
                    group(Group1000000012)
                    {
                        Caption = '';
                        InstructionalText = '';
                    }
                    field("Company Name"; CompanyNameVar)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                    }
                    field(Address; Address)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Visible = false;
                    }
                    field("Address 2"; Address2)
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field(City; City)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        visible = false;
                    }
                    field(State; State)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Visible = false;
                    }
                    field("Zip Code"; ZipCode)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                        Visible = false;
                    }
                    field("Country/Region Code"; Country)
                    {
                        ApplicationArea = All;
                        ShowMandatory = true;
                    }
                    field(Comments; Comment)
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group(Step3)
            {
                Visible = Step3Visible;
                group(Group1000000014)
                {
                    Caption = '';
                    InstructionalText = 'Thank you for taking time to fill out the form. You''ll receive an email confirmation from Dynamics eShop on the email id provided to us within 24 hours. The email will contain necessary links to complete the Installation and setup. If you don''t receive an email from us, please reach out to our Customer Service team @ 1888 631 1148.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    NextStep(TRUE);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                Visible = NextActionVisible;

                trigger OnAction();
                begin
                    NextStep(FALSE);
                    NextActionVisible := FALSE;
                    SubmitActionVisible := TRUE;
                end;
            }
            action(ActionSubmit)
            {
                ApplicationArea = All;
                Caption = 'Submit';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;
                Visible = SubmitActionVisible;

                trigger OnAction();
                begin
                    NextStep(FALSE);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction();
                begin
                    FinishAction;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        Step := Step::Start;
        EnableControls;
        IsMailSent := false;
    end;

    var
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        WelcomeText: Text[1024];
        Text003: Label 'The SMTP mail system returned the following error: "%1".';
        text001: Label 'In order to use Address Verification we must establish a link to our servers. We will ask you for some information that is required and some that is optional and is usefull to us in order to support you better.';
        BackActionEnabled: Boolean;
        NextActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        Step: Option Start,Second,Finish;
        Text: Integer;
        Email: Text[100];
        CnfmEmail: Text;
        Contact: Text[50];
        CompanyNameVar: Text[250];
        Address: Text[250];
        Address2: Text[250];
        City: Text[250];
        State: Text[250];
        ZipCode: Text[250];
        Country: Text[250];
        Phone: Text[250];
        URL: Text[250];
        Subject: Text[1024];
        Body: Text[1024];
        Text002: Label 'Dynamics 365 Applicant (%1) Details...';
        IsMailSent: Boolean;
        Comment: Text[1024];
        SendResult: Text;
        Authentication: Option Anonymous,NTLM,Basic;
        IsCustomerMailSent: Boolean;
        Text004: Label 'Mail From Dynamics eShop Inc.';
        NextActionVisible: Boolean;
        SubmitActionVisible: Boolean;


    local procedure EnableControls();
    begin
        ResetControls;

        CASE Step OF
            Step::Start:
                ShowStartStep;
            Step::Second:
                ShowSecondStep;
            Step::Finish:
                ShowFinalStep;
        END;
    end;

    local procedure ResetControls();
    begin
        BackActionEnabled := TRUE;
        NextActionEnabled := TRUE;
        FinishActionEnabled := TRUE;
        NextActionVisible := TRUE;

        Step1Visible := FALSE;
        Step2Visible := FALSE;
        Step3Visible := FALSE;
        SubmitActionVisible := FALSE;
    end;

    local procedure ShowStartStep();
    begin
        Step1Visible := TRUE;

        BackActionEnabled := FALSE;
        FinishActionEnabled := FALSE;
    end;

    local procedure ShowSecondStep();
    begin
        Step2Visible := TRUE;

        FinishActionEnabled := FALSE;
    end;

    local procedure ShowFinalStep();
    begin
        Step3Visible := TRUE;

        NextActionEnabled := FALSE;
    end;

    local procedure NextStep(BackWards: Boolean);
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Result: Text[30];
        BaseAddress: Text[1024];
        AzureURL: BigText;
        URLText: Label 'https://sendd365bcemail.azurewebsites.net/api/EmailAzure?code=UXisovWLRZYzVQmlg7AR5JBQbdrOupDYLFmW8/OUoSGm79AqPe2U9A==&Email=%1&Url=%2&Name=%3&Phone=%4&CompanyName=%5&Address=%6&Address2=%7&City=%8&State=%9&Zip=%10&CountryCode=%11&Comments=%12';
    begin
        IF (Step = Step::Start) AND NOT BackWards THEN;

        IF (Step = Step::Second) AND NOT BackWards THEN BEGIN
            IF Email = '' THEN
                ERROR('Please Provide The E-Mail Information');
            IF URL = '' THEN
                ERROR('Please Provide The Dynamics 365 URL Information');
            IF NOT IsMailSent THEN BEGIN
                AzureURL.AddText(StrSubstNo(URLText, CnfmEmail, URL, Contact, Phone, CompanyNameVar, Address, Address2, City, State, ZipCode, Country, Comment));
                Client.Get(Format(AzureURL), Response);
                Response.Content.ReadAs(Result);
                IF Result = 'True' THEN
                    IsMailSent := TRUE;
            END;

        END;

        IF BackWards THEN
            Step := Step - 1
        ELSE
            Step := Step + 1;

        EnableControls;
    end;

    local procedure FinishAction();
    begin
        CurrPage.CLOSE;
    end;







}

page 70009746 "eShop Group Items"
{
    // version ES1.00

    PageType = List;
    SourceTable = "eShop Group Items";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; "Parent Item No.")
                {
                    ApplicationArea = All;
                }
                field("Code"; "Unit Of Measure Code.")
                {
                    ApplicationArea = All;
                }
                field("Child Item No."; "Child Item No.")
                {
                    ApplicationArea = All;
                }
                field("eShop Published"; "eShop Enabled")
                {
                    ApplicationArea = All;
                }
                field(Height; Height)
                {
                    ApplicationArea = All;
                }
                field(Width; Width)
                {
                    ApplicationArea = All;
                }
                field(Length; Length)
                {
                    ApplicationArea = All;
                }
                field(Cubage; Cubage)
                {
                    ApplicationArea = All;
                }
                field(Weight; Weight)
                {
                    ApplicationArea = All;
                    //Caption = 'Weight';
                }
                field(ItemUnitOfMeasure; ItemBaseUOM)
                {
                    ApplicationArea = All;
                    //Caption = 'Base Unit of Measure';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF IUOM.GET("Parent Item No.", "Unit Of Measure Code.") THEN BEGIN
            Height := IUOM.Height;
            Width := IUOM.Width;
            Length := IUOM.Length;
            Cubage := IUOM.Cubage;
            Weight := IUOM.Weight;
        END;
        IF Item.GET("Parent Item No.") THEN
            ItemBaseUOM := Item."Base Unit of Measure";
    end;

    var
        Height: Decimal;
        Width: Decimal;
        Length: Decimal;
        Cubage: Decimal;
        Weight: Decimal;
        ItemBaseUOM: Code[10];
        IUOM: Record 5404;
        Item: Record 27;
}

page 70009747 "eShop Manufacturers"
{
    // version ES1.00

    //Caption = 'eShop Manufacturers';
    PageType = ListPart;
    SourceTable = Manufacturer;

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("Code"; Code)
                {
                    ToolTip = 'Specifies the code you want to use for the manufacturer.';
                }
                field(Name; Name)
                {
                    ToolTip = 'Specifies the name of the manufacturer.';
                }
            }
        }

    }

    actions
    {
    }
}

page 70009748 "eShop Item Substitutions"
{
    // version ES1.00

    AutoSplitKey = false;
    //Caption = 'Item Substitutions';
    DataCaptionFields = Interchangeable;
    Editable = false;
    PageType = ListPart;
    SourceTable = "Item Substitution";

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field("Substitute No."; "Substitute No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the item that can be used as a substitute in case the original item is unavailable.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the description of the substitute item.';
                }
                field(Interchangeable; Interchangeable)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies that the item and the substitute item are interchangeable.';
                }
                field(Condition; Condition)
                {
                    ToolTip = 'Specifies that a condition exists for this substitution.';
                }
            }
        }

    }
}

page 70009749 "eShop Purchase Quote"
{
    // version ES1.00.1

    //Caption = 'Purchase Quote';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approve,"Request Approval"';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote));

    layout
    {
        area(content)
        {
            group(General)
            {
                //Caption = 'General';
                field("No."; "No.")
                {
                    Importance = Additional;


                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor No."; "Buy-from Vendor No.")
                {
                }
                field("Buy-from Vendor Name"; "Buy-from Vendor Name")
                {
                    //Caption = 'Vendor';
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Buy-from Vendor No.") = xRec."Buy-from Vendor No." THEN
                            IF "Buy-from Vendor No." <> xRec."Buy-from Vendor No." THEN
                                SETRANGE("Buy-from Vendor No.");

                        CurrPage.UPDATE;
                    end;
                }
                field("Invoice Discount Value"; "Invoice Discount Value")
                {
                }
                field("Order Total"; "Amount Including VAT")
                {
                    //Caption = 'Order Total';
                }
                group("Buy-from")
                {
                    //Caption = 'Buy-from';
                    field("Buy-from Address"; "Buy-from Address")
                    {
                        //Caption = 'Address';
                        Importance = Additional;
                    }
                    field("Buy-from Address 2"; "Buy-from Address 2")
                    {
                        //Caption = 'Address 2';
                        Importance = Additional;
                    }
                    field("Buy-from City"; "Buy-from City")
                    {
                        //Caption = 'City';
                        Importance = Additional;
                    }
                    field("Buy-from County"; "Buy-from County")
                    {
                        //Caption = 'State';
                    }
                    field("Buy-from Post Code"; "Buy-from Post Code")
                    {
                        //Caption = 'ZIP Code';
                        Importance = Additional;
                    }
                    field("Buy-from Contact No."; "Buy-from Contact No.")
                    {
                        //Caption = 'Contact No.';
                        Importance = Additional;
                    }
                }
                field("Buy-from Contact"; "Buy-from Contact")
                {
                    //Caption = 'Contact';
                }
                field("Document Date"; "Document Date")
                {
                }
                field("Due Date"; "Due Date")
                {
                    Importance = Promoted;
                }
                field("Order Date"; "Order Date")
                {
                    Importance = Promoted;
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                    Importance = Additional;
                }
                field("Requested Receipt Date"; "Requested Receipt Date")
                {
                }
                field("Vendor Order No."; "Vendor Order No.")
                {
                }
                field("Vendor Shipment No."; "Vendor Shipment No.")
                {
                }
                field("Purchaser Code"; "Purchaser Code")
                {

                    trigger OnValidate();
                    begin

                    end;
                }
                field("Campaign No."; "Campaign No.")
                {
                    Importance = Additional;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID"; "Assigned User ID")
                {
                    Importance = Additional;
                }
                field(Status; Status)
                {
                    Importance = Promoted;
                }
            }
            part(PurchLines; "eShop Purchase Quote Subform")
            {
                Editable = "Sell-to Customer No." <> '';
                Enabled = "Sell-to Customer No." <> '';
                SubPageLink = "Document No." = FIELD ("No.");
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                //Caption = 'Invoice Details';
                field("Currency Code"; "Currency Code")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin


                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE;

                    end;
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                    Importance = Promoted;
                }
                field("Payment Terms Code"; "Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Payment Method Code"; "Payment Method Code")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin

                    end;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin

                    end;
                }
                field("Payment Discount %"; "Payment Discount %")
                {
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                    Importance = Additional;
                }
                field("Location Code"; "Location Code")
                {
                    Importance = Promoted;
                }
                field("Shipment Method Code"; "Shipment Method Code")
                {
                }
                field("Payment Reference"; "Payment Reference")
                {
                }
                field("Creditor No."; "Creditor No.")
                {
                }
                field("On Hold"; "On Hold")
                {
                }
                field("Tax Liable"; "Tax Liable")
                {
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    ToolTip = 'Specifies the tax area code used for this purchase to calculate and post sales tax.';
                }
            }
            group("Shipping and Payment")
            {
                //Caption = 'Shipping and Payment';
                group("Ship-to")
                {
                    //Caption = 'Ship-to';
                    field("Order Address Code"; "Order Address Code")
                    {
                        //Caption = 'Code';
                        Importance = Additional;
                    }
                    field("Ship-to Name"; "Ship-to Name")
                    {
                        //Caption = 'Name';
                        Importance = Additional;
                    }
                    field("Ship-to Address"; "Ship-to Address")
                    {
                        //Caption = 'Address';
                        Importance = Additional;
                    }
                    field("Ship-to Address 2"; "Ship-to Address 2")
                    {
                        //Caption = 'Address 2';
                        Importance = Additional;
                    }
                    field("Ship-to City"; "Ship-to City")
                    {
                        //Caption = 'City';
                        Importance = Additional;
                    }
                    field("Ship-to County"; "Ship-to County")
                    {
                        //Caption = 'State';
                    }
                    field("Ship-to Post Code"; "Ship-to Post Code")
                    {
                        //Caption = 'ZIP Code';
                        Importance = Additional;
                    }
                    field("Ship-to Contact"; "Ship-to Contact")
                    {
                        //Caption = 'Contact';
                        Importance = Additional;
                    }
                    field("Ship-to Country/Region Code"; "Ship-to Country/Region Code")
                    {
                    }
                }
                group("Pay-to")
                {
                    //Caption = 'Pay-to';
                    field("Pay-to Name"; "Pay-to Name")
                    {
                        //Caption = 'Name';

                        trigger OnValidate();
                        begin
                            IF GETFILTER("Pay-to Vendor No.") = xRec."Pay-to Vendor No." THEN
                                IF "Pay-to Vendor No." <> xRec."Pay-to Vendor No." THEN
                                    SETRANGE("Pay-to Vendor No.");

                            CurrPage.UPDATE;
                        end;
                    }
                    field("Pay-to Address"; "Pay-to Address")
                    {
                        //Caption = 'Address';
                        Importance = Additional;
                    }
                    field("Pay-to Address 2"; "Pay-to Address 2")
                    {
                        //Caption = 'Address 2';
                        Importance = Additional;
                    }
                    field("Pay-to City"; "Pay-to City")
                    {
                        //Caption = 'City';
                        Importance = Additional;
                    }
                    field("Pay-to County"; "Pay-to County")
                    {
                        //Caption = 'State';
                    }
                    field("Pay-to Post Code"; "Pay-to Post Code")
                    {
                        //Caption = 'ZIP Code';
                        Importance = Additional;
                    }
                    field("Pay-to Contact No."; "Pay-to Contact No.")
                    {
                        //Caption = 'Contact No.';
                        Importance = Additional;
                    }
                    field("Pay-to Contact"; "Pay-to Contact")
                    {
                        //Caption = 'Contact';
                        Importance = Additional;
                    }
                    field("Pay-to Country/Region Code"; "Pay-to Country/Region Code")
                    {
                    }
                }
            }
            group("Foreign Trade")
            {
                //Caption = 'Foreign Trade';
                field("Transaction Specification"; "Transaction Specification")
                {
                }
                field("Transport Method"; "Transport Method")
                {
                }
                field("Entry Point"; "Entry Point")
                {
                }
                field("Area"; Area)
                {
                }
            }
        }
        area(factboxes)
        {
            part(Part13; "Pending Approval FactBox")
            {
                SubPageLink = "Table ID" = CONST (38),
    "Document Type" = FIELD ("Document Type"),
    "Document No." = FIELD ("No.");

            }
            part(Part1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = FIELD ("Buy-from Vendor No.");
                Visible = false;
            }
            part(Part1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = FIELD ("Pay-to Vendor No.");
            }
            part(Part1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = FIELD ("Buy-from Vendor No.");
            }
            part(Part1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = FIELD ("Pay-to Vendor No.");
                Visible = false;
            }
            part(Part5; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = FIELD ("Document Type"),
                "Document No." = FIELD ("Document No."),
                "Line No." = FIELD ("Line No.");
            }
            part(Part1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = CONST (38),
                "Document Type" = FIELD ("Document Type"),
                "Document No." = FIELD ("No.");
                Visible = false;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ShowFilter = false;
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;

            }
            systempart(Part1900383207; Links)
            {
                Visible = false;
            }
            systempart(Part1905767507; Notes)
            {
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    end;

    trigger OnDeleteRecord(): Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        "Responsibility Center" := UserMgt.GetPurchasesFilter;

        IF (NOT DocNoVisible) AND ("No." = '') THEN
            SetBuyFromVendorFromFilter;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
            FILTERGROUP(2);
            SETRANGE("Responsibility Center", UserMgt.GetPurchasesFilter);
            FILTERGROUP(0);
        END;

        SetDocNoVisible;
    end;

    var
        ChangeExchangeRate: Page 511;
        CopyPurchDoc: Report 492;
        DocPrint: Codeunit 229;
        UserMgt: Codeunit 5700;
        ArchiveManagement: Codeunit 5063;
        PurchCalcDiscByType: Codeunit 66;
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CreateIncomingDocumentEnabled: Boolean;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure PurchaserCodeOnAfterValidate();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility: Codeunit 1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(DocType::Quote, "No.");
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt: Codeunit 1535;
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        CreateIncomingDocumentEnabled := (NOT HasIncomingDocument) AND ("No." <> '')
    end;
}

page 70009750 "eShop Purchase Quote Subform"
{
    // version ES1.00.1

    AutoSplitKey = true;
    //Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = WHERE ("Document Type" = FILTER (Quote));

    layout
    {
        area(content)
        {
            repeater(Group1)
            {
                field(Type; Type)
                {
                    ToolTip = 'Specifies the line type.';

                    trigger OnValidate();
                    begin
                        NoOnAfterValidate;
                        IF xRec."No." <> '' THEN
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("No."; "No.")
                {
                    ToolTip = 'Specifies the number of a general ledger account, item, additional cost, or fixed asset, depending on what you selected in the Type field.';

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;

                        IF xRec."No." <> '' THEN
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line No."; "Line No.")
                {
                }
                field("Qty. to Receive"; "Qty. to Receive")
                {
                }
                field("Expected Receipt Date"; "Expected Receipt Date")
                {
                }
                field("Cross-Reference No."; "Cross-Reference No.")
                {
                    ToolTip = 'Specifies the cross-reference number for this item.';
                    Visible = false;

                    trigger OnLookup(Text: Text): Boolean;
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                        NoOnAfterValidate;
                    end;

                    trigger OnValidate();
                    begin
                        CrossReferenceNoOnAfterValidat;
                        NoOnAfterValidate;
                    end;
                }
                field("Variant Code"; "Variant Code")
                {
                    ToolTip = 'Specifies a variant code for the item.';
                    Visible = false;
                }
                field(Nonstock; Nonstock)
                {
                    ToolTip = 'Specifies that this item is a nonstock item.';
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    ToolTip = 'Specifies the code for the tax product posting group of the item or general ledger account on this line.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field(Description; Description)
                {
                    ToolTip = 'Specifies a description of the entry, depending on what you chose in the Type field.';

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;

                        IF xRec."No." <> '' THEN
                            RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Location Code"; "Location Code")
                {
                    ToolTip = 'Specifies the code for the location where the items on the line will be located.';
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                    ShowMandatory = "No." <> '';
                    ToolTip = 'Specifies the number of units of the item that will be specified on the line.';

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit of Measure Code"; "Unit of Measure Code")
                {
                    Editable = UnitofMeasureCodeIsChangeable;
                    Enabled = UnitofMeasureCodeIsChangeable;
                    ToolTip = 'Specifies the unit of measure code that is valid for the purchase line.';

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ToolTip = 'Specifies the name of the unit of measure for the item, such as 1 bottle or 1 piece.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Direct Unit Cost"; "Direct Unit Cost")
                {
                    BlankZero = true;
                    ShowMandatory = "No." <> '';
                    ToolTip = 'Specifies the direct cost of one item unit.';

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    ToolTip = 'Specifies the item''s indirect cost percentage.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit Cost (LCY)"; "Unit Cost (LCY)")
                {
                    ToolTip = 'Specifies the unit cost of the item on the line.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Unit Price (LCY)"; "Unit Price (LCY)")
                {
                    ToolTip = 'Specifies the price for one unit of the item.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Tax Liable"; "Tax Liable")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Tax Area Code"; "Tax Area Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Tax Group Code"; "Tax Group Code")
                {
                    ShowMandatory = true;
                    Visible = TaxGroupCodeVisible;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Use Tax"; "Use Tax")
                {
                    Visible = false;
                }
                field("Line Amount"; "Line Amount")
                {
                    BlankZero = true;
                    ToolTip = 'Specifies the net amount (excluding the invoice discount amount) of the line, in the currency of the purchase document.';

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Amount Including VAT"; "Amount Including VAT")
                {
                    ToolTip = 'Specifies the sum of the amounts in the Amount Including Tax fields on the associated purchase lines.';
                }
                field("Line Discount %"; "Line Discount %")
                {
                    BlankZero = true;
                    ToolTip = 'Specifies the line discount percentage that is valid for the item on the line.';

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Line Discount Amount"; "Line Discount Amount")
                {
                    ToolTip = 'Specifies the amount of the line discount that will be granted on the purchase line.';
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RedistributeTotalsOnAfterValidate;
                    end;
                }
                field("Allow Invoice Disc."; "Allow Invoice Disc.")
                {
                    ToolTip = 'Specifies whether the invoice line is included when the invoice discount is calculated.';
                    Visible = false;
                }
                field("Allow Item Charge Assignment"; "Allow Item Charge Assignment")
                {
                    ToolTip = 'Specifies that you can assign item charges to this line.';
                    Visible = false;
                }
                field("Qty. to Assign"; "Qty. to Assign")
                {
                    BlankZero = true;
                    ToolTip = 'Specifies the quantity of the item charge that will be assigned when you post this line.';

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Qty. Assigned"; "Qty. Assigned")
                {
                    BlankZero = true;
                    ToolTip = 'Specifies how much of the item charge that has been assigned.';

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Prod. Order No."; "Prod. Order No.")
                {
                    ToolTip = 'Specifies the number of the production order that the purchase order was created for.';
                    Visible = false;
                }
                field("Blanket Order No."; "Blanket Order No.")
                {
                    ToolTip = 'Specifies the document number of the blanket order from which this purchase line originates.';
                    Visible = false;
                }
                field("Blanket Order Line No."; "Blanket Order Line No.")
                {
                    ToolTip = 'Specifies the line number of the blanket order line from which this purchase line originates.';
                    Visible = false;
                }
                field("Appl.-to Item Entry"; "Appl.-to Item Entry")
                {
                    ToolTip = 'Specifies the item ledger entry number the line should be applied to.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the dimension value code linked to the purchase.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the dimension value code linked to the purchase.';
                    Visible = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    //CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    //CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    //CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    //CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    //CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    //CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (8),
                              "Dimension Value Type" = CONST (Standard),
                              Blocked = CONST (false));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateSaveShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
            }
            group(Group40)
            {
                group(Group31)
                {
                    field("Invoice Discount Amount"; TotalPurchaseLine."Inv. Discount Amount")
                    {
                        AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                        AutoFormatType = 1;
                        //Caption = 'Invoice Discount Amount';
                        Editable = InvDiscAmountEditable;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        ToolTip = 'Specifies a discount amount that is deducted from the value in the Total Incl. Tax field.';

                        trigger OnValidate();
                        var
                            PurchaseHeader: Record 38;
                        begin
                            PurchaseHeader.GET("Document Type", "Document No.");
                            PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchaseLine."Inv. Discount Amount", PurchaseHeader);
                            CurrPage.UPDATE(FALSE);
                        end;
                    }
                    field("Invoice Disc. Pct."; PurchCalcDiscByType.GetVendInvoiceDiscountPct(Rec))
                    {
                        //Caption = 'Invoice Discount %';
                        DecimalPlaces = 0 : 2;
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        ToolTip = 'Specifies a discount percentage that is granted if criteria that you have set up for the customer are met.';
                    }
                }
                group(Group17)
                {
                    field("Total Amount Excl. VAT"; TotalPurchaseLine.Amount)
                    {
                        AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                        AutoFormatType = 1;
                        //CaptionClass = DocumentTotals.GetTotalExclVAT//Caption(PurchHeader."Currency Code");
                        //Caption = 'Total Amount Excl. Tax';
                        DrillDown = false;
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Excl. Tax field on all lines in the document, minus any discount amount in the Invoice Discount Amount field.';
                    }
                    field("Total VAT Amount"; VATAmount)
                    {
                        AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                        AutoFormatType = 1;
                        //CaptionClass = DocumentTotals.GetTotalVAT//Caption(PurchHeader."Currency Code");
                        //Caption = 'Total Tax';
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = RefreshMessageEnabled;
                        ToolTip = 'Specifies the sum of tax amounts on all lines in the document.';
                    }
                    field("Total Amount Incl. VAT"; TotalPurchaseLine."Amount Including VAT")
                    {
                        AutoFormatExpression = TotalPurchaseHeader."Currency Code";
                        AutoFormatType = 1;
                        //CaptionClass = DocumentTotals.GetTotalInclVAT//Caption(PurchHeader."Currency Code");
                        //Caption = 'Total Amount Incl. Tax';
                        Editable = false;
                        StyleExpr = TotalAmountStyle;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Incl. Tax field on all lines in the document, minus any discount amount in the Invoice Discount Amount field.';
                    }
                    field(RefreshTotals; RefreshMessageText)
                    {
                        DrillDown = true;
                        Editable = false;
                        Enabled = RefreshMessageEnabled;
                        ShowCaption = false;

                        trigger OnDrillDown();
                        begin
                            //DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
                            //DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
                            //TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
                        end;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                //Caption = 'F&unctions';
                Image = "Action";
                action("E&xplode BOM")
                {
                    AccessByPermission = TableData 90 = R;
                    //Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert &Ext. Text")
                {
                    AccessByPermission = TableData 279 = R;
                    //Caption = 'Insert &Ext. Text';
                    Image = Text;

                    trigger OnAction();
                    begin
                        InsertExtendedText(TRUE);
                    end;
                }
            }
            group("&Line")
            {
                //Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    //Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        //Caption = 'Event';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        //Caption = 'Period';
                        Image = Period;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        //Caption = 'Variant';
                        Image = ItemVariant;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData 14 = R;
                        //Caption = 'Location';
                        Image = Warehouse;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        //Caption = 'BOM Level';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348 = R;
                    //Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    //Caption = 'Co&mments';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
                action("Item Charge &Assignment")
                {
                    AccessByPermission = TableData 5800 = R;
                    //Caption = 'Item Charge &Assignment';
                    Image = ItemCosts;

                    trigger OnAction();
                    begin
                        ItemChargeAssgnt;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    //Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        UpdateEditableOnRow;
        IF PurchHeader.GET("Document Type", "Document No.") THEN;

        //DocumentTotals.PurchaseUpdateTotalsControls(Rec,TotalPurchaseHeader,TotalPurchaseLine,RefreshMessageEnabled,
        //TotalAmountStyle,RefreshMessageText,InvDiscAmountEditable,VATAmount);
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        CLEAR(DocumentTotals);
    end;

    trigger OnDeleteRecord(): Boolean;
    var
        ReservePurchLine: Codeunit 99000834;
    begin
        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
            COMMIT;
            IF NOT ReservePurchLine.DeleteLineConfirm(Rec) THEN
                EXIT(FALSE);
            ReservePurchLine.DeleteLine(Rec);
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    var
        TaxGroup: Record 321;
    begin
        TaxGroupCodeVisible := NOT TaxGroup.ISEMPTY;
    end;

    var
        TotalPurchaseHeader: Record 38;
        TotalPurchaseLine: Record 39;
        PurchHeader: Record 38;
        PurchCalcDiscByType: Codeunit 66;
        DocumentTotals: Codeunit 57;
        TransferExtendedText: Codeunit 378;
        ItemAvailFormsMgt: Codeunit 353;
        ShortcutDimCode: ARRAY[8] OF Code[20];
        VATAmount: Decimal;
        InvDiscAmountEditable: Boolean;
        TotalAmountStyle: Text;
        RefreshMessageEnabled: Boolean;
        RefreshMessageText: Text;
        TaxGroupCodeVisible: Boolean;
        UnitofMeasureCodeIsChangeable: Boolean;

    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Disc. (Yes/No)", Rec);
    end;

    local procedure ExplodeBOM();
    begin
        CODEUNIT.RUN(CODEUNIT::"Purch.-Explode BOM", Rec);
    end;

    local procedure InsertExtendedText(Unconditionally: Boolean);
    begin
        IF TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) THEN BEGIN
            CurrPage.SAVERECORD;
            TransferExtendedText.InsertPurchExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
            UpdateForm(TRUE);
    end;

    local procedure ItemChargeAssgnt();
    begin
        ShowItemChargeAssgnt;
    end;

    local procedure OpenItemTrackingLines();
    begin
        OpenItemTrackingLines;
    end;

    procedure UpdateForm(SetSaveRecord: Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    local procedure NoOnAfterValidate();
    begin
        UpdateEditableOnRow;
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
         (xRec."No." <> '')
      THEN
            CurrPage.SAVERECORD;
    end;

    local procedure CrossReferenceNoOnAfterValidat();
    begin
        InsertExtendedText(FALSE);
    end;

    local procedure RedistributeTotalsOnAfterValidate();
    begin
        CurrPage.SAVERECORD;

        PurchHeader.GET("Document Type", "Document No.");
        IF DocumentTotals.PurchaseCheckNumberOfLinesLimit(PurchHeader) THEN;
        //DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
        CurrPage.UPDATE;
    end;

    local procedure ValidateSaveShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20]);
    begin
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
        CurrPage.SAVERECORD;
    end;

    local procedure UpdateEditableOnRow();
    begin
        UnitofMeasureCodeIsChangeable := CanEditUnitOfMeasureCode;
    end;
}

page 70009751 "eShop Item List"
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

    PageType = List;
    SourceTable = "Item";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop Item List';


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    var
                    ItemRec : Record Item;
                    begin
                    ItemRec.SetRange("No.",Rec."No.");
                    Page.Run(30,ItemRec);
                    end;
                    
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field("eShop Enabled"; "eShop Enabled")
                {
                    ApplicationArea = All;
                }
                field("eShop Category ID"; "eShop Category ID")
                {
                    ApplicationArea = All;
                }
                field("Manufacturer Code"; "Manufacturer Code")
                {
                    ApplicationArea = All;
                }
                field("eShop ID"; "eShop ID")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Navigation)
        {   
            
            group(eShop)
            {

                //Caption = 'eShop';
                action(Publish)
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Publish';
                    Image = AddAction;
                    PromotedCategory = Process;
                    trigger OnAction();
                    var
                        EShopDotnetService: Codeunit "eShop Dotnet Service";

                    begin
                        Clear(EShopDotnetService);
                        EShopDotnetService.PubishMasters(Rec."No.", 'insertproductbyerpid', true);
                    end;
                }
                action(Update)
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Update';
                    Image = AddAction;
                    PromotedCategory = Process;
                    trigger OnAction();
                    var
                        EShopDotnetService: Codeunit "eShop Dotnet Service";

                    begin
                        CLEAR(EShopDotnetService);
                        EShopDotnetService.PubishMasters(Rec."No.", 'updateproductbyerpid', true);

                    end;
                }
                action("Preview Item")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Preview Item';
                    Image = View;
                    PromotedCategory = Process;
                    trigger OnAction();
                    var
                        EshopBrowser: Page 70009723;
                        EshopSetup: Record 70009700;
                    begin
                        EshopSetup.GET;
                        EshopSetup.TESTFIELD("eShop URL");
                        IF EshopSetup."Browser Addin Exists" THEN BEGIN
                            EshopBrowser.RUNMODAL;
                        END ELSE
                            HYPERLINK(EshopSetup."eShop URL" + '/p/' + FORMAT(Rec."eShop ID"));
                    end;
                }
                action("Edit Item")
                {
                    ApplicationArea = ALL;
                    Promoted = true;
                    Caption = 'Edit Item';
                    Image = Edit;
                    PromotedCategory = Process;
                    trigger OnAction();
                    var
                        EshopBrowser: Page 70009723;
                        EshopSetup: Record 70009700;

                    begin
                        EshopSetup.GET;
                        EshopSetup.TESTFIELD("eShop URL");
                        IF EshopSetup."Browser Addin Exists" THEN BEGIN
                            EshopBrowser.RUNMODAL;
                        END ELSE
                            HYPERLINK(EshopSetup."eShop URL" + '/Admin/Product/Edit/' + FORMAT(Rec."eShop ID"));
                    end;
                }


            }


        }

    }

}

