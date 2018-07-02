report 70009700 "eShop One Click Install"
{
    // version ES1.00.1

    ProcessingOnly = true;
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'eShop One Click Install';
    dataset
    {
        dataitem("Tenant Web Service"; "Tenant Web Service")
        {

            trigger OnPreDataItem();
            begin
                IF SyncOrders THEN
                    EshopDotnetService.InsertOfflineOrders;

                IF SetWerbService THEN BEGIN
                    PgID[1] := 70009728;
                    PgServName[1] := 'WebShop Supplier Card';
                    PgID[2] := 70009703;
                    PgServName[2] := 'WebShop Categories';
                    PgID[3] := 70009707;
                    PgServName[3] := 'WebShop Checkout';
                    PgID[4] := 70009711;
                    PgServName[4] := 'WebShop Closed Order';
                    PgID[5] := 70009705;
                    PgServName[5] := 'WebShop Customer';
                    PgID[6] := 70009713;
                    PgServName[6] := 'WebShop Customer Transactions';
                    PgID[7] := 70009704;
                    PgServName[7] := 'WebShop Item';
                    PgID[8] := 70009747;
                    PgServName[8] := 'WebShop Manufacturers';
                    PgID[9] := 70009726;
                    PgServName[9] := 'WebShop Reports';
                    PgID[10] := 70009709;
                    PgServName[10] := 'WebShop Sales Order';
                    PgID[11] := 70009700;
                    PgServName[11] := 'WebShop Setup';
                    PgID[12] := 70009739;
                    PgServName[12] := 'WebShop Ship-to Address';
                    PgID[13] := 70009702;
                    PgServName[13] := 'WebShop User';
                    PgID[14] := 70009727;
                    PgServName[14] := 'WebShop Purchase Order';
                    PgID[15] := 70009730;
                    PgServName[15] := 'WebShop Purchase Invoice';
                    PgID[16] := 70009749;
                    PgServName[16] := 'WebShop Purchase Quote';

                    FOR i := 1 TO 16 DO BEGIN
                        IF NOT "Tenant Web Service".GET("Object Type"::Page, PgServName[i]) THEN BEGIN
                            "Tenant Web Service".INIT;
                            "Tenant Web Service"."Object Type" := "Tenant Web Service"."Object Type"::Page;
                            "Tenant Web Service"."Object ID" := PgID[i];
                            "Tenant Web Service"."Service Name" := PgServName[i];
                            "Tenant Web Service".Published := TRUE;
                            "Tenant Web Service".INSERT(TRUE);
                        END;
                    END;
                    IF NOT "Tenant Web Service".GET("Object Type"::Codeunit, 'WebShop Functions') THEN BEGIN
                        "Tenant Web Service".INIT;
                        "Tenant Web Service"."Object Type" := "Tenant Web Service"."Object Type"::Codeunit;
                        "Tenant Web Service"."Object ID" := 70009700;
                        "Tenant Web Service"."Service Name" := 'WebShop Functions';
                        "Tenant Web Service".Published := TRUE;
                        "Tenant Web Service".INSERT(TRUE);
                    END;

                    IF EshopSetup.GET('') THEN BEGIN
                        EshopSetup."Nav Web Service URL" := GetWebServiceAPIURL;
                        //EshopSetup."Web Service URL" := GetWebServiceURL();
                        EshopSetup.MODIFY;
                    END;
                    IF SSetup.GET THEN BEGIN
                        IF Noseries.GET(SSetup."Quote Nos.") THEN
                            IF NOT Noseries."Manual Nos." THEN BEGIN
                                Noseries."Manual Nos." := TRUE;
                                Noseries.MODIFY;
                            END;
                    END;

                    NoSrsCode[1] := 'ESUSER';
                    NoSrsDesc[1] := 'eShop User';
                    StartingNo[1] := 'ES00001';

                    NoSrsCode[2] := 'ESCAT';
                    NoSrsDesc[2] := 'eShop Categories';
                    StartingNo[2] := '1';

                    NoSrsCode[3] := 'ESCUST';
                    NoSrsDesc[3] := 'eShop Customers';
                    StartingNo[3] := 'WEB00001';

                    NoSrsCode[4] := 'ESQUOTE';
                    NoSrsDesc[4] := 'eShop Quote';
                    StartingNo[4] := 'ESQ00001';



                    FOR i := 1 TO 4 DO BEGIN
                        IF (NOT Noseries.GET(NoSrsCode[i])) THEN BEGIN
                            Noseries.INIT;
                            Noseries.Code := NoSrsCode[i];
                            Noseries.Description := NoSrsDesc[i];
                            Noseries."Default Nos." := TRUE;
                            Noseries."Manual Nos." := TRUE;
                            Noseries.INSERT;
                            IF EshopSetup.GET('') THEN BEGIN
                                IF i = 1 THEN
                                    EshopSetup."User No. Series" := NoSrsCode[i];
                                IF i = 2 THEN
                                    EshopSetup."Category No. Series" := NoSrsCode[i];
                                IF i = 3 THEN
                                    EshopSetup."Web Customer No. Series" := NoSrsCode[i];
                                IF i = 4 THEN
                                    EshopSetup."Quote No. Series" := NoSrsCode[i];
                                EshopSetup.MODIFY;
                            END;
                        END ELSE BEGIN
                            IF EshopSetup.GET('') THEN BEGIN
                                IF i = 1 THEN
                                    EshopSetup."User No. Series" := NoSrsCode[i];
                                IF i = 2 THEN
                                    EshopSetup."Category No. Series" := NoSrsCode[i];
                                IF i = 3 THEN
                                    EshopSetup."Web Customer No. Series" := NoSrsCode[i];
                                IF i = 4 THEN
                                    EshopSetup."Quote No. Series" := NoSrsCode[i];
                                EshopSetup.MODIFY;
                            END;
                        END;
                        IF NOT Noseriesline.GET(NoSrsCode[i], 10000) THEN BEGIN
                            Noseriesline.INIT;
                            Noseriesline."Series Code" := NoSrsCode[i];
                            Noseriesline."Starting No." := StartingNo[i];
                            Noseriesline."Line No." := 10000;
                            Noseriesline.INSERT;
                        END;
                    END;

                    IF CustPosting.FINDFIRST AND (EshopSetup."Web Customer Posting group" = '') THEN BEGIN
                        EshopSetup."Web Customer Posting group" := CustPosting.Code;
                        EshopSetup.MODIFY;
                    END;

                    IF GenBussPosting.FINDFIRST AND (EshopSetup."Web Customer Bus Posting Group" = '') THEN BEGIN
                        EshopSetup."Web Customer Bus Posting Group" := GenBussPosting.Code;
                        EshopSetup.MODIFY;
                    END;

                    IF (NOT CustTemplate.GET('ESCUST')) THEN BEGIN
                        CustTemplate.INIT;
                        CustTemplate.Code := 'ESCUST';
                        CustTemplate.Description := 'EShop Customer';
                        CustTemplate."Gen. Bus. Posting Group" := GenBussPosting.Code;
                        CustTemplate."Customer Posting Group" := CustPosting.Code;
                        CustTemplate.INSERT;
                        EshopSetup."eShop Customer Template" := CustTemplate.Code;
                        EshopSetup.MODIFY;
                    END ELSE BEGIN
                        EshopSetup."eShop Customer Template" := CustTemplate.Code;
                        EshopSetup.MODIFY;
                    END;

                END;
                MESSAGE('Setup Completed!');
            end;
        }
        dataitem("eShop Categories"; "eShop Categories")
        {
            RequestFilterFields = "Category ID", "Parent Category ID", "eShop Enabled", "eShop ID", "Item Category Code";

            trigger OnAfterGetRecord();
            begin

                IF NOT (InsertCategories OR UpdateCategories) THEN
                    CurrReport.BREAK;
                IF InsertCategories THEN BEGIN
                    EshopDotnetService.PubishMasters("eShop Categories"."Category ID", 'insertcategorybyerpid', false);
                    //EshopDotnetService.InsertCategories(FORMAT("eShop Categories"."Category ID"), FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', "eShop Categories"."Category ID", "eShop Categories".Name));
                END;
                IF UpdateCategories THEN BEGIN
                    EshopDotnetService.PubishMasters("eShop Categories"."Category ID", 'updatecategorybyerpid', false);
                    //EshopDotnetService.UpdateCategories(FORMAT("eShop Categories"."Category ID"), FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', "eShop Categories"."Category ID", "eShop Categories".Name));
                END
            end;

            trigger OnPreDataItem();
            begin

                IF InsertCategories THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text002);

                IF UpdateCategories THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text003);

                //  Window.UPDATE(1,STRSUBSTNO('%1 %2',"Document Type","No."));
            end;
        }
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category Code", "Product Group Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "eShop Enabled", "eShop Category ID", "eShop ID";

            trigger OnAfterGetRecord();
            var
                Itemnumber: Code[10];
            begin

                IF NOT (InsertItems OR UpdateItems) THEN
                    CurrReport.BREAK;
                IF InsertItems THEN BEGIN
                    EShopDotnetService.PubishMasters(Item."No.", 'insertproductbyerpid', false);
                    //EshopDotnetService.InsertProducts(Item, FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', Item."No.", Item.Description));
                END;
                IF UpdateItems THEN BEGIN
                    EShopDotnetService.PubishMasters(Item."No.", 'updateproductbyerpid', false);
                    //EshopDotnetService.UpdateProducts(Item, FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', Item."No.", Item.Description));
                END
            end;

            trigger OnPreDataItem();
            begin

                IF InsertItems THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text004);
                IF UpdateItems THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text005);
            end;
        }
        dataitem("eShop Users"; "eShop Users")
        {
            RequestFilterFields = UserID, "User Type", "eShop Enabled", "No.";

            trigger OnAfterGetRecord();
            begin

                IF NOT (InsertUsers OR UpdateUsers) THEN
                    CurrReport.BREAK;
                IF InsertUsers THEN BEGIN
                    EshopDotNetService.PubishMasters("eShop Users".UserID, 'insertuserbyerpid', false);
                    //EshopDotnetService.InsertUser("eShop Users".UserID, FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', "eShop Users".UserID, "eShop Users"."First Name"));
                END;
                IF UpdateUsers THEN BEGIN
                    EshopDotNetService.PubishMasters("eShop Users".UserID, 'updateuserbyerpid', false);
                    //EshopDotnetService.UpdateUser("eShop Users".UserID, FALSE);
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', "eShop Users".UserID, "eShop Users"."First Name"));
                END
            end;

            trigger OnPreDataItem();
            begin

                IF InsertUsers THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text006);
                IF UpdateUsers THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text007);
            end;
        }
        dataitem(Customer; Customer)
        {

            trigger OnAfterGetRecord();
            begin

                IF NOT CreateUsers THEN
                    CurrReport.BREAK;
                IF CreateUsers THEN BEGIN
                    //EShopMethods.LicenseCheck(Customer."No.");
                    Window.UPDATE(1, STRSUBSTNO('%1 %2', "eShop Users".UserID, "eShop Users"."First Name"));
                END;
            end;

            trigger OnPreDataItem();
            begin

                IF CreateUsers THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text008);
            end;
        }
        dataitem(Manufacturer; Manufacturer)
        {

            trigger OnAfterGetRecord();
            begin
                IF NOT (InsertManufact) THEN
                    CurrReport.BREAK;
                IF InsertManufact THEN BEGIN
                    EshopDotNetService.PubishMasters('', 'insertallmanufacturers', false);
                    //EshopDotnetService.InsertManufacturer();
                END;
            end;

            trigger OnPreDataItem();
            begin
                IF InsertManufact THEN
                    Window.OPEN(
    '#1#################################\\' +
                    Text009);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(SetWerbService; SetWerbService)
                {
                    ApplicationArea = All;
                    Caption = 'Default Setup';
                    Visible = false;
                }
                field(InsertCategories; InsertCategories)
                {
                    ApplicationArea = All;
                    Caption = 'Insert Categories';
                }
                field(UpdateCategories; UpdateCategories)
                {
                    ApplicationArea = All;
                    Caption = 'Update Categories';
                }
                field(InsertItems; InsertItems)
                {
                    ApplicationArea = All;
                    Caption = 'Insert Items';
                }
                field(UpdateItems; UpdateItems)
                {
                    ApplicationArea = All;
                    Caption = 'Update Items';
                }
                field(CreateUsers; CreateUsers)
                {
                    ApplicationArea = All;
                    Caption = 'Create Users';
                }
                field(InsertUsers; InsertUsers)
                {
                    ApplicationArea = All;
                    Caption = 'Insert Users';
                }
                field(UpdateUsers; UpdateUsers)
                {
                    ApplicationArea = All;
                    Caption = 'Update Users';
                }
                field(InsertManufact; InsertManufact)
                {
                    ApplicationArea = All;
                    Caption = 'Insert Manufact';
                }
                field("Sync Orders"; SyncOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Sync Orders';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SetWerbService: Boolean;
        InsertCategories: Boolean;
        UpdateCategories: Boolean;
        InsertItems: Boolean;
        UpdateItems: Boolean;
        CreateUsers: Boolean;
        InsertUsers: Boolean;
        UpdateUsers: Boolean;
        InsertManufact: Boolean;
        SyncOrders: Boolean;
        Window: Dialog;
        EShopMethods: Codeunit 70009701;
        Objtype: Option "Page","Codeunit";
        PgID: ARRAY[20] OF Integer;
        PgServName: ARRAY[20] OF Text[50];
        i: Integer;
        Text001: Label 'Setting Up Web Services';
        Text002: Label 'Inserting Categories';
        Text003: Label 'Updating Categories';
        Text004: Label 'Inserting Items';
        Text005: Label 'Updating Items';
        Text006: Label 'Inserting Users';
        Text007: Label 'Updating Users';
        Text008: Label 'Creating Users';
        Text009: Label 'Inserting Manufacturers';
        UploadData: Boolean;
        EshopDotnetService: Codeunit 70009703;
        EshopSetup: Record 70009700;
        NoSrsCode: ARRAY[10] OF Code[20];
        NoSrsDesc: ARRAY[10] OF Text[100];
        StartingNo: ARRAY[10] OF Code[30];
        Noseries: Record 308;
        Noseriesline: Record 309;
        CustPosting: Record 92;
        GenBussPosting: Record 250;
        SSetup: Record 311;
        CustTemplate: Record 5105;

    local procedure GetWebServiceAPIURL(): Text[1024];
    begin
        EXIT(GETURL(CLIENTTYPE::SOAP, COMPANYNAME))
    end;

    
}

