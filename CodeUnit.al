codeunit 70009700 "eShop Functions"
{
    Subtype = Install;
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = false;

    var
        Glotempblob: Record TempBlob;
        // version ES1.00.1

        // DESCM1.00 - 09-01-2011 - DYNAMICS ESHOP INC - E-COMMERCE SOLUTION
        // ---------------------------------------------------------------------------------------------------------
        // Copyright © 2011-2012 Dynamics eShop Inc.
        // All rights reserved
        // This object contains proprietaryo information of  Dynamics eShop Inc.; it is provided under a license
        // agreement containing restrictions on use and disclosure and is also protected by copyright law.  The
        // information and intellectual property contained herein is confidential between Dynamics eShop Inc.
        // and the client and remains the exclusive property of Dynamics eShop Inc.
        // Visit www.dynamicseshop.com for news and updates.
        // ---------------------------------------------------------------------------------------------------------


    trigger OnRun();
    var

    begin

    end;

    var
        Price1: Decimal;
        SalesPrice1: Decimal;
        DiscountPercent1: Decimal;
        i: Integer;
        ItemNoArray: ARRAY[100] OF Code[20];
        UOM: ARRAY[100] OF Code[20];
        VariantCode: ARRAY[100] OF Code[20];
        Quantity: ARRAY[100] OF Decimal;
        PriceArray: ARRAY[100] OF Text[30];
        SalesPriceArray: ARRAY[100] OF Text[30];
        DiscountArray: ARRAY[100] OF Text[30];
        InvoiceAmt: Text[30];
        TaxAmt: Text[30];
        InvDiscount: Text[30];
        ShipAmount: Text[30];
        ItemUOM: Record 5404;
        LineTotalArray: ARRAY[100] OF Text[30];
        Orderno: Code[10];
        ReleaseOrder: Codeunit 414;
        CouponCode: Code[20];
        Response: Text[30];
        EShopSetup: Record 70009700; ////
        j: Integer;
        AvailtoPromise: Codeunit 5790;
        GrossReq: Decimal;
        SchedRec: Decimal;
        DateFor: DateFormula;
        Text001: Label 'Item No %1 does not exists.';
        Text002: Label 'Customer No %1 does not exists.';
        Text003: Label 'Sales Order %1 does not exists.';
        Text004: Label 'Coupon code is applied';
        Text005: Label 'Coupon code is invalid';
        Text006: Label 'Quote Number %1 does not exists.';
        Deci: Decimal;
        Subjecttext: Label 'Quote Request on %1';
        CustNametext: Label 'Name: %1';
        ContactNotext: Label 'Contact No: %1';
        "E-mailtext": Label 'E-Mail: %1';
        Addresstext: Label 'Address: %1';
        ItemNoText: Label 'Customer hs requested quote on the following items ';
        Location: Record 14;
        Text007: Label 'Addtional Information';
        Text020: Label 'Shimpment Alerts';
        Text008: Label 'Hi';
        SCSText000: Label 'TextSCS';
        ItemVendor: Record 99;
        JObject: JsonObject;
        JArray: JsonArray;

    procedure GetCustomerItemPrices(ItemNumber: Code[20]; VariantCode: Code[20]; CustomerNumber: Code[20]; Quantity: Decimal; UOM: Code[20]; var Price: Decimal; var SalesPrice: Decimal; var DiscountPercent: Decimal);
    begin

        EshopPricing(ItemNumber, VariantCode, CustomerNumber, UOM, Quantity, Price, SalesPrice, DiscountPercent);
    end;


    procedure GetProductListPricesArray(ItemNumber: ARRAY[1000] OF Code[20]; CustomerNumber: Code[20]; Price: ARRAY[1000] OF Text[30]; SalesPrice: ARRAY[1000] OF Text[30]; DiscountPercent: ARRAY[1000] OF Text[30]; Inventory: ARRAY[1000] OF Text[30]; ArraySize: Integer) Json: Text;
    var
        SalesPriceDecimal: ARRAY[300] OF Decimal;
        PriceDecimal: ARRAY[300] OF Decimal;
        "Discount%": ARRAY[300] OF Decimal;
        InventoryDecimal: ARRAY[300] OF Decimal;

    begin
        FOR i := 1 TO ArraySize DO BEGIN
            EshopPricing(ItemNumber[i], VariantCode[i], CustomerNumber, UOM[i], Quantity[i], PriceDecimal[i], SalesPriceDecimal[i], "Discount%"[i]);

            GetItemInventory(ItemNumber[i], VariantCode[i], UOM[i], InventoryDecimal[i]);

            Price[i] := FORMAT(PriceDecimal[i]);
            SalesPrice[i] := FORMAT(SalesPriceDecimal[i]);
            DiscountPercent[i] := FORMAT("Discount%"[i]);
            Inventory[i] := DELCHR(FORMAT(InventoryDecimal[i]), '=', ',');
            Inventory[i] := '1';
            JObject.Add('ItemNumber', ItemNumber[i]);
            JObject.Add('CustomerNumber', CustomerNumber);
            JObject.Add('Price', Price[i]);
            JObject.Add('SalesPrice', SalesPrice[i]);
            JObject.Add('DiscountPercent', DiscountPercent[i]);
            JObject.Add('Inventory', Inventory[i]);
            JObject.Add('ArraySize', ArraySize);
            JArray.Add(JObject);
            CLEAR(JObject);
        END;
        JObject.Add('GetProductListPricesArray', JArray);
        JObject.WriteTo(Json);
    end;

    procedure GetCustomerProductPricesArray(ItemNumber: Code[20]; VariantCode: ARRAY[1000] OF Code[20]; CustomerNumber: Code[20]; Quantity: Decimal; UOM: ARRAY[1000] OF Code[20]; Price: ARRAY[1000] OF Text[30]; SalesPrice: ARRAY[1000] OF Text[30]; DiscountPercent: ARRAY[1000] OF Text[30]; Inventory: ARRAY[1000] OF Text[30]; ArraySize: Integer) Json: Text;
    var
        SalesPriceDecimal: ARRAY[1000] OF Decimal;
        PriceDecimal: ARRAY[1000] OF Decimal;
        "Discount%": ARRAY[1000] OF Decimal;
        InventoryDecimal: ARRAY[1000] OF Decimal;
    begin
        FOR i := 1 TO ArraySize DO BEGIN
            EshopPricing(ItemNumber, VariantCode[i], CustomerNumber, UOM[i], Quantity, PriceDecimal[i], SalesPriceDecimal[i], "Discount%"[i]);

            GetItemInventory(ItemNumber, VariantCode[i], UOM[i], InventoryDecimal[i]);

            Price[i] := FORMAT(PriceDecimal[i]);
            SalesPrice[i] := FORMAT(SalesPriceDecimal[i]);
            DiscountPercent[i] := FORMAT("Discount%"[i]);
            Inventory[i] := DELCHR(FORMAT(InventoryDecimal[i]), '=', ',');
            JObject.Add('ItemNumber', ItemNumber);
            JObject.Add('VariantCode', VariantCode[i]);
            JObject.Add('CustomerNumber', CustomerNumber);
            JObject.Add('Quantity', Quantity);
            JObject.Add('UOM', UOM[i]);
            JObject.Add('Price', Price[i]);
            JObject.Add('SalesPrice', SalesPrice[i]);
            JObject.Add('DiscountPercent', DiscountPercent[i]);
            JObject.Add('Inventory', Inventory[i]);
            JObject.Add('ArraySize', ArraySize);
            JArray.Add(JObject);
            CLEAR(JObject);
        End;
        JObject.Add('GetCustomerProductPricesArray', JArray);
        JObject.WriteTo(Json);

    end;

    procedure GetWishListPrices(ItemNumber: ARRAY[300] OF Code[20]; VariantCode: ARRAY[300] OF Code[20]; CustomerNumber: Code[20]; Quantity: ARRAY[300] OF Decimal; UOM: ARRAY[300] OF Code[20]; Price: ARRAY[300] OF Text[30]; SalesPrice: ARRAY[300] OF Text[30]; DiscountPercent: ARRAY[300] OF Text[30]; LineTotal: ARRAY[300] OF Text[30]; ArraySize: Integer) Json: Text;
    var
        SalesPriceDecimal: ARRAY[1000] OF Decimal;
        PriceDecimal: ARRAY[1000] OF Decimal;
        "Discount%": ARRAY[1000] OF Decimal;
        InventoryDecimal: ARRAY[1000] OF Decimal;
        LineTotalDecimal: ARRAY[1000] OF Decimal;
    begin
        FOR i := 1 TO ArraySize DO BEGIN
            EshopPricing(ItemNumber[i], VariantCode[i], CustomerNumber, UOM[i], Quantity[i], PriceDecimal[i], SalesPriceDecimal[i], "Discount%"[i]);

            Price[i] := FORMAT(PriceDecimal[i]);
            SalesPrice[i] := FORMAT(SalesPriceDecimal[i]);
            DiscountPercent[i] := FORMAT("Discount%"[i]);
            LineTotalDecimal[i] := (SalesPriceDecimal[i] * Quantity[i]);
            LineTotal[i] := FORMAT(LineTotalDecimal[i]);

            JObject.Add('ItemNumber', ItemNumber[i]);
            JObject.Add('VariantCode', VariantCode[i]);
            JObject.Add('CustomerNumber', CustomerNumber);
            JObject.Add('Quantity', Quantity[i]);
            JObject.Add('UOM', UOM[i]);
            JObject.Add('Price', Price[i]);
            JObject.Add('SalesPrice', SalesPrice[i]);
            JObject.Add('DiscountPercent', DiscountPercent[i]);
            JObject.Add('LineTotal', LineTotal[i]);
            JObject.Add('ArraySize', ArraySize);
            JArray.Add(JObject);
            CLEAR(JObject);
        END;
        JObject.Add('GetWishListPrices', JArray);
        JObject.WriteTo(Json);

    end;


    procedure GetCartPrices(ItemNumber: ARRAY[300] OF Code[20]; VariantCode: ARRAY[300] OF Code[20]; CustomerNumber: Code[20]; Quantity: ARRAY[300] OF Decimal; UOM: ARRAY[300] OF Code[20]; QuoteNo: Code[30]; CallFromCartPage: Boolean; Price: array[300] OF Text[30]; SalesPrice: ARRAY[300] OF Text[30]; DiscountPercent: ARRAY[300] OF Text[30]; LineTotal: ARRAY[300] OF Text[30]; InvoiceDiscount: Text[30]; TaxAmount: Text[30]; ShippingAmount: Text[30]; InvoiceAmount: Text[30]; ArraySize: Integer; CouponCode: Code[20]; Response: Text[200]) Json: Text
    var
        SalesHeader: Record 36;
        SalesLine: Record 37;
        NoSeriesMgnt: Codeunit 396;
        LineNo: Integer;
        Type: Text[30];
        Item: Record 27;
        SalesPriceCalc: Codeunit 7000;
        LineTotal1: ARRAY[300] OF Decimal;
        SalesPrice1: ARRAY[300] OF Decimal;
        DiscountPercent1: ARRAY[300] OF Decimal;
        SalesHeaderTemp: Record 36;
        Coupon: Record 70009708;
        SalesPriceDecimal: ARRAY[1000] OF Decimal;
        PriceDecimal: ARRAY[1000] OF Decimal;
        "Discount%": ARRAY[1000] OF Decimal;
        InventoryDecimal: ARRAY[1000] OF Decimal;
        LineTotalDecimal: ARRAY[1000] OF Decimal;
        InvDiscountDecimal: Decimal;
        TaxAmountDecimal: Decimal;
        ShippingAmountDecimal: Decimal;
        TotalAmountDecimal: Decimal;
        SubTotalDecimal: Decimal;
        WebshopMethods: Codeunit "eShop Methods";
    begin
        TaxAmount := '0';
        InvoiceAmount := '0';
        ShippingAmount := '0';
        InvoiceDiscount := '0';
        IF CouponCode = '' THEN BEGIN
            FOR i := 1 TO ArraySize DO BEGIN
                EshopPricing(ItemNumber[i], VariantCode[i], CustomerNumber, UOM[i], Quantity[i], PriceDecimal[i], SalesPriceDecimal[i], "Discount%"[i]);
                Price[i] := FORMAT(PriceDecimal[i]);
                SalesPrice[i] := FORMAT(SalesPriceDecimal[i]);
                DiscountPercent[i] := FORMAT("Discount%"[i]);
                LineTotalDecimal[i] := (SalesPriceDecimal[i] * Quantity[i]);
                LineTotal[i] := FORMAT(LineTotalDecimal[i]);
            END;

            IF NOT CallFromCartPage THEN BEGIN
                GetTotals(0, QuoteNo, SubTotalDecimal, InvDiscountDecimal, TaxAmountDecimal, ShippingAmountDecimal, TotalAmountDecimal);
                TaxAmount := FORMAT(TaxAmountDecimal);
                InvoiceAmount := FORMAT(TotalAmountDecimal);
                ShippingAmount := FORMAT(ShippingAmountDecimal);
                InvoiceDiscount := FORMAT(InvDiscountDecimal);
                IF SalesHeader.GET(0,QuoteNo) then
                  WebshopMethods.CreateWebShippingLine(SalesHeader);
            END;

        END ELSE BEGIN
            LineNo := 10000;
            SalesHeader.INIT;
            SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
            EShopSetup.GET;
            SalesHeader.VALIDATE("No.", NoSeriesMgnt.GetNextNo(EShopSetup."Quote No. Series", TODAY, TRUE));
            SalesHeader.INSERT(TRUE);
            SalesHeader.VALIDATE("Order Date", TODAY);
            IF CustomerNumber = '' THEN
                SalesHeader.VALIDATE("Sell-to Customer No.", EShopSetup."Web Customer Code")
            ELSE
                SalesHeader.VALIDATE("Sell-to Customer No.", CustomerNumber);

            CLEAR(SalesHeaderTemp);
            IF SalesHeaderTemp.GET(0, QuoteNo) AND (NOT CallFromCartPage) THEN
                SalesHeader.VALIDATE("Ship-to County", SalesHeaderTemp."Ship-to County");

            SalesHeader.MODIFY;

            FOR i := 1 TO ArraySize DO BEGIN
                SalesLine.INIT;
                SalesLine."Document Type" := SalesLine."Document Type"::Quote;
                SalesLine.VALIDATE("Document No.", SalesHeader."No.");
                SalesLine."Line No." := i;
                SalesLine.Type := SalesLine.Type::Item;
                SalesLine.VALIDATE("No.", ItemNumber[i]);
                SalesLine.VALIDATE("Variant Code", VariantCode[i]);
                SalesLine.VALIDATE(Quantity, Quantity[i]);
                SalesLine.VALIDATE("Unit of Measure Code", UOM[i]);

                SalesPrice[i] := FORMAT(SalesLine."Unit Price");

                EshopPricing(ItemNumber[i], VariantCode[i], CustomerNumber, UOM[i], Quantity[i], PriceDecimal[i], SalesPriceDecimal[i], "Discount%"[i]);
                Price[i] := FORMAT(PriceDecimal[i]);

                IF NOT Item.GET(ItemNumber[i]) THEN;
                SalesLine.VALIDATE("eShop Category ID", Item."eShop Category ID");
                IF UOM[i] = '' THEN
                    Price[i] := FORMAT(Item."Unit Price")
                ELSE BEGIN
                    IF ItemUOM.GET(ItemNumber[i], UOM[i]) THEN
                        Price[i] := FORMAT(Item."Unit Price" * ItemUOM."Qty. per Unit of Measure");
                END;

                IF SalesLine."Unit Price" > Item."Unit Price" THEN
                    Price[i] := FORMAT(SalesLine."Unit Price");

                DiscountPercent[i] := FORMAT(SalesLine."Line Discount %");
                LineTotal[i] := FORMAT(SalesLine."Line Amount");

                SalesLine.INSERT;
            END;

            IF CouponCode <> '' THEN BEGIN
                SalesHeader."eShop Coupon Code" := CouponCode;
                SalesHeader.MODIFY;
                IF WebshopMethods.ApplyCoupon(SalesHeader) THEN BEGIN
                    Response := Text004;
                    i := 1;
                    CLEAR(SalesLine);
                    SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Quote);
                    SalesLine.SETRANGE("Document No.", SalesHeader."No.");
                    IF SalesLine.FINDFIRST THEN
                        REPEAT
                            SalesPrice[i] := FORMAT(SalesLine."Unit Price");
                            DiscountPercent[i] := FORMAT(SalesLine."Line Discount %");
                            LineTotal[i] := FORMAT(SalesLine."Line Amount");
                            i := i + 1;
                        UNTIL SalesLine.NEXT = 0;
                END ELSE
                    Response := Text005;
            END;

            GetTotals(0, SalesHeader."No.", SubTotalDecimal, InvDiscountDecimal, TaxAmountDecimal, ShippingAmountDecimal, TotalAmountDecimal);
            TaxAmount := FORMAT(TaxAmountDecimal);
            InvoiceAmount := FORMAT(TotalAmountDecimal);
            ShippingAmount := FORMAT(ShippingAmountDecimal);
            InvoiceDiscount := FORMAT(InvDiscountDecimal);
            InvoiceDiscount := FORMAT(0); // Update InvoiceDiscount as zero when coupon allied DESSG
            SalesHeader.DELETE(TRUE);
        END;

        for i := 1 to ArraySize do begin
            JObject.Add('ItemNumber', ItemNumber[i]);
            JObject.Add('VariantCode', VariantCode[i]);
            JObject.Add('CustomerNumber', CustomerNumber);
            JObject.Add('Quantity', Quantity[i]);
            JObject.Add('UOM', UOM[i]);
            JObject.Add('QuoteNo', QuoteNo);
            JObject.Add('CallFromCartPage', CallFromCartPage);
            JObject.Add('Price', Price[i]);
            JObject.Add('SalesPrice', SalesPrice[i]);
            JObject.Add('DiscountPercent', DiscountPercent[i]);
            JObject.Add('LineTotal', LineTotal[i]);
            JObject.Add('InvoiceDiscount', InvoiceDiscount);
            JObject.Add('TaxAmount', TaxAmount);
            JObject.Add('ShippingAmount', ShippingAmount);
            JObject.Add('InvoiceAmount', InvoiceAmount);
            JObject.Add('ArraySize', ArraySize);
            JObject.Add('CouponCode', CouponCode);
            JObject.Add('Response', Response);
            JArray.Add(JObject);
            CLEAR(JObject);
        END;
        JObject.Add('GetCartPrices', JArray);
        JObject.WriteTo(Json);
    end;

    procedure GetShiptoNextCode(CustomerNumber: Code[20]): Code[10];
    var
        ShipTo: Record 222;
    begin
        ShipTo.SETRANGE("Customer No.", CustomerNumber);
        IF ShipTo.FINDFIRST THEN
            EXIT('00' + FORMAT(ShipTo.COUNT + 1))
        ELSE
            EXIT('001')
    end;

    procedure SubmitOrder(QuoteNumber: Code[20]; var OrderNumber: Code[20]; AuthorizationTransactionCode: text[1024]; AuthorizationTransactionId: text[1024]; eshopOrderid: text[1024]);
    var
        SalesHeader: Record 36;
        SalesHeader2: Record 36;
        SalesQuoteToOrder: Codeunit 86;
    begin
        IF SalesHeader.GET(0, QuoteNumber) THEN BEGIN
            SalesHeader.VALIDATE("eShop Transaction Reference", AuthorizationTransactionCode);
            SalesHeader.Validate("eShop Gift Card 2 No.", AuthorizationTransactionId);
            SalesHeader.Validate("eShop Web Order No.", eshopOrderid);
            SalesHeader.Modify();
            SalesHeader.CALCFIELDS("eShop Web CC Encrypted");
            SalesQuoteToOrder.RUN(SalesHeader);
            SalesQuoteToOrder.GetSalesOrderHeader(SalesHeader2);
            OrderNumber := SalesHeader2."No.";
            UpdateOrder(SalesHeader2);
        END ELSE
            ERROR(Text006, QuoteNumber);
    end;

    procedure WebReports(ReportID: Code[20]; Number: Code[20]; StartDate: Code[20]; EndDate: Code[20]; ERPUserID: Code[20]; ERPCustomerNumber: Code[20]; var FileWithBigText: BigText): Text[250];
    var
        FileName: Text[1024];
        ESSetup: Record 70009700;
        ReportIDInt: Integer;
        CustRec: Record 18;
        SDate: Date;
        EDate: Date;
        SalesInvoice: Record 112;
        SH: Record 36;
        NvOutStream: OutStream;
        NvRecRef: RecordRef;
        XmlParameters: Text;
        Content: File;

    begin
        EVALUATE(ReportIDInt, ReportID);
        IF ReportIDInt = 10072 THEN BEGIN
            CLEAR(CustRec);
            CustRec.SETRANGE("No.", ERPCustomerNumber);
            IF StartDate <> 'NULL' THEN
                EVALUATE(SDate, StartDate);
            IF EndDate <> 'NULL' THEN
                EVALUATE(EDate, EndDate);
            IF (SDate <> 0D) OR (EDate <> 0D) THEN
                CustRec.SETRANGE("Date Filter", SDate, EDate)
            ELSE
                CustRec.SETRANGE("Date Filter", DMY2DATE(2, 1, 1), TODAY);
            IF CustRec.FindSet() THEN begin
                Clear(NvRecRef);
                NvRecRef.GetTable(CustRec);
                Glotempblob.Blob.CreateOutStream(NvOutStream);
                Report.SaveAs(ReportIDInt, '', ReportFormat::Pdf, NVOutStream, NvRecRef);
                Glotempblob.Insert();
            end;
        END;
        IF ReportIDInt = 10074 THEN BEGIN
            CLEAR(SalesInvoice);
            IF Number <> 'NULL' THEN
                SalesInvoice.SETRANGE("No.", Number)
            ELSE BEGIN
                IF ERPCustomerNumber <> '' THEN
                    SalesInvoice.SETRANGE("Sell-to Customer No.", ERPCustomerNumber);
                IF StartDate <> 'NULL' THEN
                    EVALUATE(SDate, StartDate);
                IF EndDate <> 'NULL' THEN
                    EVALUATE(EDate, EndDate);
                IF (SDate <> 0D) OR (EDate <> 0D) THEN
                    SalesInvoice.SETRANGE("Posting Date", SDate, EDate);
            END;
            IF SalesInvoice.FindSet() THEN begin
                Clear(NvRecRef);
                NvRecRef.GetTable(SalesInvoice);
                Glotempblob.Blob.CreateOutStream(NvOutStream);
                Report.SaveAs(ReportIDInt, '', ReportFormat::Pdf, NVOutStream, NvRecRef);
                Glotempblob.Insert();
            end;

        END;
        IF ReportIDInt = 10075 THEN BEGIN
            CLEAR(SH);
            IF Number <> 'NULL' THEN
                SH.SETRANGE("No.", Number)
            ELSE BEGIN
                IF ERPCustomerNumber <> '' THEN
                    SH.SETRANGE("Sell-to Customer No.", ERPCustomerNumber);
                IF StartDate <> 'NULL' THEN
                    EVALUATE(SDate, StartDate);
                IF EndDate <> 'NULL' THEN
                    EVALUATE(EDate, EndDate);
                IF (SDate <> 0D) OR (EDate <> 0D) THEN
                    SH.SETRANGE("Order Date", SDate, EDate);
            END;
            IF SH.FindSet() THEN begin
                Clear(NvRecRef);
                NvRecRef.GetTable(SH);
                Glotempblob.Blob.CreateOutStream(NvOutStream);
                Report.SaveAs(ReportIDInt, '', ReportFormat::Pdf, NVOutStream, NvRecRef);
                Glotempblob.Insert();
            end;

        END;
        ConvertPDF2BigText(Glotempblob, FileWithBigText);
        EXIT(FileName);
    end;

    procedure SendReqMailtoSP(CustNoPar: Code[20]; ItmNoPar: ARRAY[20] OF Code[20]; Customeremail: Text[50]; Message: Text[1024]);
    var
        Custrec: Record 18;
        SPRec: Record 13;
        SMTP: Codeunit 400;
        Item: Record 27;
        EhopSetup: Record 70009700;
    begin
        CLEAR(Custrec);
        EhopSetup.GET;
        IF CustNoPar <> '' THEN BEGIN
            Custrec.GET(CustNoPar);
            IF Custrec."Salesperson Code" <> '' THEN BEGIN
                CLEAR(SPRec);
                SPRec.GET(Custrec."Salesperson Code");
                IF SPRec."E-Mail" <> '' THEN BEGIN
                    SMTP.CreateMessage(Text020, EhopSetup."Sender E-Mail ID", SPRec."E-Mail", STRSUBSTNO(Subjecttext, TODAY), Text008, TRUE);
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(STRSUBSTNO(CustNametext, Custrec.Name));
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(STRSUBSTNO(ContactNotext, Custrec."Phone No."));
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(STRSUBSTNO("E-mailtext", Custrec."E-Mail"));
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(STRSUBSTNO(Addresstext, Custrec.Address + Custrec."Address 2"));
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(Text007);
                    SMTP.AppendBody('<br>');
                    SMTP.AppendBody(STRSUBSTNO(ItemNoText));
                    SMTP.AppendBody('<br>');
                    FOR i := 1 TO ARRAYLEN(ItmNoPar) DO BEGIN
                        CLEAR(Item);
                        Item.GET(ItmNoPar[i]);
                        SMTP.AppendBody(ItmNoPar[i] + '' + Item.Description);
                        SMTP.AppendBody('<br>');
                    END;
                    SMTP.Send;
                END;
            END ELSE BEGIN
                CLEAR(SPRec);
                SPRec.GET(SPRec.Code);
                SMTP.CreateMessage(Text020, EhopSetup."Sender E-Mail ID", EhopSetup."Default SalesPerson E-Mail",
                                                    STRSUBSTNO(Subjecttext, TODAY), Text008, TRUE);
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(STRSUBSTNO(CustNametext, Custrec.Name));
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(STRSUBSTNO(ContactNotext, Custrec."Phone No."));
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(STRSUBSTNO("E-mailtext", Custrec."E-Mail"));
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(STRSUBSTNO(Addresstext, Custrec.Address + Custrec."Address 2"));
                SMTP.AppendBody('<br>');
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(Text007);
                SMTP.AppendBody('<br>');
                SMTP.AppendBody(STRSUBSTNO(ItemNoText));
                SMTP.AppendBody('<br>');
                FOR i := 1 TO ARRAYLEN(ItmNoPar) DO BEGIN
                    CLEAR(Item);
                    Item.GET(ItmNoPar[i]);
                    SMTP.AppendBody(ItmNoPar[i] + '' + Item.Description);
                    SMTP.AppendBody('<br>');

                END;

                SMTP.Send;
            END;
        END;
    end;

    procedure CustomerVolumediscounts(CustNoPar: Code[20]; ItmNoPar: Code[20]; Qunatityloc: ARRAY[20] OF Decimal; Priceloc: ARRAY[20] OF Decimal) Json: Text;
    var
        SalesPrices: Record 7002;
        Found: Boolean;
    begin
        CLEAR(SalesPrices);
        CLEAR(Qunatityloc);
        CLEAR(Priceloc);
        CLEAR(Found);
        SalesPrices.SETRANGE(SalesPrices."Sales Type", SalesPrices."Sales Type"::Customer);
        SalesPrices.SETRANGE(SalesPrices."Sales Code", CustNoPar);
        SalesPrices.SETFILTER(SalesPrices."Ending Date", '>%1', TODAY);
        SalesPrices.SETFILTER("Starting Date", '<%1', TODAY);
        SalesPrices.SETRANGE(SalesPrices."Item No.", ItmNoPar);
        i := 1;

        IF SalesPrices.FINDSET THEN REPEAT
                                        Qunatityloc[i] := SalesPrices."Minimum Quantity";
                                        Priceloc[i] := SalesPrices."Unit Price";
                                        Found := TRUE;
                                        JObject.Add('CustNoPar', CustNoPar);
                                        JObject.Add('ItmNoPar', ItmNoPar);
                                        JObject.Add('Qunatityloc', Qunatityloc[i]);
                                        JObject.Add('Priceloc', Priceloc[i]);
                                        JArray.Add(JObject);
                                        CLEAR(JObject);
            UNTIL SalesPrices.NEXT = 0;

        IF NOT Found THEN BEGIN
            CLEAR(SalesPrices);
            SalesPrices.SETRANGE("Sales Type", SalesPrices."Sales Type"::"Customer Price Group");
            SalesPrices.SETRANGE(SalesPrices."Item No.", ItmNoPar);
            SalesPrices.SETFILTER(SalesPrices."Ending Date", '>%1', TODAY);
            SalesPrices.SETFILTER("Starting Date", '<%1', TODAY);
            i := 1;
            IF SalesPrices.FINDSET THEN REPEAT
                                            Qunatityloc[i] := SalesPrices."Minimum Quantity";
                                            Priceloc[i] := SalesPrices."Unit Price";
                                            Found := TRUE;
                                            JObject.Add('CustNoPar', CustNoPar);
                                            JObject.Add('ItmNoPar', ItmNoPar);
                                            JObject.Add('Qunatityloc', Qunatityloc[i]);
                                            JObject.Add('Priceloc', Priceloc[i]);
                                            JArray.Add(JObject);
                                            CLEAR(JObject);
                UNTIL SalesPrices.NEXT = 0;
        END;

        IF NOT Found THEN BEGIN
            CLEAR(SalesPrices);
            SalesPrices.SETRANGE("Sales Type", SalesPrices."Sales Type"::"All Customers");
            SalesPrices.SETRANGE(SalesPrices."Item No.", ItmNoPar);
            SalesPrices.SETFILTER(SalesPrices."Ending Date", '>%1', TODAY);
            SalesPrices.SETFILTER("Starting Date", '<%1', TODAY);
            i := 1;
            IF SalesPrices.FINDSET THEN REPEAT
                                            Qunatityloc[i] := SalesPrices."Minimum Quantity";
                                            Priceloc[i] := SalesPrices."Unit Price";
                                            Found := TRUE;
                                            JObject.Add('CustNoPar', CustNoPar);
                                            JObject.Add('ItmNoPar', ItmNoPar);
                                            JObject.Add('Qunatityloc', Qunatityloc[i]);
                                            JObject.Add('Priceloc', Priceloc[i]);
                                            JArray.Add(JObject);
                                            CLEAR(JObject);
                UNTIL SalesPrices.NEXT = 0;
        END;
        JObject.Add('CustomerVolumediscounts', JArray);
        JObject.WriteTo(Json);
    end;

    local procedure "---- Calculation ----"();
    begin
    end;

    local procedure EshopPricing(Var ItemNumber: Code[20]; VariantCode: Code[20]; CustomerNumber: Code[20]; UOM: Code[20]; Quantity: Decimal; var Price: Decimal; var SalesPrice: Decimal; var "Discount%": Decimal);
    var
        ItemRec: Record 27;
        Text001: Label 'Item No %1 Does Not Exist';
        SalesPriceCalc: Codeunit 70009706;
        CustomerRec: Record 18;
        BillToCustomer: Code[20];
    begin

        IF NOT ItemRec.GET(ItemNumber) THEN
            ERROR(Text001, ItemNumber);

        IF UOM = '' THEN
            Price := ItemRec."Unit Price"
        ELSE BEGIN
            IF ItemUOM.GET(ItemNumber, UOM) THEN
                Price := ItemRec."Unit Price" * ItemUOM."Qty. per Unit of Measure";
        END;
        CLEAR(BillToCustomer);
        CLEAR(CustomerRec);
        IF CustomerRec.GET(CustomerNumber) THEN
            IF CustomerRec."Bill-to Customer No." <> '' THEN
                BillToCustomer := CustomerRec."Bill-to Customer No.";

        IF BillToCustomer <> '' THEN
            SalesPrice := SalesPriceCalc.FindWebSalesPrice(ItemNumber, COPYSTR(VariantCode, 1, 10), BillToCustomer, Quantity, UOM)
        ELSE
            SalesPrice := SalesPriceCalc.FindWebSalesPrice(ItemNumber, COPYSTR(VariantCode, 1, 10), CustomerNumber, Quantity, UOM);
        IF BillToCustomer <> '' THEN
            "Discount%" := SalesPriceCalc.FindWebSalesDiscount(ItemNumber, COPYSTR(VariantCode, 1, 10), BillToCustomer, Quantity, UOM)
        ELSE
            "Discount%" := SalesPriceCalc.FindWebSalesDiscount(ItemNumber, COPYSTR(VariantCode, 1, 10), CustomerNumber, Quantity, UOM);
        IF "Discount%" <> 0 THEN BEGIN
            SalesPrice := SalesPrice - (SalesPrice * ("Discount%" / 100));
            "Discount%" := 0;
        END;

        IF Price < SalesPrice THEN
            Price := SalesPrice;
        IF SalesPrice = 0 THEN
            SalesPrice := Price;
    end;

    procedure GetItemInventory(ItemNumber: Code[20]; VariantCode: Code[20]; UOM: Code[20]; var QuantityAvailable: Decimal);
    var
        AvailtoPromise: Codeunit 5790;
        Item: Record 27;
        GrossReq: Decimal;
        SchedRec: Decimal;
        DateFor: DateFormula;
    begin
        IF NOT Item.GET(ItemNumber) THEN
            ERROR(Text001, ItemNumber);

        EShopSetup.GET;
        Item.SETFILTER("Date Filter", '%1..%2', 0D, TODAY);
        Item.SETFILTER("Location Filter", EShopSetup."Default Inventory Location");
        Item.SETFILTER("Variant Filter", VariantCode);
        IF EShopSetup."Available Inventory" THEN BEGIN
            QuantityAvailable := AvailtoPromise.QtyAvailabletoPromise(Item, GrossReq, SchedRec, TODAY, 0, DateFor)
        END ELSE BEGIN
            IF UOM = '' THEN BEGIN
                Item.CALCFIELDS(Inventory, "Qty. on Sales Order");
                QuantityAvailable := Item.Inventory - Item."Qty. on Sales Order";
            END ELSE BEGIN
                Item.CALCFIELDS(Inventory, "Qty. on Sales Order");
                IF ItemUOM.GET(ItemNumber, UOM) THEN
                    QuantityAvailable := (Item.Inventory - Item."Qty. on Sales Order") / ItemUOM."Qty. per Unit of Measure";
            END;
        END;
        QuantityAvailable := ROUND(QuantityAvailable, 1, '<');
        IF QuantityAvailable < 0 THEN
            QuantityAvailable := 0;
    end;

    procedure GetTaxAmountSO(SalesOrderNumber: Code[20]; var Type: Text[3]; var Amount: Decimal);
    var
        SalesHeader: Record 36;
        WebshopMethods: Codeunit "eShop Methods";
    begin
        IF NOT SalesHeader.GET(1, SalesOrderNumber) THEN
            ERROR(Text003, SalesOrderNumber)
        ELSE
            IF SalesHeader."Tax Area Code" = '' THEN BEGIN
                Type := 'VAT';
                Amount := WebshopMethods.GetVatAmountSO(SalesHeader);
            END ELSE BEGIN
                Type := 'Tax';
                Amount := WebshopMethods.GetTaxAmountSO(SalesHeader);
            END;
    end;

    procedure GetTotals(Type: Integer; Number: Code[20]; var SubTotal: Decimal; var InvoiceDiscount: Decimal; var TaxAmount: Decimal; var ShippingAmount: Decimal; var TotalAmount: Decimal);
    var
        SalesHeader: Record 36;
        CustInvoiceDisc: Record 19;
        WebshopMethods: Codeunit "eShop Methods";
    begin
        SalesHeader.SETRANGE("No.", Number);
        IF SalesHeader.FINDFIRST THEN BEGIN
            TaxAmount := WebshopMethods.GetTaxAmountSalesOrder(SalesHeader."No.");
            IF SalesHeader."Invoice Discount Value" <> 0 THEN
                InvoiceDiscount := WebshopMethods.GetTotalOrderAmount(SalesHeader) * (SalesHeader."Invoice Discount Value" / 100)
            ELSE BEGIN
                CLEAR(CustInvoiceDisc);
                CustInvoiceDisc.SETRANGE(CustInvoiceDisc.Code, SalesHeader."Bill-to Customer No.");
                CustInvoiceDisc.SETFILTER("Minimum Amount", '<=%1', TotalAmount);
                IF CustInvoiceDisc.FINDLAST THEN
                    InvoiceDiscount := WebshopMethods.GetTotalOrderAmount(SalesHeader) * (CustInvoiceDisc."Discount %" / 100);
            END;
            TotalAmount := WebshopMethods.GetTotalOrderAmountIncTax(SalesHeader);
        END;
    end;

    local procedure "---- Local ----"();
    begin
    end;

    local procedure UpdateOrder(Salesheader: Record 36);
    var
        Salesline: Record 37;
        Salesline1: Record 37;
        LineNo: Integer;
        SalesSetup: Record 311;
        ESSetup: Record 70009700;
        ESDiscount: Record 70009705;
        EMethods: Codeunit "eShop Methods";
    begin
        Salesheader.VALIDATE("Order Date", TODAY);
        Salesheader.VALIDATE("Ship-to County");
        IF Salesheader."eShop Coupon Code 1" <> '' THEN BEGIN
            Salesheader.VALIDATE("eShop Coupon Code 1");
        END;

        Salesheader.MODIFY;

        CLEAR(Salesline);
        Salesline.SETRANGE("Document Type", Salesheader."Document Type");
        Salesline.SETRANGE("Document No.", Salesheader."No.");
        Salesline.SETRANGE("No.", '');
        Salesline.DELETEALL;

        //Shipping Amount Line
        /*IF Salesheader."eShop Shipping Amount" <> 0 THEN BEGIN
            CLEAR(Salesline);
            Salesline.SETRANGE("Document Type", Salesheader."Document Type");
            Salesline.SETRANGE("Document No.", Salesheader."No.");
            IF Salesline.FINDLAST THEN
                LineNo := Salesline."Line No.";
            Salesline1.INIT;
            Salesline1.VALIDATE("Document Type", Salesheader."Document Type");
            Salesline1.VALIDATE("Document No.", Salesheader."No.");
            LineNo += 10000;
            Salesline1."Line No." := LineNo;
            ESSetup.GET;
            Salesline1.VALIDATE(Type, Salesline1.Type::"G/L Account");
            Salesline1.VALIDATE("No.", ESSetup."Web Shipping GL No.");
            Salesline1.VALIDATE(Quantity, 1);
            Salesline1.VALIDATE("Unit Price", Salesheader."eShop Shipping Amount");
            Salesline1.INSERT(TRUE);
        END;*/

        //Tax Amount Line
        IF Salesheader."eShop Tax Amount" <> 0 THEN BEGIN
            CLEAR(Salesline);
            Salesline.SETRANGE("Document Type", Salesheader."Document Type");
            Salesline.SETRANGE("Document No.", Salesheader."No.");
            IF Salesline.FINDLAST THEN
                LineNo := Salesline."Line No.";
            Salesline1.INIT;
            Salesline1.VALIDATE("Document Type", Salesheader."Document Type");
            Salesline1.VALIDATE("Document No.", Salesheader."No.");
            LineNo += 10000;
            Salesline1."Line No." := LineNo;
            ESSetup.GET;
            Salesline1.VALIDATE(Type, Salesline1.Type::"G/L Account");
            Salesline1.VALIDATE("No.", ESSetup."Web Tax GL No.");
            Salesline1.VALIDATE(Quantity, 1);
            Salesline1.VALIDATE("Unit Price", Salesheader."eShop Tax Amount");
            Salesline1.INSERT(TRUE);
        END;
        //Discounts and Giftcards Line
        CLEAR(ESDiscount);
        ESDiscount.SETRANGE("Document Type", ESDiscount."Document Type"::Quote);
        ESDiscount.SETRANGE("Document No.", Salesheader."Quote No.");
        IF ESDiscount.FINDFIRST THEN
            REPEAT
                CLEAR(Salesline);
                Salesline.SETRANGE("Document Type", Salesheader."Document Type");
                Salesline.SETRANGE("Document No.", Salesheader."No.");
                IF Salesline.FINDLAST THEN
                    LineNo := Salesline."Line No.";
                Salesline1.INIT;
                Salesline1.VALIDATE("Document Type", Salesheader."Document Type");
                Salesline1.VALIDATE("Document No.", Salesheader."No.");
                LineNo += 10000;
                Salesline1."Line No." := LineNo;
                ESSetup.GET;
                Salesline1.VALIDATE(Type, Salesline1.Type::"G/L Account");
                IF ESDiscount.Type = ESDiscount.Type::"Coupon Code" THEN BEGIN
                    Salesline1.VALIDATE("No.", ESSetup."Web Coupon Code GL No.");
                    Salesline1.Description := 'Coupon :' + ESDiscount.Code;
                    Salesheader."eShop Coupon Code 1" := ESDiscount.Code;
                END ELSE BEGIN
                    Salesline1.VALIDATE("No.", ESSetup."Gift Card GL No.");
                    Salesline1.Description := 'Gift Card :' + ESDiscount.Code;
                END;
                Salesline1.VALIDATE(Quantity, -1);
                Salesline1.VALIDATE("Unit Price", ESDiscount.Amount);
                Salesline1.INSERT(TRUE);
            UNTIL ESDiscount.NEXT = 0;
    end;

    local procedure GetCustProductPricesArray(ItemNumber: Code[20]; var VariantCode: ARRAY[1000] OF Code[20]; CustomerNumber: Code[20]; Quantity: Decimal; var UOM: ARRAY[1000] OF Code[20]; var Price: ARRAY[1000] OF Text[30]; var SalesPrice: ARRAY[1000] OF Text[30]; var DiscountPercent: ARRAY[1000] OF Text[30]; var Inventory: ARRAY[1000] OF Text[30]; var ArraySize: Integer);
    var
        SalesHeader: Record 36;
        SalesLine: Record 37;
        NoSeriesMgnt: Codeunit 396;
        LineNo: Integer;
        Type: Text[30];
        Item: Record 27;
        TempSalesPrice: Record 7002 TEMPORARY;
        SalesPriceCalc: Codeunit 70009706;
        TempSalesLineDisc: Record 7004 TEMPORARY;
        Customer: Record 18;
        ItemUOM: Record 5404;
        ItemVariant: Record 5401;
    begin
        //Future Function for returning the array of item
        CLEAR(ItemUOM);
        CLEAR(VariantCode);
        Quantity := 1;
        i := 0;
        ItemUOM.SETRANGE("Item No.", ItemNumber);
        ItemUOM.SETRANGE("eShop Published", TRUE);
        IF ItemUOM.FINDFIRST THEN
            REPEAT
                CLEAR(ItemVariant);
                ItemVariant.SETRANGE("Item No.", ItemNumber);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        i := i + 1;
                        Item.SETFILTER("Date Filter", '%1..%2', 0D, TODAY);
                        Item.SETFILTER("Variant Filter", ItemVariant.Code);
                        Item.CALCFIELDS(Inventory);
                        VariantCode[i] := ItemVariant.Code;
                        UOM[i] := ItemUOM.Code;
                        IF ItemUOM.GET(ItemNumber, UOM[i]) THEN
                            Price[i] := FORMAT(Item."Unit Price" * ItemUOM."Qty. per Unit of Measure");
                        SalesPrice[i] := FORMAT(SalesPriceCalc.FindWebSalesPrice(ItemNumber, VariantCode[i], CustomerNumber, Quantity, UOM[i]));
                        DiscountPercent[i] := FORMAT(SalesPriceCalc.FindWebSalesDiscount(ItemNumber, VariantCode[i], CustomerNumber, Quantity, UOM[i]));
                        Inventory[i] := FORMAT(Item.Inventory);
                    UNTIL ItemVariant.NEXT = 0
                ELSE BEGIN
                    i := i + 1;
                    VariantCode[i] := '';
                    UOM[i] := ItemUOM.Code;
                    IF ItemUOM.GET(ItemNumber, UOM[i]) THEN
                        Price[i] := FORMAT(Item."Unit Price" * ItemUOM."Qty. per Unit of Measure");
                    SalesPrice[i] := FORMAT(SalesPriceCalc.FindWebSalesPrice(ItemNumber, VariantCode[i], CustomerNumber, Quantity, UOM[i]));
                    DiscountPercent[i] := FORMAT(SalesPriceCalc.FindWebSalesDiscount(ItemNumber, VariantCode[i], CustomerNumber, Quantity, UOM[i]));
                    Inventory[i] := FORMAT(Item.Inventory);
                END;
            UNTIL ItemUOM.NEXT = 0;
        ArraySize := i;
    end;

    local procedure GetItemInventorybLoc(ItemNumber: Code[20]; VariantCode: Code[20]; UOM: Code[20]; var QtyAvailableArray: ARRAY[20] OF Text[30]; var LocationArray: ARRAY[20] OF Code[20]);
    var
        AvailtoPromise: Codeunit 5790;
        Item: Record 27;
        GrossReq: Decimal;
        SchedRec: Decimal;
        DateFor: DateFormula;
    begin
        IF NOT Item.GET(ItemNumber) THEN
            ERROR(Text001, ItemNumber);

        i := 0;
        CLEAR(QtyAvailableArray);
        IF Location.FINDSET THEN REPEAT
                                     i += 1;
                                     LocationArray[i] := Location.Code;
                                     IF UOM = '' THEN BEGIN
                                         Item.SETFILTER("Location Filter", Location.Code);
                                         Item.CALCFIELDS(Inventory, "Qty. on Sales Order");
                                         QtyAvailableArray[i] := FORMAT(Item.Inventory - Item."Qty. on Sales Order");
                                     END ELSE BEGIN
                                         IF Location.Code <> '' THEN
                                             Item.SETFILTER("Location Filter", Location.Code);
                                         Item.CALCFIELDS(Inventory, "Qty. on Sales Order");
                                         IF ItemUOM.GET(ItemNumber, UOM) THEN
                                             QtyAvailableArray[i] := FORMAT((Item.Inventory - Item."Qty. on Sales Order") / ItemUOM."Qty. per Unit of Measure");
                                     END;
            UNTIL Location.NEXT = 0;
    end;

    local procedure ConvertPDF2BigText(TempBlob: Record TempBlob; var ReportWIthBigText: BigText);
    var

    begin
        Clear(ReportWIthBigText);
        TempBlob.CalcFields(Blob);
        ReportWIthBigText.AddText(TempBlob.ToBase64String());
        TempBlob.Delete;
    end;

    procedure Checkout(HeaderData: BigText; LineData: BigText; DiscountData: BigText; var QuoteNo: Code[30])
    var
        Customer: Record Customer;
        JObject: JsonObject;
        JArray: JsonArray;
        JToken: JsonToken;
        jValue: JsonValue;
        ListOfTokens: List of [JsonToken];
        JObject1: JsonObject;
        i: Integer;
        JTocken1: JsonToken;
        Json: Text;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
        eShopDiscountCodes: Record "eShop Discount Codes";
    begin
        IF QuoteNo <> '' then begin
            IF SalesHeader.get(0, QuoteNo) then
                SalesHeader.Delete(true);
        END;

        IF HeaderData.Length() <> 0 then BEGIN
            JObject.ReadFrom(FORMAT(HeaderData));
            IF JObject.Contains('JsonCheckoutSalesheader') then begin
                JObject.Get('JsonCheckoutSalesheader', JToken);
                JToken.WriteTo(Json);
                Message(Json);
                JObject1 := JToken.AsObject();
                ListOfTokens := JObject1.Values();
                Clear(JToken);
                SalesHeader.Init;
                SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Quote);
                SalesHeader.Insert(true);
                foreach JToken in listoftokens Do begin
                    FillSalesHeader(SalesHeader, JToken);
                End;
                SalesHeader.Modify();
                QuoteNo := SalesHeader."No.";
            end;
        END;
        if LineData.Length() <> 0 THEN begin
            Clear(JObject);
            Clear(JToken);
            Clear(JObject1);
            Clear(JTocken1);
            JObject.ReadFrom(FORMAT(LineData));
            IF JObject.Contains('JsonCheckoutSaleQuoteLines') then begin
                JObject.Get('JsonCheckoutSaleQuoteLines', JToken);
                JToken.WriteTo(Json);
                Message(Json);
                JArray := JToken.AsArray();
                Message(Format(JArray.Count()));
                for i := 0 to JArray.Count() DO begin
                    IF JArray.Get(i, JTocken1) then begin
                        JObject1 := JTocken1.AsObject();
                        ListOfTokens := JObject1.Values();
                        LineNo := LineNo + 10000;
                        SalesLine.Init();
                        SalesLine.Validate("Document Type", SalesHeader."Document Type");
                        SalesLine.Validate("Document No.", SalesHeader."No.");
                        SalesLine.Validate("Line No.", Lineno);
                        foreach JToken in listoftokens Do begin
                            FillSalesLine(SalesLine, JToken, i);
                        end;
                        SalesLine.Insert();
                    end;
                end;
            end;
        end;
        if DiscountData.Length() <> 0 THEN begin
            Clear(JObject);
            Clear(JToken);
            Clear(JObject1);
            Clear(JTocken1);
            JObject.ReadFrom(FORMAT(DiscountData));
            IF JObject.Contains('JsonCheckoutDiscountLines') then begin
                JObject.Get('JsonCheckoutDiscountLines', JToken);
                JToken.WriteTo(Json);
                Message(Json);
                JArray := JToken.AsArray();
                Message(Format(JArray.Count()));
                for i := 0 to JArray.Count() DO begin
                    IF JArray.Get(i, JTocken1) then begin
                        JObject1 := JTocken1.AsObject();
                        ListOfTokens := JObject1.Values();
                        LineNo := LineNo + 10000;
                        eShopDiscountCodes.Init();
                        eShopDiscountCodes.Validate("Document Type", SalesHeader."Document Type");
                        eShopDiscountCodes.Validate("Document No.", SalesHeader."No.");
                        eShopDiscountCodes.Validate("Line No.", Lineno);
                        foreach JToken in listoftokens Do begin
                            FillSalesDiscountLine(eShopDiscountCodes, JToken, i);
                        end;
                        eShopDiscountCodes.Insert();
                    end;
                end;
            end;
        end;
    end;

    procedure FillSalesHeader(Var SalesHeader: Record "Sales Header"; Var Jtoken: JsonToken);
    var
        Json: Text;
        EshopMethods: Codeunit "eShop Methods";
    begin
        Json := '';
        with SalesHeader do begin
            IF JToken.Path() = 'JsonCheckoutSalesheader.Sell_to_Customer_No' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate("Sell-to Customer No.", Delchr(Json, '=', '"'));
                    Validate("eShop Web Order", true);
                end;
            end;

            IF JToken.Path() = 'JsonCheckoutSalesheader.E_Shop_Login_Email' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Login Email", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Name' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    "Bill-to Name" := Delchr(Json, '=', '"');

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Address' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to Address", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Address_2' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to Address 2", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_City' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to City", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_County' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to County", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Post_Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to Post Code", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Contact' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to Contact", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Bill_to_Country_Region_Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Bill-to Country/Region Code", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("Ship-to Code", Delchr(Json, '=', '"'));
            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Name' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Name", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Address' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Address", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Address_2' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Address 2", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_City' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to City", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_County' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to County", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Post_Code' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Post Code", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Contact' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Contact", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Ship_to_Country_Region_Code' then begin
                JToken.WriteTo(Json);
                IF (Json <> 'null') and ("Ship-to Code" = '') then
                    Validate("Ship-to Country/Region Code", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.CC_Card_Type' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    IF Evaluate("eShop CC Card Type", Delchr(Json, '=', '"')) then;
            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Web_CC' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Web CC", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Web_CC_Name' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Web CC Name", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.CC_Expiration_Month' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop CC Expiration Month", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.CC_Expiration_Year' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop CC Expiration Year", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.CC_Cvv2' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop CC Cvv2", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.eShop_Tax_Amount' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    IF Evaluate("eShop Tax Amount", Delchr(Json, '=', '"')) then;

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.eShop_Shipping_Amount' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    IF Evaluate("eShop Shipping Amount", Delchr(Json, '=', '"')) then;

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.eShop_Paid_With' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Paid With", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.eShop_Transaction_Reference' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Transaction Reference", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Gift_Card_2_No' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Gift Card 2 No.", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.eShop_Shipped_Via' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Shipped Via", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Purchase_Order_No' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("External Document No.", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Web_Order_No' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate("eShop Web Order No.", Delchr(Json, '=', '"'));

            end;
            IF JToken.Path() = 'JsonCheckoutSalesheader.Comments' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    EshopMethods.InsertSalesComments(SalesHeader, Delchr(Json, '=', '"'));

            end;

        end;
    end;

    procedure FillSalesLine(Var SalesLine: Record "Sales Line"; var jtoken: JsonToken; i: Integer);
    var
        Json: Text;
        QtyDecimal: Decimal;
    begin
        Json := '';
        with SalesLine do begin
            IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].No' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate(Type, SalesLine.Type::Item);
                    Validate("No.", Delchr(Json, '=', '"'));
                end;
            end;
            IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].Variant_Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate("Variant Code", Delchr(Json, '=', '"'));
                end;
            end;
            IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].Unit_of_Measure_Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate("Unit of Measure Code", Delchr(Json, '=', '"'));
                end;
            end;
            IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].Quantity' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin

                    IF Evaluate(QtyDecimal, Delchr(Json, '=', '"')) then
                        Validate(Quantity, QtyDecimal);

                end;
            end;
            /*IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].ERPAttributesXML' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate(Type,SalesLine.Type::Item);
                    Validate("No.",Delchr(Json,'=','"'));
                end;
            end;
            IF JToken.Path() = 'JsonCheckoutSaleQuoteLines[' + Format(i) + '].ERPAttributesDescription' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    Validate(Type,SalesLine.Type::Item);
                    Validate("No.",Delchr(Json,'=','"'));
                end;
            end;*/

        end;
    end;

    procedure FillSalesDiscountLine(Var eShopDiscountCodes: Record "eShop Discount Codes"; var jtoken: JsonToken; i: Integer);
    var
        Json: Text;
        QtyDecimal: Decimal;
    begin
        Json := '';
        with eShopDiscountCodes do begin
            IF JToken.Path() = 'JsonCheckoutDiscountLines[' + Format(i) + '].Type' then begin
                JToken.WriteTo(Json);
                IF Json = '0' then
                    Validate(Type, eShopDiscountCodes.Type::"Coupon Code");
                IF Json = '1' then
                    Validate(Type, eShopDiscountCodes.Type::"Gift Card");
            end;
            IF JToken.Path() = 'JsonCheckoutDiscountLines[' + Format(i) + '].Code' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then
                    Validate(Code, Delchr(Json, '=', '"'));
            end;
            IF JToken.Path() = 'JsonCheckoutDiscountLines[' + Format(i) + '].Amount' then begin
                JToken.WriteTo(Json);
                IF Json <> 'null' then begin
                    IF Evaluate(QtyDecimal, Delchr(Json, '=', '"')) then
                        Validate(Amount, QtyDecimal);
                end;
            end;

        end;
    end;

}
codeunit 70009701 "eShop Methods"
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


    trigger OnRun();
    begin
        // CheckLicense;
    end;

    var
        GetEShopSetup: Record 70009700;
        Text002: Label 'Your %1 Order Was Shipped. %2';
        Text003: Label 'Sales Order %1 does not exists.';
        Text004: Label 'Unit Price is Zero, Due you still want to enable?';
        Text005: Label 'eShop Category ID is blank, Due you still want to enable?''';
        Text006: Label 'Push the Publish Button';
        Text007: Label 'Push the Update Button';
        Text008: Label 'EMail doesn''t exist for one or more customers';
        Text009: Label 'Do you want to create E-shop User';
        Cust: Integer;
        SCSText000: Label 'Scs';
        VaBiginteger: BigText;
        Window: Dialog;
        OK: Boolean;
        strngg: Code[500];
        Strngvaraint: Code[500];
        SalesPricesMgmt: Codeunit 7000;

    procedure GetTaxAmountSO(SalesHeader: Record 36): Decimal;
    var
        SalesLine: Record 37;
        TempSalesLine: Record 37 TEMPORARY;
        TempSalesTaxAmtLine: Record 10011 TEMPORARY;
        TaxArea: Record 318;
        SalesTaxCalc: Codeunit 398;
        TaxAmount: Decimal;
    begin
        IF TaxArea.GET(SalesHeader."Tax Area Code") THEN BEGIN
            SalesTaxCalc.StartSalesTaxCalculation;
            SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
            SalesLine.SETRANGE("Document No.", SalesHeader."No.");
            SalesLine.SETFILTER("No.", '<>%1', '');
            SalesLine.SETFILTER("Tax Group Code", '<>%1', '');
            IF SalesLine.FINDSET THEN BEGIN
                REPEAT
                    TempSalesLine := SalesLine;
                    TempSalesLine.INSERT;
                    IF SalesLine."Tax Area Code" <> '' THEN
                        SalesTaxCalc.AddSalesLine(TempSalesLine);
                UNTIL SalesLine.NEXT = 0;

                SalesTaxCalc.EndSalesTaxCalculation(SalesHeader."Order Date");
                SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
                WITH TempSalesLine DO BEGIN
                    FINDFIRST;
                    REPEAT
                        IF TempSalesLine."Tax Area Code" <> '' THEN
                            TaxAmount += "Amount Including VAT" - Amount;
                    UNTIL TempSalesLine.NEXT = 0;
                END;
            END;
            EXIT(TaxAmount);
        END;
    end;

    procedure GetVatAmountSO(SalesHeader: Record 36): Decimal;
    var
        SalesLine: Record 37;
        TempSalesLine: Record 37 TEMPORARY;
        TaxAmount: Decimal;
        SalesPost: Codeunit 80;
        TempVATAmountLine1: Record 290 TEMPORARY;
        TotalSalesLine: ARRAY[3] OF Record 37;
        TotalSalesLineLCY: ARRAY[3] OF Record 37;
        VATAmount: ARRAY[4] OF Decimal;
        VATAmountText: ARRAY[3] OF Text[30];
        ProfitLCY: ARRAY[3] OF Decimal;
        ProfitPct: ARRAY[3] OF Decimal;
        TotalAdjCostLCY: ARRAY[3] OF Decimal;
    begin
        TempSalesLine.DELETEALL;
        CLEAR(TempSalesLine);
        CLEAR(SalesPost);
        SalesPost.GetSalesLines(SalesHeader, TempSalesLine, 0);
        CLEAR(SalesPost);
        SalesLine.CalcVATAmountLines(0, SalesHeader, TempSalesLine, TempVATAmountLine1);
        SalesPost.SumSalesLinesTemp(
        SalesHeader, TempSalesLine, 0, TotalSalesLine[1], TotalSalesLineLCY[1],
        VATAmount[1], VATAmountText[1], ProfitLCY[1], ProfitPct[1], TotalAdjCostLCY[1]);
        EXIT(VATAmount[1]);
    end;

    procedure GetTaxAmountSalesOrder(SalesOrderNumber: Code[20]) Amount: Decimal;
    var
        SalesHeader: Record 36;
    begin
        IF NOT SalesHeader.GET(1, SalesOrderNumber) AND NOT SalesHeader.GET(0, SalesOrderNumber) THEN
            ERROR(Text003, SalesOrderNumber)
        ELSE
            IF SalesHeader."Tax Area Code" = '' THEN BEGIN
                EXIT(GetVatAmountSO(SalesHeader));
            END ELSE BEGIN
                EXIT(GetTaxAmountSO(SalesHeader));
            END;
    end;

    procedure GetTotalOrderAmountIncTax(SalesHeader: Record 36) Amt: Decimal;
    var
        SL: Record 37;
    begin
        Amt := GetTaxAmountSalesOrder(SalesHeader."No.");
        SL.SETRANGE("Document Type", SalesHeader."Document Type");
        SL.SETRANGE("Document No.", SalesHeader."No.");
        IF SL.FINDSET THEN
            REPEAT
                Amt += SL."Line Amount";
            UNTIL SL.NEXT = 0
    end;

    procedure CheckItemFields(var Item: Record 27);
    var
        Item1: Record 27;
        ItemUOM: Record 5404;
    begin
        Item.TESTFIELD(Description);
        Item.TESTFIELD("Gen. Prod. Posting Group");
        Item.TESTFIELD("Inventory Posting Group");
        //Item.TESTFIELD("Tax Group Code");
        Item.TESTFIELD("Base Unit of Measure");
        IF ItemUOM.GET(Item."No.", Item."Base Unit of Measure") THEN
            IF NOT ItemUOM."eShop Published" THEN BEGIN
                ItemUOM."eShop Published" := TRUE;
                ItemUOM.MODIFY;
            END;
        IF Item."Unit Price" = 0 THEN
            IF NOT CONFIRM('Unit Price is Zero, Due you still want to enable?', TRUE) THEN
                Item.TESTFIELD("Unit Price");
        IF Item."eShop Category ID" = '' THEN
            IF NOT CONFIRM(Text005, TRUE) THEN
                Item.TESTFIELD("eShop Category ID");
    end;

    procedure CheckCustomerFields(var User: Record "eShop Users");
    var
        Customer: Record 18;
        Salesperson: Record 13;
    begin
        User.TESTFIELD(Email);
        User.TESTFIELD("First Name");
        User.TESTFIELD(Password);
        User.TESTFIELD("Last Name");
        IF User."User Type" = User."User Type"::Customer THEN
            IF Customer.GET(User."No.") THEN BEGIN
                Customer.TESTFIELD("Gen. Bus. Posting Group");
                Customer.TESTFIELD("Customer Posting Group");
                IF Customer."E-Mail" = '' THEN BEGIN
                    Customer."E-Mail" := User.Email;
                    Customer.MODIFY
                END;
            END;

        IF User."User Type" = User."User Type"::Salesperson THEN
            IF Salesperson.GET(User."No.") THEN BEGIN
                CLEAR(Customer);
                Customer.SETRANGE("Salesperson Code", Salesperson.Code);
                IF Customer.FINDFIRST THEN
                    REPEAT
                        Customer.TESTFIELD("Gen. Bus. Posting Group");
                        Customer.TESTFIELD("Customer Posting Group");
                    UNTIL Customer.NEXT = 0;
            END;
    end;

    procedure GetTotalOrderAmount(SalesHeader: Record 36) Amt: Decimal;
    var
        SL: Record 37;
    begin
        SL.SETRANGE("Document Type", SalesHeader."Document Type");
        SL.SETRANGE("Document No.", SalesHeader."No.");
        IF SL.FINDSET THEN
            REPEAT
                Amt += SL."Line Amount";
            UNTIL SL.NEXT = 0
    end;

    procedure CheckTaxableStates(State: Text[30]): Code[20];
    var
        ESTaxableState: Record 70009707;
    begin
        IF STRLEN(State) = 2 THEN
            ESTaxableState.SETRANGE(ESTaxableState."State Code", UPPERCASE(State))
        ELSE
            ESTaxableState.SETRANGE(ESTaxableState."State Name", State);
        IF ESTaxableState.FINDFIRST THEN
            EXIT(ESTaxableState."Tax Area Code")
        ELSE
            EXIT('');
    end;

    procedure "------sms-----------------"();
    begin
    end;



    procedure CreateUserfromCustomers(var Cust: Record 18);
    var
        EShopUsers: Record "eShop Users";
        CustRec: Record 18;
        i: Integer;
        Text1: Label 'New User Created.\User ID: %1';
    begin
        IF NOT CONFIRM(Text009, FALSE) THEN
            EXIT;
        IF Cust."E-Mail" = '' THEN
            ERROR(Text008);

        EShopUsers.INIT;
        EShopUsers.UserID := '';
        EShopUsers.VALIDATE(Email, Cust."E-Mail");
        EShopUsers.VALIDATE("First Name", Cust.Name);
        IF Cust."Name 2" <> '' THEN
            EShopUsers.VALIDATE("Last Name", Cust."Name 2")
        ELSE
            EShopUsers.VALIDATE("Last Name", Cust.Name);
        EShopUsers.VALIDATE("User Type", EShopUsers."User Type"::Customer);
        EShopUsers.VALIDATE(Password, Cust."No.");
        EShopUsers.VALIDATE("No.", Cust."No.");
        IF EShopUsers.INSERT(TRUE) THEN
            MESSAGE(Text1, EShopUsers.UserID);
    end;

    procedure SendEmailMulitple(SalesHeaderec: Record 36);
    var
        SMTPMail: Record 409;
        SalesHeader: Record 36;
        InStreamTemplate: InStream;
        Subject: Text[1024];
        Body: Text[1024];
        SMTP: Codeunit 400;
        InSReadChar: Text[1];
        CharNo: Text[1024];
        I: Integer;
        Text008: Label 'Test';
        Text013: Label 'Body';
        Text001: Label 'HI  %1,';
        Text003: Label 'Your %1 online order has shipped.';
        Text004: Label 'Shipping Details:';
        Text009: Label 'Order Details:';
        Text011: Label 'Your order''s approximate delivery time frame  %1  is 5-10 business days.';
        Text012: Label 'If you have any questions or concerns please contact our Consumer Relations department at 800.344.2229 Monday through Friday from 8am to 5pm Pacific Standard Time. ';
        Text014: Label 'Thank you for your order and have a wonderful day! ';
        Text005: Label 'Shipping Details';
        Text025: Label 'Via';
        SalesLine: Record 37;
        Text026: Label 'Shipment Method Code : ';
        ESetup: Record 70009700;
    begin
        SMTPMail.GET;
        ESetup.GET;
        IF SalesHeaderec."eShop Login Email" <> '' THEN BEGIN
            Subject := STRSUBSTNO(Text002, COMPANYNAME, SalesHeaderec."No.");
            SMTP.CreateMessage(SMTPMail."User ID", ESetup."Sender E-Mail ID", SalesHeaderec."eShop Login Email", Subject, Body, TRUE);
            SMTP.AppendBody('<html>');
            SMTP.AppendBody('<head>');
            SMTP.AppendBody('</head>');
            SMTP.AppendBody('<body>');
            SMTP.AppendBody
            ('<p><span style="font-size: 10.0pt; font-family: Arial">' + STRSUBSTNO(Text001, SalesHeaderec."Sell-to Customer Name")
              + '</span></p>');
            SMTP.AppendBody
            ('<p><font size="2"><span style="font-family: Arial">' + STRSUBSTNO(Text002, COMPANYNAME, SalesHeaderec."No.")
              + '</span></font></p>');
            SMTP.AppendBody('<p>' + 'Shipping Details:' + '</p>');
            SMTP.AppendBody('<table border="1">');
            SMTP.AppendBody('<tr>');
            SMTP.AppendBody
          ('<td><font size="2"><br>' + SalesHeaderec."Sell-to Customer Name" + ' <br>' + SalesHeaderec."Bill-to Address" + '<br>' +
          SalesHeaderec."Bill-to Address 2" + '<br></td>');
            SMTP.AppendBody('</tr>');
            SMTP.AppendBody('</table>');
            SMTP.AppendBody('<p>' + Text009 + '</p>');
            SMTP.AppendBody('<table border="1">');
            SMTP.AppendBody('<tr>');
            SMTP.AppendBody('<td><font size="2">Item</td>');
            SMTP.AppendBody('<td><font size="2">Qunatity</td>');
            SMTP.AppendBody('</tr>');
            SMTP.AppendBody('<tr>');
            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document Type", SalesHeaderec."Document Type");
            SalesLine.SETRANGE(SalesLine."Document No.", SalesHeaderec."No.");
            IF SalesLine.FINDSET THEN REPEAT
                                          SMTP.AppendBody('<td><font size="2">' + SalesLine.Description + '</td>');
                                          SMTP.AppendBody('<td><font size="2">' + FORMAT(SalesLine.Quantity) + '</td>');
                                          SMTP.AppendBody('</tr>');
                UNTIL SalesLine.NEXT = 0;
            SMTP.AppendBody('</table>');
            SMTP.AppendBody('<br>');
            SMTP.AppendBody('<p>' + Text026 + SalesHeaderec."Shipping Agent Code" + '</p>');
            SMTP.AppendBody('<p>' + SalesHeaderec.FIELDCaption("Package Tracking No.") + ':' + SalesHeaderec."Package Tracking No." + '</p>');
            SMTP.AppendBody('<p>' + Text012 + '</p>');
            SMTP.AppendBody('<br>');
            SMTP.AppendBody('<p>' + Text014 + '</p>');
            SMTP.AppendBody('</body>');
            SMTP.AppendBody('</html>');
            SMTP.Send;
        END;
    end;

    procedure CreateUserfromCust(Filtertext: Text[120]);
    var
        Custrec: Record 18;
        EShopUsers: Record "eShop Users";
    begin
        IF NOT CONFIRM(Text009, FALSE) THEN
            EXIT;

        Custrec.SETFILTER(Custrec."No.", Filtertext);
        Custrec.SETRANGE(Custrec."E-Mail", '');
        IF Custrec.FINDFIRST THEN
            ERROR(Text008);

        Custrec.RESET;
        Custrec.SETFILTER(Custrec."No.", Filtertext);
        IF Custrec.FINDSET THEN REPEAT
                                    EShopUsers.INIT;
                                    EShopUsers.UserID := '';
                                    EShopUsers.VALIDATE(Email, Custrec."E-Mail");
                                    EShopUsers.VALIDATE("First Name", Custrec.Name);
                                    EShopUsers.VALIDATE("User Type", EShopUsers."User Type"::Customer);
                                    EShopUsers.VALIDATE("No.", Custrec."No.");
                                    EShopUsers.INSERT(TRUE);
            UNTIL Custrec.NEXT = 0;
    end;

    procedure CreateUserfromsingleCustomers(CustNo: Code[20]);
    var
        Cust: Record 18;
        EShopUsers: Record "eShop Users";
    begin
        Cust.RESET;
        Cust.SETRANGE(Cust."No.", CustNo);
        IF Cust.FINDFIRST THEN BEGIN
            EShopUsers.INIT;
            EShopUsers.UserID := '';
            EShopUsers.VALIDATE(Password, '123456');
            EShopUsers.VALIDATE(Email, Cust."E-Mail");
            EShopUsers.VALIDATE("First Name", Cust.Name);
            EShopUsers.VALIDATE("User Type", EShopUsers."User Type"::Customer);
            EShopUsers."No." := Cust."No.";
            EShopUsers.INSERT(TRUE);
        END;
    end;

    procedure "---Coupons----"();
    begin
    end;

    procedure ApplyCoupon(SHeader: Record 36): Boolean;
    var
        CouponSetup: Record 70009708;
        cSalesLine: Record 37;
        cSalesLine2: Record 37;
        cItem: Record 27;
        ResultFound: Boolean;
        cItem2: Record 27;
        ResultFound2: Boolean;
        CustRec: Record 18;
        LineQty: Decimal;
        VariantCode: Code[20];
        ItemDiscGrpQty: Decimal;
        CouponSetup1: Record 70009708;
        Text001: Label 'Coupon Start Date = %1\Document Date = %2';
        Text002: Label 'Coupon End Date = %1\Document Date = %2';
    begin

        IF SHeader."eShop Coupon Code" = '' THEN
            EXIT(FALSE);

        IF NOT CouponSetup.GET(SHeader."eShop Coupon Code") THEN
            EXIT(FALSE);

        IF GUIALLOWED THEN BEGIN
            IF (CouponSetup."Start Date" <> 0D) AND (CouponSetup."Start Date" > SHeader."Order Date") THEN
                ERROR(STRSUBSTNO(Text001, CouponSetup."Start Date", SHeader."Order Date"));

            IF (CouponSetup."End Date" <> 0D) AND (CouponSetup."End Date" < SHeader."Order Date") THEN
                ERROR(STRSUBSTNO(Text002, CouponSetup."End Date", SHeader."Order Date"));

            CouponSetup.TESTFIELD("Coupon Type");
            CouponSetup.TESTFIELD("Sales Type");
            CouponSetup.TESTFIELD("Qualifier Type");
            CouponSetup.TESTFIELD("Qualifier Code");
            CouponSetup.TESTFIELD("Promo Type");
            CouponSetup.TESTFIELD("Promo Code");
        END;

        IF NOT GUIALLOWED THEN BEGIN
            IF (CouponSetup."Start Date" <> 0D) AND (CouponSetup."Start Date" > SHeader."Document Date") THEN
                EXIT(FALSE);

            IF (CouponSetup."End Date" <> 0D) AND (CouponSetup."End Date" < SHeader."Document Date") THEN
                EXIT(FALSE);

            IF (CouponSetup."Coupon Type" = CouponSetup."Coupon Type"::" ") OR (CouponSetup."Sales Type" = CouponSetup."Sales Type"::" ") OR
             (CouponSetup."Qualifier Type" = CouponSetup."Qualifier Type"::" ") OR (CouponSetup."Qualifier Code" = '') OR
             (CouponSetup."Promo Type" = CouponSetup."Promo Type"::" ") OR (CouponSetup."Promo Code" = '') THEN
                EXIT(FALSE);
        END;

        CASE CouponSetup."Sales Type" OF
            CouponSetup."Sales Type"::Customer:
                BEGIN
                    IF CouponSetup."Sales Code" <> SHeader."Bill-to Customer No." THEN
                        EXIT;
                END;
            CouponSetup."Sales Type"::"Customer Price Group":
                BEGIN
                    CustRec.GET(SHeader."Bill-to Customer No.");
                    IF CustRec."Customer Price Group" <> CouponSetup."Sales Code" THEN
                        EXIT;
                END;
        END;

        CASE CouponSetup."Coupon Type" OF
            CouponSetup."Coupon Type"::" ":
                EXIT;
            CouponSetup."Coupon Type"::"Buy 1 Get 1 Free":
                ApplyCoupon_BOGOF(CouponSetup, SHeader."Document Type", SHeader."No.");
            CouponSetup."Coupon Type"::"% Discount":
                "ApplyCoupon_%Disc"(CouponSetup, SHeader."Document Type", SHeader."No.");
            CouponSetup."Coupon Type"::"$ Discount":
                BEGIN
                    IF "ApplyCoupon_$Disc"(CouponSetup, SHeader."Document Type", SHeader."No.") THEN
                        EXIT(TRUE)
                    ELSE
                        EXIT(FALSE);
                END;
            CouponSetup."Coupon Type"::"Min Order":
                ApplyCoupon_MinOrder(CouponSetup, SHeader."Document Type", SHeader."No.");
        END;

        EXIT(TRUE);
    end;

    procedure ApplyCoupon_BOGOF(CouponSetup: Record 70009708; Dtype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DNo: Code[20]);
    var
        SalesLine: Record 37;
        SalesLine2: Record 37;
        GrpTotal: Decimal;
        DisQty: Decimal;
        QtyDiscounted: Decimal;
        DisAmount: Decimal;
        DisQty1: Decimal;
        DisQtyact: Decimal;
        textfilter: Text[30];
        SHeader: Record 36;
    begin
        SHeader.RESET;
        SHeader.SETRANGE(SHeader."Document Type", Dtype);
        SHeader.SETRANGE(SHeader."No.", DNo);
        IF SHeader.FINDFIRST THEN BEGIN
            CASE CouponSetup."Qualifier Type" OF
                CouponSetup."Qualifier Type"::" ":
                    EXIT;

                CouponSetup."Qualifier Type"::Item:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;

                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        QtyDiscounted := 0;
                                        DisQtyact := GrpTotal DIV CouponSetup."Min. Qty.";
                                        DisQty := CouponSetup.Quantity * DisQtyact;
                                        DisQty1 := DisQty;
                                        IF SalesLine2.FINDSET THEN
                                            REPEAT
                                                DisAmount := 0;
                                                IF SalesLine2.Quantity < (DisQty) THEN BEGIN
                                                    DisAmount := ((SalesLine2.Quantity) * SalesLine2."Unit Price");
                                                    DisQty := DisQty - SalesLine2.Quantity;
                                                    QtyDiscounted += SalesLine2.Quantity;
                                                END ELSE BEGIN
                                                    DisAmount := ((DisQty) * SalesLine2."Unit Price");
                                                    QtyDiscounted += DisQty;
                                                END;

                                                IF (QtyDiscounted <= DisQty1) THEN BEGIN
                                                    SalesLine2.VALIDATE("Line Discount Amount", (DisAmount));
                                                    SalesLine2.MODIFY(TRUE);
                                                END

                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        QtyDiscounted := 0;
                                        DisQtyact := GrpTotal DIV CouponSetup."Min. Qty.";
                                        DisQty := CouponSetup.Quantity * DisQtyact;
                                        DisQty1 := DisQty;
                                        IF SalesLine2.FINDSET THEN
                                            REPEAT
                                                DisAmount := 0;
                                                IF SalesLine2.Quantity < (DisQty) THEN BEGIN
                                                    DisAmount := ((SalesLine2.Quantity) * SalesLine2."Unit Price");
                                                    DisQty := DisQty - SalesLine2.Quantity;
                                                    QtyDiscounted += SalesLine2.Quantity;
                                                END ELSE BEGIN
                                                    DisAmount := ((DisQty) * SalesLine2."Unit Price");
                                                    QtyDiscounted += DisQty;
                                                END;

                                                IF (QtyDiscounted <= DisQty1) THEN BEGIN
                                                    SalesLine2.VALIDATE("Line Discount Amount", (DisAmount));
                                                    SalesLine2.MODIFY(TRUE);
                                                END

                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;

                        END;
                    END;

                CouponSetup."Qualifier Type"::Categories:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;

                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        QtyDiscounted := 0;
                                        DisQtyact := GrpTotal DIV CouponSetup."Min. Qty.";
                                        DisQty := CouponSetup.Quantity * DisQtyact;
                                        DisQty1 := DisQty;
                                        IF SalesLine2.FINDSET THEN
                                            REPEAT
                                                DisAmount := 0;

                                                IF SalesLine2.Quantity < (DisQty) THEN BEGIN
                                                    DisAmount := ((SalesLine2.Quantity) * SalesLine2."Unit Price");
                                                    DisQty := DisQty - SalesLine2.Quantity;
                                                    QtyDiscounted += SalesLine2.Quantity;
                                                END ELSE BEGIN
                                                    DisAmount := ((DisQty) * SalesLine2."Unit Price");
                                                    QtyDiscounted += DisQty;
                                                END;

                                                IF (QtyDiscounted <= DisQty1) THEN BEGIN
                                                    SalesLine2.VALIDATE("Line Discount Amount", (DisAmount));
                                                    SalesLine2.MODIFY(TRUE);
                                                END

                                            UNTIL SalesLine2.NEXT = 0;

                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        QtyDiscounted := 0;
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        DisQtyact := GrpTotal DIV CouponSetup."Min. Qty.";
                                        DisQty := CouponSetup.Quantity * DisQtyact;
                                        DisQty1 := DisQty;

                                        IF SalesLine2.FINDSET THEN
                                            REPEAT
                                                DisAmount := 0;
                                                IF SalesLine2.Quantity < (DisQty) THEN BEGIN
                                                    DisAmount := ((SalesLine2.Quantity) * SalesLine2."Unit Price");
                                                    DisQty := DisQty - SalesLine2.Quantity;
                                                    QtyDiscounted += SalesLine2.Quantity;
                                                END ELSE BEGIN
                                                    DisAmount := ((DisQty) * SalesLine2."Unit Price");
                                                    QtyDiscounted += DisQty;
                                                END;

                                                IF (QtyDiscounted <= DisQty1) THEN BEGIN
                                                    SalesLine2.VALIDATE("Line Discount Amount", (DisAmount));
                                                    SalesLine2.MODIFY(TRUE);
                                                END

                                            UNTIL SalesLine2.NEXT = 0;

                                    END;
                                END;
                        END;
                    END;
            END;
        END;
    end;

    procedure "ApplyCoupon_%Disc"(CouponSetup: Record 70009708; Dtype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DNo: Code[20]);
    var
        SalesLine: Record 37;
        SalesLine2: Record 37;
        GrpTotal: Decimal;
        DisAmount: Decimal;
        DisQty: Decimal;
        QtyDiscounted: Decimal;
        SHeader: Record 36;
    begin

        SHeader.RESET;
        SHeader.SETRANGE(SHeader."Document Type", Dtype);
        SHeader.SETRANGE(SHeader."No.", DNo);
        IF SHeader.FINDFIRST THEN BEGIN

            CouponSetup.TESTFIELD("Discount %");
            CASE CouponSetup."Qualifier Type" OF
                CouponSetup."Qualifier Type"::" ":
                    EXIT;

                CouponSetup."Qualifier Type"::Item:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;

                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            SalesLine2.VALIDATE("Line Discount %", (SalesLine2."Line Discount %" + CouponSetup."Discount %"));
                                            SalesLine2.MODIFY(TRUE);
                                        END;
                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETRANGE("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            IF SalesLine.Quantity > 1 THEN BEGIN
                                                SalesLine2.VALIDATE("Line Discount %", (SalesLine2."Line Discount %" +
                                                  (CouponSetup."Discount %" / SalesLine.Quantity)));
                                                SalesLine2.MODIFY(TRUE);
                                            END ELSE BEGIN
                                                SalesLine2.VALIDATE("Line Discount %", (SalesLine2."Line Discount %" + CouponSetup."Discount %"));
                                                SalesLine2.MODIFY(TRUE);
                                            END;
                                        END;
                                    END;
                                END;
                        END;
                    END;

                CouponSetup."Qualifier Type"::Categories:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;
                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            SalesLine2.VALIDATE("Line Discount %", (SalesLine2."Line Discount %" + CouponSetup."Discount %"));
                                            SalesLine2.MODIFY(TRUE);
                                        END;
                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;
                                    MESSAGE('%1', GrpTotal);

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        QtyDiscounted := 0;
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        IF SalesLine2.FIND('-') THEN
                                            REPEAT
                                                DisQty := GrpTotal DIV CouponSetup."Min. Qty.";
                                                IF SalesLine2.Quantity < (DisQty - QtyDiscounted) THEN BEGIN
                                                    DisAmount := (SalesLine2.Quantity * SalesLine2."Unit Price") * (CouponSetup."Discount %" / 100);
                                                END
                                                ELSE
                                                    DisAmount := ((DisQty - QtyDiscounted) * SalesLine2."Unit Price") * (CouponSetup."Discount %" / 100);

                                                IF QtyDiscounted > DisQty THEN
                                                    DisAmount := 0;

                                                SalesLine2.VALIDATE("Line Discount Amount", (SalesLine2."Line Discount Amount" + DisAmount));
                                                SalesLine2.MODIFY(TRUE);

                                                QtyDiscounted += SalesLine2.Quantity;
                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;
                        END;
                    END;
            END;
        END;
    end;

    procedure "ApplyCoupon_$Disc"(CouponSetup: Record 70009708; Dtype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DNo: Code[20]): Boolean;
    var
        SalesLine: Record 37;
        SalesLine2: Record 37;
        GrpTotal: Decimal;
        SHeader: Record 36;
    begin
        SHeader.RESET;
        SHeader.SETRANGE(SHeader."Document Type", Dtype);
        SHeader.SETRANGE(SHeader."No.", DNo);
        IF SHeader.FINDFIRST THEN BEGIN

            CouponSetup.TESTFIELD("Discount $");
            CASE CouponSetup."Qualifier Type" OF
                CouponSetup."Qualifier Type"::" ":
                    EXIT;
                CouponSetup."Qualifier Type"::Item:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;
                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            IF (SalesLine2."Line Discount Amount" + CouponSetup."Discount $") > SalesLine2."Line Amount" THEN
                                                IF GUIALLOWED THEN
                                                    ERROR(SCSText000, (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"), SalesLine2."Line Amount",
                                                    SalesLine2."Document No.", SalesLine2."Line No.")
                                                ELSE
                                                    EXIT(FALSE);
                                            SalesLine2.VALIDATE("Line Discount Amount",
                                                              (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"));
                                            SalesLine2.MODIFY(TRUE);
                                            EXIT(TRUE);
                                        END;
                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            IF (SalesLine2."Line Discount Amount" + CouponSetup."Discount $") > SalesLine2."Line Amount" THEN
                                                IF GUIALLOWED THEN
                                                    ERROR(SCSText000, (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"), SalesLine2."Line Amount",
                                                    SalesLine2."Document No.", SalesLine2."Line No.")
                                                ELSE
                                                    EXIT(FALSE);
                                            SalesLine2.VALIDATE("Line Discount Amount",
                                                              (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"));
                                            SalesLine2.MODIFY(TRUE);
                                        END;
                                    END;
                                END;
                        END;
                    END;

                CouponSetup."Qualifier Type"::Categories:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;
                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');//sms
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            IF (SalesLine2."Line Discount Amount" + CouponSetup."Discount $") > SalesLine2."Line Amount" THEN
                                                IF GUIALLOWED THEN
                                                    ERROR(SCSText000, (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"), SalesLine2."Line Amount",
                                                    SalesLine2."Document No.", SalesLine2."Line No.")
                                                ELSE
                                                    EXIT(FALSE);
                                            SalesLine2.VALIDATE("Line Discount Amount",
                                                              (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"));
                                            SalesLine2.MODIFY(TRUE);
                                        END;
                                    END;
                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    MESSAGE('%1', SalesLine.COUNT);
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine.Quantity;
                                        UNTIL SalesLine.NEXT = 0;
                                    MESSAGE('Grp %1', GrpTotal);

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Line Amount");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        IF SalesLine2.FINDFIRST THEN BEGIN
                                            IF (SalesLine2."Line Discount Amount" + CouponSetup."Discount $") > SalesLine2."Line Amount" THEN BEGIN
                                                IF GUIALLOWED THEN
                                                    ERROR(SCSText000, (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"), SalesLine2."Line Amount",
                                                      SalesLine2."Document No.", SalesLine2."Line No.")
                                                ELSE
                                                    EXIT(FALSE);
                                            END;
                                            SalesLine2.VALIDATE("Line Discount Amount",
                                                              (SalesLine2."Line Discount Amount" + CouponSetup."Discount $"));
                                            SalesLine2.MODIFY(TRUE);
                                            EXIT(TRUE);
                                        END;
                                    END;
                                END;
                        END;
                    END;
            END;
        END;
    end;

    procedure ApplyCoupon_MinOrder(CouponSetup: Record 70009708; Dtype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DNo: Code[20]);
    var
        SalesLine: Record 37;
        SalesLine2: Record 37;
        GrpTotal: Decimal;
        Qtytobedisc: Decimal;
        QtyDisced: Decimal;
        QtyAccdis: Decimal;
        SHeader: Record 36;
    begin
        SHeader.RESET;
        SHeader.SETRANGE(SHeader."Document Type", Dtype);
        SHeader.SETRANGE(SHeader."No.", DNo);
        IF SHeader.FINDFIRST THEN BEGIN

            CASE CouponSetup."Qualifier Type" OF
                CouponSetup."Qualifier Type"::" ":
                    EXIT;
                CouponSetup."Qualifier Type"::Item:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;
                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("No.", CouponSetup."Qualifier Code");

                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine."Line Amount";
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER("No.", CouponSetup."Promo Code");
                                        Qtytobedisc := CouponSetup.Quantity;
                                        QtyDisced := 0;
                                        QtyAccdis := CouponSetup.Quantity;
                                        IF SalesLine2.FINDSET THEN REPEAT
                                                                       IF Qtytobedisc <> 0 THEN BEGIN
                                                                           IF SalesLine2.Quantity > Qtytobedisc THEN BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", Qtytobedisc * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := 0;
                                                                           END ELSE BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", SalesLine2.Quantity * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := Qtytobedisc - SalesLine2.Quantity;
                                                                           END;
                                                                       END;
                                            UNTIL SalesLine2.NEXT = 0;

                                    END;

                                END;

                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');//sms
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine."Line Amount";
                                        UNTIL SalesLine.NEXT = 0;

                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER(SalesLine2."eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        Qtytobedisc := CouponSetup.Quantity;
                                        QtyDisced := 0;
                                        QtyAccdis := CouponSetup.Quantity;
                                        IF SalesLine2.FINDSET THEN REPEAT
                                                                       IF Qtytobedisc <> 0 THEN BEGIN
                                                                           IF SalesLine2.Quantity > Qtytobedisc THEN BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", Qtytobedisc * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := 0;

                                                                           END ELSE BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", SalesLine2.Quantity * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := Qtytobedisc - SalesLine2.Quantity;
                                                                           END;
                                                                       END;
                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;
                        END;
                    END;

                CouponSetup."Qualifier Type"::Categories:
                    BEGIN
                        CASE CouponSetup."Promo Type" OF
                            CouponSetup."Promo Type"::" ":
                                EXIT;
                            CouponSetup."Promo Type"::Item:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine."Line Amount";
                                        UNTIL SalesLine.NEXT = 0;
                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER(SalesLine2."No.", CouponSetup."Promo Code");
                                        Qtytobedisc := CouponSetup.Quantity;
                                        QtyDisced := 0;
                                        QtyAccdis := CouponSetup.Quantity;
                                        IF SalesLine2.FINDSET THEN REPEAT
                                                                       IF Qtytobedisc <> 0 THEN BEGIN
                                                                           IF SalesLine2.Quantity > Qtytobedisc THEN BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", Qtytobedisc * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := 0;
                                                                           END ELSE BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", SalesLine2.Quantity * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := Qtytobedisc - SalesLine2.Quantity;
                                                                           END;
                                                                       END;
                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;
                            CouponSetup."Promo Type"::Category:
                                BEGIN
                                    GrpTotal := 0;
                                    CLEAR(SalesLine);
                                    SalesLine.SETRANGE("Document Type", SHeader."Document Type");
                                    SalesLine.SETRANGE("Document No.", SHeader."No.");
                                    SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                                    SalesLine.SETFILTER("eShop Category ID", '@*' + CouponSetup."Qualifier Code" + '*');
                                    IF SalesLine.FINDFIRST THEN
                                        REPEAT
                                            GrpTotal += SalesLine."Line Amount";
                                        UNTIL SalesLine.NEXT = 0;
                                    IF GrpTotal >= CouponSetup."Min. Qty." THEN BEGIN
                                        CLEAR(SalesLine2);
                                        SalesLine2.SETCURRENTKEY("Unit Price");
                                        SalesLine2.SETRANGE("Document Type", SHeader."Document Type");
                                        SalesLine2.SETRANGE("Document No.", SHeader."No.");
                                        SalesLine2.SETRANGE(Type, SalesLine2.Type::Item);
                                        SalesLine2.SETFILTER(SalesLine2."eShop Category ID", '@*' + CouponSetup."Promo Code" + '*');
                                        Qtytobedisc := CouponSetup.Quantity;
                                        QtyDisced := 0;
                                        QtyAccdis := CouponSetup.Quantity;
                                        IF SalesLine2.FINDSET THEN REPEAT
                                                                       IF Qtytobedisc <> 0 THEN BEGIN
                                                                           IF SalesLine2.Quantity > Qtytobedisc THEN BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", Qtytobedisc * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := 0;

                                                                           END ELSE BEGIN
                                                                               SalesLine2.VALIDATE(SalesLine2."Line Discount Amount", SalesLine2.Quantity * SalesLine2."Unit Price");
                                                                               SalesLine2.MODIFY(TRUE);
                                                                               Qtytobedisc := Qtytobedisc - SalesLine2.Quantity;
                                                                           END;
                                                                       END;
                                            UNTIL SalesLine2.NEXT = 0;
                                    END;
                                END;
                        END;
                    END;
            END;
        END;
    end;

    local procedure "------ Insert Comments From Blob------"();
    begin
    end;

    procedure ConvertBlobToBigtextComment(DocNo: Code[20]; Lno: Integer);
    var
        I: Integer;
        Len: Integer;
        VarText: Text[1024];
        ARRAYTest: ARRAY[30] OF Text[1024];
        VarInstream: InStream;
        J: Integer;
        VarRecord: Record 37;
        Len1: Integer;
        Text001: Label 'Description too large Contact the programmer.';
    begin
        I := 0;
        Len := 0;
        CLEAR(VarInstream);
        VarText := '';
        REPEAT
            I := I + 1;
            ARRAYTest[I] := '';
        UNTIL I = 30;
        CLEAR(VarRecord);
        VarRecord.GET(VarRecord."Document Type"::Order, DocNo, Lno);
        VarRecord.CALCFIELDS("eShop AttributeXML");
        IF VarRecord."eShop AttributeXML".HASVALUE THEN BEGIN
            VarRecord."eShop AttributeXML".CREATEINSTREAM(VarInstream);
            I := 1;
            WHILE NOT (VarInstream.EOS()) AND (I < 30) DO BEGIN
                Len := STRLEN(ARRAYTest[I]);
                IF (Len >= 1024) THEN BEGIN
                    I := I + 1;
                    VarInstream.READTEXT(VarText);
                    ARRAYTest[I] := ARRAYTest[I] + VarText;
                END ELSE BEGIN
                    VarText := '';
                    VarText := ARRAYTest[I];
                    Len1 := STRLEN(VarText);
                    VarInstream.READTEXT(ARRAYTest[I], 1024 - Len1);
                    ARRAYTest[I] := VarText + ARRAYTest[I];
                    VarText := '';
                END;
            END;
            FOR J := 1 TO ARRAYLEN(ARRAYTest) DO
                VaBiginteger.ADDTEXT(ARRAYTest[J]);
            IF I >= 30 THEN
                ERROR(Text001);
        END;

        CreateKitLinesbigtextComment(VaBiginteger, DocNo, Lno);
    end;

    procedure CreateKitLinesbigtextComment(Bigtextvar: BigText; DocNo: Code[20]; Lno: Integer);
    var
        I: Integer;
        KitSalesLine: Record 901;
        LineNo: Integer;
        Variants: ARRAY[20] OF Code[20];
        CommentLine: Record 44;
        Len: Integer;
        SplitVar: ARRAY[50] OF Text[80];
        FromLen: Integer;
        ToLen: Integer;
        SLinerec: Record 37;
    begin
        Len := ROUND((Bigtextvar.LENGTH / 80), 1, '>');
        FromLen := 1;
        ToLen := 80;
        FOR I := 1 TO Len DO BEGIN
            Bigtextvar.GETSUBTEXT(SplitVar[I], FromLen, ToLen);
            FromLen := FromLen + ToLen;
        END;
        CommentLine.RESET;
        CommentLine.SETRANGE(CommentLine."Document Type", CommentLine."Document Type"::Order);
        CommentLine.SETRANGE("No.", DocNo);
        CommentLine.SETRANGE("Document Line No.", Lno);
        IF CommentLine.FINDLAST THEN
            LineNo := CommentLine."Line No."
        ELSE
            LineNo := 0;
        FOR I := 1 TO Len DO BEGIN
            CommentLine.INIT;
            CommentLine.VALIDATE("Document Type", KitSalesLine."Document Type"::Order);
            CommentLine.VALIDATE("No.", DocNo);
            CommentLine."Document Line No." := Lno;
            LineNo += 10000;
            CommentLine."Line No." := LineNo;
            CommentLine.Comment := SplitVar[I];
            CommentLine.Date := TODAY;
            CommentLine.INSERT(TRUE);
        END;
    end;

    procedure ConvertBlobToBigtextOption(DocNo: Code[20]; Lno: Integer);
    var
        I: Integer;
        Len: Integer;
        VarText: Text[1024];
        ARRAYTest: ARRAY[30] OF Text[1024];
        VarInstream: InStream;
        J: Integer;
        VarRecord: Record 37;
        Len1: Integer;
        Text001: Label 'Description too large Contact the programmer.';
    begin
        I := 0;
        Len := 0;
        CLEAR(VarInstream);
        VarText := '';
        CLEAR(VaBiginteger);
        REPEAT
            I := I + 1;
            ARRAYTest[I] := '';
        UNTIL I = 30;
        CLEAR(VarRecord);
        VarRecord.GET(VarRecord."Document Type"::Order, DocNo, Lno);

        VarRecord.CALCFIELDS(VarRecord."eShop AttributeDescription");
        IF VarRecord."eShop AttributeXML".HASVALUE THEN BEGIN
            VarRecord."eShop AttributeDescription".CREATEINSTREAM(VarInstream);
            I := 1;
            WHILE NOT (VarInstream.EOS()) AND (I < 30) DO BEGIN
                Len := STRLEN(ARRAYTest[I]);
                IF (Len >= 1024) THEN BEGIN
                    I := I + 1;
                    VarInstream.READTEXT(VarText);
                    ARRAYTest[I] := ARRAYTest[I] + VarText;
                END ELSE BEGIN
                    VarText := '';
                    VarText := ARRAYTest[I];
                    Len1 := STRLEN(VarText);
                    VarInstream.READTEXT(ARRAYTest[I], 1024 - Len1);
                    ARRAYTest[I] := VarText + ARRAYTest[I];
                    VarText := '';
                END;
            END;
            FOR J := 1 TO ARRAYLEN(ARRAYTest) DO
                VaBiginteger.ADDTEXT(ARRAYTest[J]);
            IF I >= 30 THEN
                ERROR(Text001);
        END;

        CreateSalesLinesbigtextOption(VaBiginteger, DocNo, Lno);
    end;

    procedure CreateSalesLinesbigtextOption(Bigtextvar: BigText; DocNo: Code[20]; Lno: Integer);
    var
        I: Integer;
        KitSalesLine: Record 901;
        LineNo: Integer;
        Variants: ARRAY[20] OF Code[20];
        CommentLine: Record 44;
        Len: Integer;
        SplitVar: ARRAY[50] OF Text[80];
        FromLen: Integer;
        ToLen: Integer;
        SLinerec: Record 37;
    begin
        Len := ROUND((Bigtextvar.LENGTH / 80), 1, '>');
        FromLen := 1;
        ToLen := 80;
        FOR I := 1 TO Len DO BEGIN
            Bigtextvar.GETSUBTEXT(SplitVar[I], FromLen, ToLen);
            FromLen := FromLen + ToLen;
        END;
        CommentLine.RESET;
        CommentLine.SETRANGE(CommentLine."Document Type", CommentLine."Document Type"::Order);
        CommentLine.SETRANGE("No.", DocNo);
        CommentLine.SETRANGE("Document Line No.", Lno);
        IF CommentLine.FINDLAST THEN
            LineNo := CommentLine."Line No."
        ELSE
            LineNo := 0;

        FOR I := 1 TO Len DO BEGIN
            CommentLine.INIT;
            CommentLine.VALIDATE("Document Type", KitSalesLine."Document Type"::Order);
            CommentLine.VALIDATE("No.", DocNo);
            CommentLine."Document Line No." := Lno;
            LineNo += 10000;
            CommentLine."Line No." := LineNo;
            CommentLine.Comment := SplitVar[I];
            CommentLine.Date := TODAY;
            //CommentLine.IsCartDescription := TRUE;
            CommentLine.INSERT(TRUE);
        END;
    end;

    local procedure "-----Preview Selected Options---------"();
    begin
    end;

    procedure PreviewOptions(Dtype: Option "order",inv; DocNo: Code[20]; DocLineno: Integer; ShowMessage: Boolean): Text[1024];
    var
        SalesCommentLine: Record 44;
        XMLPrev: Text[1024];
        Pos1: Integer;
        Pos2: Integer;
        Pos3: Integer;
        Comm: Text[1024];
        NewLine: Text[30];
        MComment: Text[1024];
        CommLen: Integer;
        Found: Boolean;
    begin
        CLEAR(Found);
        SalesCommentLine.RESET;
        SalesCommentLine.SETRANGE(SalesCommentLine."Document Type", Dtype);
        SalesCommentLine.SETRANGE(SalesCommentLine."No.", DocNo);
        SalesCommentLine.SETRANGE(SalesCommentLine."Document Line No.", DocLineno);
        //SalesCommentLine.SETRANGE(SalesCommentLine.IsCartDescription,TRUE);
        XMLPrev := '';
        NewLine := '\';
        IF SalesCommentLine.FINDSET THEN REPEAT
                                             MComment += SalesCommentLine.Comment;
            UNTIL SalesCommentLine.NEXT = 0;
        CommLen := STRLEN(MComment);
        Pos1 := STRPOS(MComment, '[');
        Pos2 := STRPOS(MComment, ']');
        IF Pos1 > 0 THEN BEGIN
            WHILE CommLen <> 0 DO BEGIN
                Comm := COPYSTR(MComment, 1, Pos1 - 1) + COPYSTR(MComment, Pos2 + 1);
                Pos1 := STRPOS(Comm, '[');
                Pos2 := STRPOS(Comm, ']');
                MComment := Comm;
                CommLen := STRLEN(MComment);
                IF (Pos1 = 0) AND (Pos2 = 0) THEN
                    CommLen := 0;
            END;
        END;
        IF Pos1 > 0 THEN
            Found := TRUE;
        Pos1 := STRPOS(MComment, '<br />');
        IF Pos1 > 0 THEN
            Found := TRUE;

        IF Pos1 > 0 THEN BEGIN
            IF Comm <> '' THEN
                MComment := Comm;
            CommLen := STRLEN(MComment);
            Comm := '';
            WHILE CommLen <> 0 DO BEGIN
                Pos1 := STRPOS(MComment, '<br />');
                IF Pos1 > 0 THEN
                    Comm += COPYSTR(MComment, 1, Pos1 - 1) + NewLine
                ELSE
                    Comm += COPYSTR(MComment, 6) + NewLine;
                MComment := COPYSTR(MComment, Pos1 + 6);
                CommLen := STRLEN(MComment);
                Pos1 := STRPOS(MComment, '<br />');
                IF (Pos1 = 0) AND (CommLen > 0) THEN BEGIN
                    Comm += MComment;
                    CommLen := 0;
                END;

            END;
        END;
        IF ShowMessage THEN BEGIN
            IF (Comm <> '') AND Found THEN BEGIN
                MESSAGE(Comm);
                EXIT(Comm);
            END;
            IF NOT Found AND (MComment <> '') THEN BEGIN
                MESSAGE(MComment);
                EXIT(MComment);
            END;
        END;
        IF (Comm <> '') AND Found THEN BEGIN
            EXIT(Comm);
        END;
        IF NOT Found AND (MComment <> '') THEN BEGIN
            EXIT(MComment);
        END;
    end;

    local procedure "------Variants-----"();
    begin
    end;

    procedure Variations2Variants(ItemNo: Code[20]);
    var
        ItemVariant: Record 5401;
        Attribute1: Record 70009710;
        Attribute2: Record 70009710;
        Attribute3: Record 70009710;
        Attribute4: Record 70009710;
        Attribute5: Record 70009710;
        Attribute6: Record 70009710;
        Attribue1Found: Boolean;
        Attribue2Found: Boolean;
        Attribue3Found: Boolean;
        Attribue4Found: Boolean;
        Attribue5Found: Boolean;
        Attribue6Found: Boolean;
        NewDesc: Text[120];
        Item: Record 27;
        VariantCodeInt: Integer;
        ItemVariant1: Record 5401;
        VariantLastNoText: Text[30];
    begin
        Attribute1.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute1.SETRANGE(Attribute1."Item No.", ItemNo);
        Attribute1.SETRANGE(Attribute1."Attribute Code", Attribute1."Attribute Code"::Attribute1);

        Attribute2.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute2.SETRANGE(Attribute2."Item No.", ItemNo);
        Attribute2.SETRANGE(Attribute2."Attribute Code", Attribute2."Attribute Code"::Attribute2);

        Attribute3.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute3.SETRANGE(Attribute3."Item No.", ItemNo);
        Attribute3.SETRANGE(Attribute3."Attribute Code", Attribute3."Attribute Code"::Attribute3);

        Attribute4.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute4.SETRANGE(Attribute4."Item No.", ItemNo);
        Attribute4.SETRANGE(Attribute4."Attribute Code", Attribute4."Attribute Code"::"Attribute4 ");

        Attribute5.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute5.SETRANGE(Attribute5."Item No.", ItemNo);
        Attribute5.SETRANGE(Attribute5."Attribute Code", Attribute5."Attribute Code"::"Attribute5 ");

        Attribute6.SETCURRENTKEY("Item No.", "Attribute Code", "Attribute Type", "Attribute Value");
        Attribute6.SETRANGE(Attribute6."Item No.", ItemNo);
        Attribute6.SETRANGE(Attribute6."Attribute Code", Attribute6."Attribute Code"::Attribute6);

        Window.OPEN('Attribute1: #1#####\' +
                    'Attribute2: #2#####\' +
                    'Attribute3: #3#####\' +
                    'Attribute4: #4#####\' +
                    'Attribute5: #5#####\' +
                    'Attribute6: #6#####\');

        Attribue1Found := Attribute1.FIND('-');
        REPEAT
            Window.UPDATE(1, Attribute1.Description);

            Attribue2Found := Attribute2.FIND('-');
            REPEAT
                Window.UPDATE(2, Attribute2.Description);

                Attribue3Found := Attribute3.FIND('-');
                REPEAT
                    Window.UPDATE(3, Attribute3.Description);

                    Attribue4Found := Attribute4.FIND('-');
                    REPEAT
                        Window.UPDATE(4, Attribute4.Description);

                        Attribue5Found := Attribute5.FIND('-');
                        REPEAT
                            Window.UPDATE(5, Attribute5.Description);

                            Attribue6Found := Attribute6.FIND('-');
                            REPEAT
                                Window.UPDATE(6, Attribute6.Description);

                                IF NOT Attribue1Found AND NOT Attribue2Found AND NOT Attribue3Found AND NOT Attribue4Found AND NOT Attribue5Found AND NOT Attribue6Found THEN
                                    EXIT;
                                /*
                                ItemVariant.Code:=COPYSTR(Attribute1."Attribute Value",1,2)+
                                                  COPYSTR(Attribute2."Attribute Value",1,1)+
                                                  COPYSTR(Attribute3."Attribute Value",1,2)+
                                                  COPYSTR(Attribute4."Attribute Value",1,2)+
                                                  COPYSTR(Attribute5."Attribute Value",1,1)+
                                                  COPYSTR(Attribute6."Attribute Value",1,2);*/

                                ItemVariant."Item No." := ItemNo;

                                ItemVariant1.SETRANGE("Item No.", ItemNo);
                                IF ItemVariant1.FINDLAST THEN BEGIN
                                    OK := EVALUATE(VariantCodeInt, ItemVariant.Code);
                                    VariantCodeInt := VariantCodeInt + 1;
                                    VariantLastNoText := FORMAT(VariantCodeInt);
                                    VariantLastNoText := DELCHR(VariantLastNoText, '=', ',');
                                    IF STRLEN(VariantLastNoText) <= 4 THEN
                                        ItemVariant.Code := PADSTR('', 4 - STRLEN(VariantLastNoText), '0') + VariantLastNoText
                                    ELSE
                                        ItemVariant.Code := FORMAT(VariantCodeInt);
                                END ELSE BEGIN
                                    VariantCodeInt := 1;
                                    VariantLastNoText := FORMAT(VariantCodeInt);
                                    VariantLastNoText := DELCHR(VariantLastNoText, '=', ',');
                                    IF STRLEN(VariantLastNoText) <= 4 THEN
                                        ItemVariant.Code := PADSTR('', 4 - STRLEN(VariantLastNoText), '0') + VariantLastNoText
                                    ELSE
                                        ItemVariant.Code := FORMAT(VariantCodeInt);
                                END;


                                OK := EVALUATE(NewDesc, COPYSTR(Attribute1.Description, 1, 3) + ' ' +
                                                                               COPYSTR(Attribute2.Description, 1, 3) + ' ' +
                                                                               COPYSTR(Attribute3.Description, 1, 3) + ' ' +
                                                                               COPYSTR(Attribute4.Description, 1, 3) + ' ' +
                                                                               COPYSTR(Attribute5.Description, 1, 3) + ' ' +
                                                                               COPYSTR(Attribute6.Description, 1, 3));

                                IF STRLEN(NewDesc) > MAXSTRLEN(ItemVariant.Description) THEN
                                    ItemVariant.Description := COPYSTR(NewDesc, 1, MAXSTRLEN(ItemVariant.Description))
                                ELSE
                                    ItemVariant.Description := NewDesc;

                                IF Item.GET(ItemNo) THEN
                                    ItemVariant."Description 2" := Item.Description;

                                ItemVariant."eShop Attribute 1" := Attribute1."Attribute Value";
                                ItemVariant."eShop Attribute 2" := Attribute2."Attribute Value";
                                ItemVariant."eShop Attribute 3" := Attribute3."Attribute Value";
                                ItemVariant."eShop Attribute 4" := Attribute4."Attribute Value";
                                ItemVariant."eShop Attribute 5" := Attribute5."Attribute Value";
                                ItemVariant."eShop Attribute 6" := Attribute6."Attribute Value";

                                OK := ItemVariant.INSERT(TRUE);

                            UNTIL Attribute6.NEXT = 0;

                        UNTIL Attribute5.NEXT = 0;

                    UNTIL Attribute4.NEXT = 0;

                UNTIL Attribute3.NEXT = 0;

            UNTIL Attribute2.NEXT = 0;

        UNTIL Attribute1.NEXT = 0;

        MESSAGE('Variants Updated');

    end;

    procedure Variants2Variations(ItemNo: Text);
    var
        ItemVariant: Record 5401;
        EshopVariations: Record 70009710;
        EshopVariationValue: Record 70009712;
        ItemRec: Record 27;
        CategoryText: Text[1024];
        EshopCategoryRec: Record 70009702;
    begin

        Window.OPEN('Attribute1: #1#####\' +
        'Attribute2: #2#####\' +
        'Attribute3: #3#####\' +
        'Attribute4: #4#####\' +
        'Attribute5: #5#####\' +
        'Attribute6: #6#####\');

        IF ItemRec.GET(ItemNo) THEN BEGIN
            CategoryText := ItemRec."eShop Category ID";

            IF STRPOS(CategoryText, ',') <> 0 THEN
                CategoryText := DELCHR(COPYSTR(CategoryText, 1, STRPOS(CategoryText, ',') - 1), '=', '');

            IF STRPOS(CategoryText, '/') <> 0 THEN
                CategoryText := DELCHR(COPYSTR(CategoryText, 1, STRPOS(CategoryText, '/') - 1), '=', '');
        END;
        IF CategoryText <> '' THEN BEGIN
            IF EshopCategoryRec.GET(CategoryText) THEN BEGIN


                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::Attribute1,
                         EshopCategoryRec."Variant 1", ItemVariant."eShop Attribute 1")) AND (ItemVariant."eShop Attribute 1" <> '') AND (EshopCategoryRec."Variant 1" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::Attribute1);
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 1");
                            EshopVariations."Attribute Value" := ItemVariant."eShop Attribute 1";
                            Window.UPDATE(1, ItemVariant."eShop Attribute 1");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 1");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::Attribute2,
                                    EshopCategoryRec."Variant 2", ItemVariant."eShop Attribute 2")) AND (ItemVariant."eShop Attribute 2" <> '') AND
                                    (EshopCategoryRec."Variant 2" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::Attribute2);
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 2");
                            EshopVariations."Attribute Value" := ItemVariant."eShop Attribute 2";
                            Window.UPDATE(2, ItemVariant."eShop Attribute 2");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 2");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::Attribute3,
                                 EshopCategoryRec."Variant 3", ItemVariant."eShop Attribute 3")) AND (ItemVariant."eShop Attribute 3" <> '')
                                 AND (EshopCategoryRec."Variant 3" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::Attribute3);
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 3");
                            EshopVariations."Attribute Value" := ItemVariant."eShop Attribute 3";
                            Window.UPDATE(3, ItemVariant."eShop Attribute 3");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 3");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::"Attribute4 ",
                        EshopCategoryRec."Variant 4", ItemVariant."eShop Attribute 4")) AND (ItemVariant."eShop Attribute 4" <> '') AND
                        (EshopCategoryRec."Variant 4" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::"Attribute4 ");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 4");
                            EshopVariations."Attribute Value" := ItemVariant."eShop Attribute 4";
                            Window.UPDATE(4, ItemVariant."eShop Attribute 4");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 4");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::"Attribute5 ",
                        EshopCategoryRec."Variant 5", ItemVariant."eShop Attribute 5")) AND (ItemVariant."eShop Attribute 5" <> '') AND
                        (EshopCategoryRec."Variant 5" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::"Attribute5 ");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 5");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Value", ItemVariant."eShop Attribute 5");
                            Window.UPDATE(5, ItemVariant."eShop Attribute 5");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 5");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

                ItemVariant.RESET;
                ItemVariant.SETCURRENTKEY("Item No.", Code);
                ItemVariant.SETRANGE(ItemVariant."Item No.", ItemNo);
                IF ItemVariant.FINDFIRST THEN
                    REPEAT
                        IF (NOT EshopVariations.GET(ItemVariant."Item No.", EshopVariations."Attribute Code"::Attribute6,
                        EshopCategoryRec."Variant 6", ItemVariant."eShop Attribute 6")) AND (ItemVariant."eShop Attribute 6" <> '') AND
                        (EshopCategoryRec."Variant 6" <> '') THEN BEGIN
                            EshopVariations.INIT;
                            EshopVariations.VALIDATE(EshopVariations."Item No.", ItemVariant."Item No.");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Code", EshopVariations."Attribute Code"::Attribute6);
                            EshopVariations.VALIDATE(EshopVariations."Attribute Type", EshopCategoryRec."Variant 6");
                            EshopVariations.VALIDATE(EshopVariations."Attribute Value", ItemVariant."eShop Attribute 6");
                            Window.UPDATE(6, ItemVariant."eShop Attribute 6");
                            EshopVariations.VALIDATE(EshopVariations.Description, ItemVariant."eShop Attribute 6");
                            EshopVariations.INSERT;
                        END;
                    UNTIL ItemVariant.NEXT = 0;

            END;
        END;
        MESSAGE('Variations Updated');
    end;

    local procedure "--Purchase Comments---"();
    begin
    end;

    procedure InsertPurchaseComments(PHeader: Record 38; Comments: Text[1024]);
    var
        PurchComm: Record 43;
        Lineno: Integer;
        Lent: Integer;
        Add1: Text[100];
        Offset: Integer;
    begin
        PurchComm.SETRANGE("Document Type", PHeader."Document Type");
        PurchComm.SETRANGE("No.", PHeader."No.");
        IF PurchComm.FINDLAST THEN
            Lineno := PurchComm."Line No." + 10000
        ELSE
            Lineno := 10000;
        Lent := STRLEN(Comments);
        WHILE Lent <> 0 DO BEGIN
            PurchComm.INIT;
            PurchComm.VALIDATE("Document Type", PHeader."Document Type");
            PurchComm.VALIDATE("No.", PHeader."No.");
            PurchComm.VALIDATE("Document Line No.", 0);
            Add1 := '';
            Offset := STRPOS(Comments, ' ');
            WHILE (STRLEN(Add1) + STRLEN(COPYSTR(Comments, 1, Offset)) <= 80) AND (Offset <> 0) DO BEGIN
                Add1 += COPYSTR(Comments, 1, Offset);
                Comments := COPYSTR(Comments, Offset + 1);
                Offset := STRPOS(Comments, ' ');
            END;
            IF (Offset = 0) AND (STRLEN(Comments) > 0) AND (STRLEN(Add1 + Comments) <= 80) THEN BEGIN
                Add1 := Add1 + Comments;
                Comments := '';
            END;
            IF (Offset = 0) AND (STRLEN(Comments) > 0) AND (Add1 = '') THEN BEGIN
                Add1 := Comments;
                Comments := '';
            END;
            Lent := STRLEN(Comments);
            PurchComm."Line No." := Lineno;
            Lineno += 10000;
            PurchComm.VALIDATE(Comment, Add1);
            PurchComm.VALIDATE(Date, TODAY);
            PurchComm.INSERT(TRUE);
        END;
    end;

    local procedure "---- From Sales Header----"();
    begin
    end;

    procedure WebCCAuthorization(SalesHeader: Record 36; Show: Boolean): Text[30];
    var
        ResultMesssage: Text[30];
        ApprovalNumber: Code[20];
        TransactionStatus: Text[30];
        ApprovedAmount: Decimal;
        salesline: Record 37;
        TaxableState: Record 70009707;
        Taxable: Boolean;
        ESMethods: Codeunit "eShop Methods";
        ReleaseSalesDoc: Codeunit 414;
        Usersetup: Record 91;
        Webencryptcc: Text[350];
        WebDecryptcc: Text[30];
    begin
        SalesHeader.TESTFIELD("eShop Web CC");
        IF Show THEN BEGIN
            IF Usersetup.GET(USERID) THEN
                //IF NOT Usersetup."Credit Manager" THEN
                ERROR('You do not have permission please conatct your manager.');

            WebDecryptcc := GetDataCC(SalesHeader);
            MESSAGE('Credit Card No: ' + WebDecryptcc);
            EXIT(WebDecryptcc);
        END;
        IF ESMethods.CheckTaxableStates(SalesHeader."Ship-to County") <> '' THEN BEGIN
            /*VALIDATE("Payment Method Code",'CREDITCARD');
            VALIDATE("Payment Terms Code",'CREDITCARD');
            VALIDATE("Account Number",GetDataCC);
            VALIDATE("Expiration Month","CC Expiration Month");
            VALIDATE("Expiration Year","CC Expiration Year");
            ReleaseSalesDoc.PerformManualRelease(Rec);
            MODIFY;
            CALCFIELDS("Amount Including VAT");
            EFTAPI.CreditAuthorize('8016142153',"Bill-to Customer No.","No.",
                GetDataCC,"CC Expiration Month",
                                "CC Expiration Year","CC Cvv2","Amount Including VAT",ResultMesssage,
                ApprovalNumber,TransactionStatus,ApprovedAmount);
                MESSAGE(ResultMesssage);
                //EFTAPI.AssignAuthorizationToOrder('8016142153',"No.",ApprovalNumber);
            ReleaseSalesDoc.PerformManualReopen(Rec);  */
        END ELSE BEGIN
            IF Usersetup.GET(USERID) THEN
                // IF NOT Usersetup."Credit Manager" THEN
                ERROR('You do not have permission please conatct your manager.');
            SalesHeader.VALIDATE("Payment Method Code", 'CREDITCARD');
            SalesHeader.VALIDATE("Payment Terms Code", 'CREDITCARD');
            SalesHeader.MODIFY;
            MESSAGE('Non taxable state order. Please authorize manually  \' +
     'Credit Card No:  ' + GetDataCC(SalesHeader));
        END;

    end;

    procedure SetDataCC(var SalesHeader: Record 36);
    var
        DataStream: OutStream;
        DataText: BigText;
        StarString: Text[30];
        EncryptMgt: Codeunit 1266;
        WebCC: Text[50];
    begin
        CLEAR(SalesHeader."eShop Web CC Encrypted");
        WebCC := SalesHeader."eShop Web CC";
        DataText.ADDTEXT(EncryptMgt.Encrypt(WebCC));
        SalesHeader."eShop Web CC Encrypted".CREATEOUTSTREAM(DataStream);
        DataText.WRITE(DataStream);

        // Set obfuscated card no
        StarString := '';
        SalesHeader."eShop Web CC" :=
        PADSTR(
          StarString,
          STRLEN(WebCC) - 4, '*') + COPYSTR(WebCC,
          STRLEN(WebCC) - 3);
    end;

    procedure GetDataCC(SalesHeader: Record 36) Value: Text[1024];
    var
        DataStream: InStream;
        DataText: BigText;
        Usersetup: Record 91;
        EncryptMgt: Codeunit 1266;
    begin
        Usersetup.GET(USERID);
        //IF NOT Usersetup."Credit Manager" THEN
        ERROR('You do not have permission please conatct your manager.');

        Value := '';
        SalesHeader.CALCFIELDS("eShop Web CC Encrypted");
        IF SalesHeader."eShop Web CC Encrypted".HASVALUE THEN BEGIN
            SalesHeader."eShop Web CC Encrypted".CREATEINSTREAM(DataStream);
            DataText.READ(DataStream);
            DataText.GETSUBTEXT(Value, 1);
        END;
        EXIT(EncryptMgt.Decrypt(Value));
    end;

    procedure InsertSalesComments(SHeader: Record 36; Comments: Text[1024]);
    var
        SalesComm: Record 44;
        Lineno: Integer;
        Lent: Integer;
        Add1: Text[100];
        Offset: Integer;
    begin
        SalesComm.SETRANGE("Document Type", SHeader."Document Type");
        SalesComm.SETRANGE("No.", SHeader."No.");
        IF SalesComm.FINDLAST THEN
            Lineno := SalesComm."Line No." + 10000
        ELSE
            Lineno := 10000;
        Lent := STRLEN(Comments);
        WHILE Lent <> 0 DO BEGIN
            SalesComm.INIT;
            SalesComm.VALIDATE("Document Type", SHeader."Document Type");
            SalesComm.VALIDATE("No.", SHeader."No.");
            SalesComm.VALIDATE("Document Line No.", 0);
            Add1 := '';
            Offset := STRPOS(Comments, ' ');
            WHILE (STRLEN(Add1) + STRLEN(COPYSTR(Comments, 1, Offset)) <= 80) AND (Offset <> 0) DO BEGIN
                Add1 += COPYSTR(Comments, 1, Offset);
                Comments := COPYSTR(Comments, Offset + 1);
                Offset := STRPOS(Comments, ' ');
            END;
            IF (Offset = 0) AND (STRLEN(Comments) > 0) AND (STRLEN(Add1 + Comments) <= 80) THEN BEGIN
                Add1 := Add1 + Comments;
                Comments := '';
            END;
            IF (Offset = 0) AND (STRLEN(Comments) > 0) AND (Add1 = '') THEN BEGIN
                Add1 := Comments;
                Comments := '';
            END;
            Lent := STRLEN(Comments);
            SalesComm."Line No." := Lineno;
            Lineno += 10000;
            SalesComm.VALIDATE(Comment, Add1);
            SalesComm.VALIDATE(Date, TODAY);
            SalesComm.INSERT(TRUE);
        END;
    end;

    local procedure "----Assembly Orders-----"();
    begin
    end;

    procedure ConvertXML2BigText(var SalesHeader: Record 36);
    var
        SalesLine: Record 37;
        I: Integer;
        Len: Integer;
        VarText: Text[1024];
        ARRAYTest: ARRAY[30] OF Text[1024];
        VarInstream: InStream;
        J: Integer;
        Text001: Label 'Description too large Contact the programmer.';
    begin
        SalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
        SalesLine.SETRANGE("Document No.", SalesHeader."No.");
        IF SalesLine.FINDSET THEN
            REPEAT
                I := 0;
                Len := 0;
                CLEAR(VarInstream);
                VarText := '';
                REPEAT
                    I := I + 1;
                    ARRAYTest[I] := '';
                UNTIL I = 30;
                CLEAR(VaBiginteger);
                SalesLine.CALCFIELDS("eShop AttributeXML");
                IF SalesLine."eShop AttributeXML".HASVALUE THEN BEGIN
                    SalesLine."eShop AttributeXML".CREATEINSTREAM(VarInstream);
                    I := 1;
                    WHILE NOT (VarInstream.EOS()) AND (I < 30) DO BEGIN
                        Len := STRLEN(ARRAYTest[I]);
                        IF (Len >= 1024) THEN BEGIN
                            I := I + 1;
                            VarInstream.READTEXT(VarText);
                            ARRAYTest[I] := ARRAYTest[I] + VarText;
                        END ELSE BEGIN
                            VarText := '';
                            VarText := ARRAYTest[I];
                            VarInstream.READTEXT(ARRAYTest[I], 1024);
                            ARRAYTest[I] := VarText + ARRAYTest[I];
                            VarText := '';
                        END;
                    END;
                    FOR J := 1 TO ARRAYLEN(ARRAYTest) DO
                        VaBiginteger.ADDTEXT(ARRAYTest[J]);
                    IF I >= 30 THEN
                        ERROR(Text001);
                END;
                GetBomItemsFromBigText(VaBiginteger, SalesLine);
            UNTIL SalesLine.NEXT = 0;
    end;

    procedure CreateAssemblyOrders(BomItemNo: Text[50]; SalesLine: Record 37);
    var
        BomComponent: Record 90;
        AssemblyHeader: Record 900;
        AssemblyLine: Record 901;
        AssemblyLink: Record 904;
        SaleHeader: Record 36;
        LineNo: Integer;
    begin
        BomComponent.SETRANGE("Parent Item No.", SalesLine."No.");
        BomComponent.SETRANGE(Type, BomComponent.Type::Item);
        BomComponent.SETRANGE("No.", BomItemNo);
        BomComponent.SETFILTER("eShop Option Group", '<>%1', '');
        IF BomComponent.FINDFIRST THEN BEGIN
            AssemblyLink.SETRANGE("Document Type", SalesLine."Document Type");
            AssemblyLink.SETRANGE("Document No.", SalesLine."Document No.");
            AssemblyLink.SETRANGE("Document Line No.", SalesLine."Line No.");
            IF NOT AssemblyLink.FINDFIRST THEN BEGIN
                AssemblyHeader.INIT;
                AssemblyHeader.VALIDATE("Document Type", AssemblyHeader."Document Type"::Order);
                IF SaleHeader.GET(SalesLine."Document Type", SalesLine."Document No.") THEN
                    AssemblyHeader.VALIDATE("Due Date", SaleHeader."Due Date");
                AssemblyHeader.VALIDATE("Item No.", SalesLine."No.");
                AssemblyHeader.Quantity := SalesLine.Quantity;
                AssemblyHeader.INSERT(TRUE);

                AssemblyLine.INIT;
                AssemblyLine.VALIDATE("Document Type", AssemblyLine."Document Type"::Order);
                AssemblyLine.VALIDATE("Document No.", AssemblyHeader."No.");
                AssemblyLine."eShop Document Line No." := SalesLine."Line No.";
                LineNo += 10000;
                AssemblyLine."Line No." := LineNo;
                AssemblyLine.VALIDATE(Type, AssemblyLine.Type::Item);
                AssemblyLine.VALIDATE("No.", BomItemNo);
                AssemblyLine.VALIDATE("eShop Option Group", BomComponent."eShop Option Group");
                AssemblyLine.VALIDATE("Quantity per", (BomComponent."Quantity per" * AssemblyHeader.Quantity));
                AssemblyLine.INSERT;

                AssemblyLink.INIT;
                AssemblyLink.VALIDATE("Assembly Document Type", AssemblyHeader."Document Type");
                AssemblyLink.VALIDATE("Assembly Document No.", AssemblyHeader."No.");
                AssemblyLink.VALIDATE(Type, AssemblyLink.Type::Sale);
                AssemblyLink.VALIDATE("Document Line No.", SalesLine."Line No.");
                AssemblyLink.VALIDATE("Document Type", SalesLine."Document Type");
                AssemblyLink.VALIDATE("Document No.", SalesLine."Document No.");
                AssemblyLink.VALIDATE("Assembled Quantity", SalesLine.Quantity);
                AssemblyLink.INSERT;
            END ELSE BEGIN
                AssemblyLine.SETRANGE("Document Type", AssemblyLine."Document Type"::Order);
                AssemblyLine.SETRANGE("Document No.", AssemblyLink."Assembly Document No.");
                AssemblyLine.SETRANGE("No.", BomItemNo);
                IF NOT AssemblyLine.FINDFIRST THEN BEGIN
                    AssemblyLine.RESET;
                    AssemblyLine.SETRANGE("Document Type", AssemblyLine."Document Type"::Order);
                    AssemblyLine.SETRANGE("Document No.", AssemblyLink."Assembly Document No.");
                    IF AssemblyLine.FINDLAST THEN
                        LineNo := AssemblyLine."Line No.";
                    AssemblyLine.INIT;
                    AssemblyLine.VALIDATE("Document Type", AssemblyLine."Document Type"::Order);
                    AssemblyLine.VALIDATE("Document No.", AssemblyLink."Assembly Document No.");
                    AssemblyLine."eShop Document Line No." := SalesLine."Line No.";
                    LineNo += 10000;
                    AssemblyLine."Line No." := LineNo;
                    AssemblyLine.VALIDATE(Type, AssemblyLine.Type::Item);
                    AssemblyLine.VALIDATE("No.", BomItemNo);
                    AssemblyLine.VALIDATE("eShop Option Group", BomComponent."eShop Option Group");
                    AssemblyLine.VALIDATE("Quantity per", BomComponent."Quantity per");
                    AssemblyLine.INSERT;
                END;
            END;
        END;
        MESSAGE('Assembly Orders Created');
    end;

    local procedure GetBomItemsFromBigText(var VarBigText: BigText; var SalesLine: Record 37);
    var

    begin
        //Need to release in next version
    end;

    procedure BlobImport(Var BLOBRef: Record TempBlob; Name: Text[50])
    var
        UploadResult: Boolean;
        AllFilesDescriptionTxt: Label 'All Files (*.*)|*.*';
        NVInStream: InStream;
        NVOutStream: OutStream;
    begin
        UploadResult := UploadIntoStream('Import', '', AllFilesDescriptionTxt, Name, NVInStream);
        BLOBRef.Blob.CreateOutStream(NVOutStream);
        CopyStream(NVOutStream, NVInStream);
        IF NOT UploadResult then
            EXIT;
    end;

    procedure BlobExport(Var BLOBRef: Record TempBlob; Name: Text[50])
    var
        UploadResult: Boolean;
        AllFilesDescriptionTxt: Label 'All Files (*.*)|*.*';
        NVInStream: InStream;
        NVOutStream: OutStream;
    begin
        BLOBRef.Blob.CreateInStream(NVInStream);
        UploadResult := DownloadFromStream(NVInStream, 'Export', '', '', Name);

    end;

    procedure eShopDefaultSetup()
    var
        SetWerbService: Boolean;
        PgID: array[20] of integer;
        PgServName: array[20] of text[30];
        "Tenant Web Service": Record "Tenant Web Service";
        i: Integer;
        EshopSetup: Record "eShop Setup";
        SSetup: Record "Sales & Receivables Setup";
        Noseries: Record "No. Series";
        NoSrsCode: array[50] of code[30];
        NoSrsDesc: array[50] of text[100];
        StartingNo: array[50] of text[30];
        Noseriesline: Record "No. Series Line";
        CustPosting: Record "Customer Posting Group";
        GenBussPosting: Record "Gen. Business Posting Group";
        CustTemplate: Record "Customer Template";
        StartupWizardNotification: Notification;
    begin
        SetWerbService := true;
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
                IF NOT "Tenant Web Service".GET("Tenant Web Service"."Object Type"::Page, PgServName[i]) THEN BEGIN
                    "Tenant Web Service".INIT;
                    "Tenant Web Service"."Object Type" := "Tenant Web Service"."Object Type"::Page;
                    "Tenant Web Service"."Object ID" := PgID[i];
                    "Tenant Web Service"."Service Name" := PgServName[i];
                    "Tenant Web Service".Published := TRUE;
                    "Tenant Web Service".INSERT(TRUE);
                END;
            END;
            IF NOT "Tenant Web Service".GET("Tenant Web Service"."Object Type"::Codeunit, 'WebShop Functions') THEN BEGIN
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
            StartingNo[2] := 'ESC0001';

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
        StartupWizardNotification.Message('Setup Completed');
        StartupWizardNotification.Send();
    end;

    local procedure GetWebServiceAPIURL(): Text[1024];
    begin
        EXIT(GETURL(CLIENTTYPE::SOAP, COMPANYNAME))
    end;
    procedure CreateWebShippingLine(SalesHeader : Record "Sales Header")
    var
    SalesLine : Record "Sales Line";
    SalesLine1 : Record "Sales Line";
    LineNo : Integer;
    ESSetup : Record "eShop Setup";
    begin
    if SalesHeader."eShop Shipping Amount" <> 0 then

    IF NOT SalesLine.GET(SalesHeader."Document Type",SalesHeader."No.",SalesHeader."eShop Shipping Line No") THEN
      begin
          CLEAR(Salesline1);
            Salesline1.SETRANGE("Document Type", Salesheader."Document Type");
            Salesline1.SETRANGE("Document No.", Salesheader."No.");
            IF Salesline1.FINDLAST THEN
                LineNo := Salesline1."Line No.";
            Salesline.INIT;
            Salesline.VALIDATE("Document Type", Salesheader."Document Type");
            Salesline.VALIDATE("Document No.", Salesheader."No.");
            LineNo += 10000;
            Salesline."Line No." := LineNo;
            ESSetup.GET;
            Salesline.VALIDATE(Type, Salesline1.Type::"G/L Account");
            Salesline.VALIDATE("No.", ESSetup."Web Shipping GL No.");
            Salesline.VALIDATE(Quantity, 1);
            Salesline.VALIDATE("Unit Price", Salesheader."eShop Shipping Amount");
            Salesline.INSERT(TRUE);
            SalesHeader."eShop Shipping Line No" := SalesLine."Line No.";
            SalesHeader.Modify();
      end ELSE 
      begin
          Salesline.VALIDATE("Unit Price", Salesheader."eShop Shipping Amount");
          SalesLine.Modify();
          IF SalesHeader."eShop Shipping Amount" = 0 then
            SalesLine.Delete();
      end;
    end;
}
codeunit 70009703 "eShop Dotnet Service"
{
    // version ES1.00
    var
        test: Text[1024];
        VarInstream: InStream;

    trigger OnRun();
    begin
        HYPERLINK('http://dynamicseshop.com/contact-us-2/');
    end;

    procedure GetEShopServiceURL() ServiceURL: Text[100]
    var
        EShopSetup: Record "eShop Setup";
    Begin
        EShopSetup.GET;
        EShopSetup.TESTFIELD("eShop Web Service URL");
        EXIT(EShopSetup."eShop Web Service URL");
    End;

    procedure InsertProducts(Rec: Record 27; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[1024];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertProductByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpid>' + Rec."No." + '</erpid>';
        XMLRequestString += ' </InsertProductByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertProductByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE begin
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test);
            END;
        end;
    end;

    procedure UpdateProducts(Rec: Record 27; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[1024];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateProductByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpid>' + Rec."No." + '</erpid>';
        XMLRequestString += ' </UpdateProductByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateProductByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE begin
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test);
            end;
        end;
    end;

    procedure InsertCategories(ID: Code[20]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[1024];
        XMLRequestString: Text[1024];
        VarInstream: InStream;

    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertCategoryByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <categoryid>' + ID + '</categoryid>';
        XMLRequestString += ' </InsertCategoryByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertCategoryByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE BEGIN
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test);


            END;
        end;
    end;

    procedure UpdateCategories(ID: Code[20]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateCategoryByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <categoryid>' + ID + '</categoryid>';
        XMLRequestString += ' </UpdateCategoryByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateCategoryByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE begin
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test)
            end;
        end;
    end;

    procedure InsertUser(ID: Code[20]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertUserByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpuserid>' + ID + '</erpuserid>';
        XMLRequestString += ' </InsertUserByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertUserByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE begin
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test)
            end;
        end;
    end;

    procedure UpdateUser(ID: Code[20]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateUserByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpuserid>' + ID + '</erpuserid>';
        XMLRequestString += ' </UpdateUserByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateUserByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE begin
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
                VarInstream.ReadText(test);
                Message(Test)
            end;
        end;
    end;

    procedure InsertAllCategories()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertErpCategory xmlns="http://tempuri.org/">';
        XMLRequestString += ' </InsertErpCategory>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertErpCategory');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
    end;

    procedure InsertAllProducts()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertErpProduct xmlns="http://tempuri.org/">';
        XMLRequestString += ' </InsertErpProduct>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertErpProduct');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
    end;

    procedure InsertAllUsers()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <insertUpdateErpuser xmlns="http://tempuri.org/">';
        XMLRequestString += ' </insertUpdateErpuser>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/insertUpdateErpuser');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
    end;

    procedure InsertManufacturer()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <InsertAllManufacturers xmlns="http://tempuri.org/">';
        XMLRequestString += ' </InsertAllManufacturers>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/InsertAllManufacturers');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE begin
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(VarInstream));
            VarInstream.ReadText(test);
            Message(Test)
        end;
    end;

    procedure InsertOfflineOrders()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <OfflineCustomerAndOrderToNAV xmlns="http://tempuri.org/">';
        XMLRequestString += ' </OfflineCustomerAndOrderToNAV>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/OfflineCustomerAndOrderToNAV');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
    end;

    procedure UpdateOrderStatus(ID: Code[20]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateNopOrderStatus xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpordernum>' + ID + '</erpordernum>';
        XMLRequestString += ' </UpdateNopOrderStatus>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateNopOrderStatus');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
        end;
    end;

    procedure UpdateInvtAndPriceForOffline(Rec: Record 27; ShowMessage: Boolean)
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateProductInventoryAndPricesByERPid xmlns="http://tempuri.org/">';
        XMLRequestString += ' <erpid>' + Rec."No." + '</erpid>';
        XMLRequestString += ' </UpdateProductInventoryAndPricesByERPid>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateProductInventoryAndPricesByERPid');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if ShowMessage then begin
            if NOT ResponseMessage.IsSuccessStatusCode then
                Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
            ELSE
                Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
        end;
    end;

    procedure UpdateInvtAndPriceForAllOffline()
    var
        Client: HttpClient;
        AuthHeaderValue: HttpHeaders;
        Headers: HttpHeaders;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        test: Text[50];
        XMLRequestString: Text[1024];
    begin
        XMLRequestString += '<?xml version="1.0" encoding="utf-8"?>';
        XMLRequestString += '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"';
        XMLRequestString += ' xmlns:xsi="http://www.w3.org/2001/XMLSchea-instance"';
        XMLRequestString += ' xmlns:xsd="http://www.w3.org/2001/XMLSchema ">';
        XMLRequestString += ' <soap:Body>';
        XMLRequestString += ' <UpdateProductInventoryAndPrices xmlns="http://tempuri.org/">';
        XMLRequestString += ' </UpdateProductInventoryAndPrices>';
        XMLRequestString += ' </soap:Body>';
        XMLRequestString += '</soap:Envelope>';
        Content.WriteFrom(XMLRequestString);
        content.getheaders(headers);
        Headers.Add('SOAPAction', 'http://tempuri.org/UpdateProductInventoryAndPrices');
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'text/xml');
        Client.Post(GetEShopServiceURL, Content, ResponseMessage);
        if NOT ResponseMessage.IsSuccessStatusCode then
            Message('Failed %1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.ReasonPhrase)
        ELSE
            Message('%1,%2', ResponseMessage.HttpStatusCode, ResponseMessage.Content.ReadAs(test));
    end;

    procedure ReadXml(StrInstream: InStream; ParaName: Text[1024]) Result: Code[500]
    var
        lXmlDocument: XmlDocument;
        lPersonXmlNode: XmlNode;
        lText: Text[1024];
        lXmlNode: XMLNode;
        lXmlNodeList: XMLNodeList;
        xmlreadoption: XmlReadOptions;
    Begin
    End;

    procedure PubishMasters(ID: Code[20]; FunctionName: Text[1024]; ShowMessage: Boolean)
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Result: Text;
        URLText: Text;
        eShopSetup: Record "eShop Setup";
    begin
        eShopSetup.Get;
        IF ID <> '' then
            URLText := eShopSetup."eShop URL" + '/erpservice/' + Lowercase(FunctionName) + '/' + ID

        Else
            URLText := eShopSetup."eShop URL" + '/erpservice/' + Lowercase(FunctionName) + '/';
        Client.Get(URLText, Response);
        Response.Content.ReadAs(Result);
        IF ShowMessage then
            Message(Result);
    end;



}

codeunit 70009704 "eSHop Events"
{
    // version ES1.00


    trigger OnRun();
    begin
    end;

    var
        EShopMethods: Codeunit "eShop Methods";
        EshopBrowser: Page 70009723;
        EshopSetup: Record 70009700;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', false, false)]
    local procedure SendEmailForWebOrders(var SalesHeader: Record 36; var GenJnlPostLine: Codeunit 12; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]);
    var
        EshopSetup: Record 70009700;
    begin
        IF (EshopSetup.GET('')) AND (EshopSetup."Send Shipment Mail") THEN
            IF SalesHeader."eShop Web Order" THEN
                EShopMethods.SendEmailMulitple(SalesHeader);
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnAfterActionEvent', 'eShop Users', false, false)]
    local procedure RunEshopUsersFromCustomerCard(var Rec: Record 18);
    var
        EshopUser: Record "eShop Users";
        UserPage: Page "eShop Users";
    begin
        EshopUser.SETRANGE(EshopUser."No.", Rec."No.");
        UserPage.SETTABLEVIEW(EshopUser);
        UserPage.GetCustomerno(Rec."No.");
        UserPage.RUNMODAL;
    end;


    [EventSubscriber(ObjectType::Page, 21, 'OnAfterActionEvent', 'Create eShop Users', false, false)]
    local procedure "CreateEShop UsersFromCustomerCard"(var Rec: Record 18);
    begin
        EShopMethods.CreateUserfromCustomers(Rec);
    end;

    local procedure "----Item Card---"();
    begin
    end;

    
    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Publish', false, false)]
    local procedure PublishItemFromItemCard(var Rec: Record 27);
    var
        EShopDotnetService: Codeunit 70009703;
    begin
        CLEAR(EShopDotnetService);
        EShopDotnetService.PubishMasters(Rec."No.", 'insertproductbyerpid', true);
        //EShopDotnetService.InsertProducts(Rec, TRUE);
    end;

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Update', false, false)]
    local procedure UpdateItemFromItemCard(var Rec: Record 27);
    var
        EShopDotnetService: Codeunit 70009703;
    begin
        CLEAR(EShopDotnetService);
        EShopDotnetService.PubishMasters(Rec."No.", 'updateproductbyerpid', true);
        //EShopDotnetService.UpdateProducts(Rec, TRUE);
    end;

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Preview Item', false, false)]
    local procedure PreviewItemFromItemCard(var Rec: Record 27);
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

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Edit Item', false, false)]
    local procedure EditItemFromItemCard(var Rec: Record 27);
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

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Insert All', false, false)]
    local procedure InsertAllItemsFromItemCard(var Rec: Record 27);
    var
        EshopDotNetService: Codeunit 70009703;
    begin
        CLEAR(EshopDotNetService);
        EshopDotNetService.InsertAllProducts;
    end;

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Item Variations TO Variants', false, false)]
    local procedure Variations2VariantsFromItemCard(var Rec: Record 27);
    var
        EshopMethodsLoc: Codeunit "eShop Methods";
    begin
        CLEAR(EshopMethodsLoc);
        EShopMethods.Variations2Variants(Rec."No.");
    end;

    [EventSubscriber(ObjectType::Page, 30, 'OnAfterActionEvent', 'eShop Item Variants TO Variations', false, false)]
    local procedure Variants2VariationsFromItemCard(var Rec: Record 27);
    var
        EshopMethodsLoc: Codeunit "eShop Methods";
    begin
        CLEAR(EshopMethodsLoc);
        EShopMethods.Variants2Variations(Rec."No.");
    end;

    local procedure "----Sales Order Page----"();
    begin
    end;

    [EventSubscriber(ObjectType::Page, 42, 'OnAfterActionEvent', 'eShop Create Assembly Orders', false, false)]
    local procedure GenerateKitLines(var Rec: Record 36);
    var
        SalesOrdl: Record 37;
        EMethods: Codeunit "eShop Methods";
    begin
        EMethods.ConvertXML2BigText(Rec);
    end;

    [EventSubscriber(ObjectType::Page, 46, 'OnAfterActionEvent', 'eShop Preview Options', false, false)]
    local procedure PreviewOptions(var Rec: Record 37);
    var
        ESMethods: Codeunit "eShop Methods";
    begin
        ESMethods.PreviewOptions(Rec."Document Type", Rec."Document No.", Rec."Line No.", TRUE);
    end;

    local procedure "----Sales Header----"();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Login Email', false, false)]
    local procedure EshopLoginEmailOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    begin
        Rec."eShop Web Order" := TRUE;
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Shipping Amount', false, false)]
    local procedure EshopShippingAmountOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    begin
        Rec."eShop Shipping Amount" := Rec."eShop Shipping Amount";
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Paid With', false, false)]
    local procedure EshopPaidWithOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    var
        PaymentMethod: Record 289;
    begin
        WITH Rec DO BEGIN
            IF "eShop Paid With" = 'PAYMENTS.MANUAL' THEN
                "eShop Paid With" := 'CREDITCARD';
            IF "eShop Paid With" = 'PAYMENTS.CHARGELOGICCONNECT' THEN
                "eShop Paid With" := 'CREDITCARD';
            IF "eShop Paid With" = 'PAYMENTS.PURCHASEORDER' THEN
                "eShop Paid With" := 'PURCHASEORDER';


            CLEAR(PaymentMethod);
            PaymentMethod.SETRANGE("eShop Payment Method", "eShop Paid With");
            IF PaymentMethod.FINDFIRST THEN
                VALIDATE("Payment Method Code", PaymentMethod.Code);
        END;
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Shipped Via', false, false)]
    local procedure EshopShippedViaOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    var
        ShippingAgent: Record 291;
        ShippingMethod: Record 10;
    begin
        WITH Rec DO BEGIN
            CLEAR(ShippingAgent);
            ShippingAgent.SETRANGE("eShop Shipping Method", "eShop Shipped Via");
            IF ShippingAgent.FINDFIRST THEN
                "Shipping Agent Code" := ShippingAgent.Code;

            CLEAR(ShippingMethod);
            ShippingMethod.SETRANGE("eShop Shipping Method", "eShop Shipped Via");
            IF ShippingMethod.FINDFIRST THEN
                "Shipment Method Code" := ShippingMethod.Code;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Coupon Code 1', false, false)]
    local procedure CouponCode1OnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    begin
        IF Rec."eShop Coupon Code 1" <> '' THEN
            Rec.VALIDATE(Rec."eShop Coupon Code", Rec."eShop Coupon Code 1");
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Web CC', false, false)]
    local procedure WebCCOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    begin
        WITH Rec DO BEGIN
            IF GUIALLOWED THEN BEGIN
                IF ("eShop Web CC" <> '') AND (STRLEN("eShop Web CC") < 15) THEN
                    ERROR('Credit card number is not valid');
                IF STRPOS("eShop Web CC", '*') > 1 THEN
                    ERROR('Credit card number is not valid');
            END;
        END;
        EShopMethods.SetDataCC(Rec);
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Coupon Code', false, false)]
    local procedure CouponCodeOnValidate(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    var
        ESMethods: Codeunit "eShop Methods";
    begin
        WITH Rec DO BEGIN
            TESTFIELD(Status, Status::Open);
            //DES1.00
            CLEAR(ESMethods);
            ESMethods.ApplyCoupon(Rec);
            //DES
        END;
    end;

    [EventSubscriber(ObjectType::Table, 36, 'OnAfterValidateEvent', 'eShop Transaction Reference', false, false)]
    local procedure eShopTransactionReference(var Rec: Record 36; var xRec: Record 36; CurrFieldNo: Integer);
    begin
        IF Rec."eShop Transaction Reference" <> '' THEN
            Rec.VALIDATE("Your Reference", Rec."eShop Transaction Reference");
    end;

    local procedure "----Sales ine----"();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'eShop Category ID', false, false)]
    local procedure EshopCategoryOnValidate(var Rec: Record 37; var xRec: Record 37; CurrFieldNo: Integer);
    var
        EScategories: Record 70009702;
    begin
        /*
        WITH Rec DO BEGIN
            IF EScategories.GET("eShop Category ID") THEN
              IF EScategories."eShop ID" <> 0 THEN
                "eShop Category ID" := FORMAT(EScategories."eShop ID");
        END;
        */

    end;

    local procedure "----eShop Category----"();
    begin
    end;

    [EventSubscriber(ObjectType::Page, 70009717, 'OnAfterActionEvent', 'Preview Category', false, false)]
    local procedure PreviewCategory(var Rec: Record 70009702);
    begin
        EshopSetup.GET;
        IF EshopSetup."Browser Addin Exists" THEN BEGIN
            EshopBrowser.GetURL(EshopSetup."eShop URL" + '/c/' + FORMAT(Rec."eShop ID"));
            EshopBrowser.RUNMODAL
        END ELSE
            HYPERLINK(EshopSetup."eShop URL" + '/c/' + FORMAT(Rec."eShop ID"))
    end;

    [EventSubscriber(ObjectType::Page, 70009717, 'OnAfterActionEvent', 'Edit Category', false, false)]
    local procedure EditCategory(var Rec: Record 70009702);
    begin
        EshopSetup.GET;
        EshopSetup.TESTFIELD("eShop URL");
        IF EshopSetup."Browser Addin Exists" THEN BEGIN
            EshopBrowser.GetURL(EshopSetup."eShop URL" + '/Admin/Category/Edit/' + FORMAT(Rec."eShop ID"));
            EshopBrowser.RUNMODAL
        END ELSE
            HYPERLINK(EshopSetup."eShop URL" + '/Admin/Category/Edit/' + FORMAT(Rec."eShop ID"));
    end;

    [EventSubscriber(ObjectType::Page, 70009717, 'OnAfterActionEvent', 'Tree View', false, false)]
    local procedure TreeView(var Rec: Record 70009702);
    begin
        EshopSetup.GET;
        EshopSetup.TESTFIELD("eShop URL");
        IF EshopSetup."Browser Addin Exists" THEN BEGIN
            EshopBrowser.GetURL(EshopSetup."eShop URL" + '/Admin/Category/List');
            EshopBrowser.RUNMODAL
        END ELSE
            HYPERLINK(EshopSetup."eShop URL" + '/Admin/Category/List');
    end;

    local procedure "----Item Record----"();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 27, 'OnAfterValidateEvent', 'eShop Enabled', false, false)]
    local procedure CheckItemValidations(var Rec: Record 27; var xRec: Record 27; CurrFieldNo: Integer);
    begin
        IF Rec."eShop Enabled" THEN BEGIN
            EShopMethods.CheckItemFields(Rec);
            MESSAGE('Push the Publish Button');
        END ELSE MESSAGE('Push the Update Button');
    end;

    local procedure "---Users Record----"();
    begin
    end;

    [EventSubscriber(ObjectType::Table, 70009701, 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure CheckCustomerDetails(var Rec: Record 70009701; var xRec: Record 70009701; CurrFieldNo: Integer);
    var
        CustomerRec: Record 18;
    begin
        EShopMethods.CheckCustomerFields(Rec);
    end;

    local procedure "----eShop Setup Card---"();
    begin
    end;

    [EventSubscriber(ObjectType::Page, 70009716, 'OnAfterActionEvent', 'One Click Install', false, false)]
    local procedure RunOneClickInstall(var Rec: Record 70009700);
    begin
        REPORT.RUN(70009700);
    end;

    [EventSubscriber(ObjectType::Page, 70009716, 'OnAfterActionEvent', 'One Click Import', false, false)]
    local procedure RunOneClickImport(var Rec: Record 70009700);
    begin
        PAGE.RUN(70009743);
    end;
}
codeunit 70009706 "eSHop Sales Price Calc. Mgt."
{
    // version ES1.00

    // 
    // //<<DES1.00
    //   Added Functsions FindWebSalesPrice, FindWebSalesDiscount
    // //>>DES1.00


    trigger OnRun();
    begin
    end;

    var
        GLSetup: Record 98;
        Item: Record 27;
        ResPrice: Record 201;
        Res: Record 156;
        Currency: Record 4;

        Text000: Label '%1 is less than %2 in the %3.',
                Comment = 'ESM = %1 es menor que %2 en el %3.,FRC = %1 est inférieur à %2 dans le %3.,ENC = %1 is less than %2 in the %3.';



        Text010: Label 'Prices including VAT cannot be calculated when %1 is %2.';
        TempSalesPrice: Record 7002 TEMPORARY;
        TempSalesLineDisc: Record 7004 TEMPORARY;
        ResFindUnitPrice: Codeunit 221;
        LineDiscPerCent: Decimal;
        Qty: Decimal;
        AllowLineDisc: Boolean;
        AllowInvDisc: Boolean;
        VATPerCent: Decimal;
        PricesInclVAT: Boolean;
        VATCalcType: Option "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        VATBusPostingGr: Code[10];
        QtyPerUOM: Decimal;
        PricesInCurrency: Boolean;
        CurrencyFactor: Decimal;
        ExchRateDate: Date;
        Text018: Label '%1 %2 is greater than %3 and was adjusted to %4.';
        FoundSalesPrice: Boolean;
        Text001: Label 'The %1 in the %2 must be same as in the %3.';
        HideResUnitPriceMessage: Boolean;
        DateCaption: Text[30];

    procedure FindSalesLinePrice(SalesHeader: Record 36; var SalesLine: Record 37; CalledByFieldNo: Integer);
    begin
        WITH SalesLine DO BEGIN
            SetCurrency(
            SalesHeader."Currency Code", SalesHeader."Currency Factor", SalesHeaderExchDate(SalesHeader));
            SetVAT(SalesHeader."Prices Including VAT", "VAT %", "VAT Calculation Type", "VAT Bus. Posting Group");
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
            SetLineDisc("Line Discount %", "Allow Line Disc.", "Allow Invoice Disc.");

            TESTFIELD("Qty. per Unit of Measure");
            IF PricesInCurrency THEN
                SalesHeader.TESTFIELD("Currency Factor");

            CASE Type OF
                Type::Item:
                    BEGIN
                        Item.GET("No.");
                        SalesLinePriceExists(SalesHeader, SalesLine, FALSE);
                        CalcBestUnitPrice(TempSalesPrice);

                        IF FoundSalesPrice OR
                           NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                                (CalledByFieldNo = FIELDNO("Variant Code")))
                        THEN BEGIN
                            "Allow Line Disc." := TempSalesPrice."Allow Line Disc.";
                            "Allow Invoice Disc." := TempSalesPrice."Allow Invoice Disc.";
                            "Unit Price" := TempSalesPrice."Unit Price";
                        END;
                        IF NOT "Allow Line Disc." THEN
                            "Line Discount %" := 0;
                    END;
                Type::Resource:
                    BEGIN
                        SetResPrice("No.", "Work Type Code", "Currency Code");
                        ResFindUnitPrice.RUN(ResPrice);

                        ConvertPriceToVAT(FALSE, '', '', ResPrice."Unit Price");
                        ConvertPriceLCYToFCY(ResPrice."Currency Code", ResPrice."Unit Price");
                        "Unit Price" := ResPrice."Unit Price" * "Qty. per Unit of Measure";
                    END;
            END;
        END;
    end;

    procedure FindItemJnlLinePrice(var ItemJnlLine: Record 83; CalledByFieldNo: Integer);
    begin
        WITH ItemJnlLine DO BEGIN
            SetCurrency('', 0, 0D);
            SetVAT(FALSE, 0, 0, '');
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
            TESTFIELD("Qty. per Unit of Measure");
            Item.GET("Item No.");

            FindSalesPrice(
            TempSalesPrice, '', '', '', '', "Item No.", "Variant Code",
            "Unit of Measure Code", '', "Posting Date", FALSE);
            CalcBestUnitPrice(TempSalesPrice);
            IF FoundSalesPrice OR
             NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                  (CalledByFieldNo = FIELDNO("Variant Code")))
          THEN
                VALIDATE("Unit Amount", TempSalesPrice."Unit Price");
        END;
    end;

    procedure FindServLinePrice(ServHeader: Record 5900; var ServLine: Record 5902; CalledByFieldNo: Integer);
    var
        ServCost: Record 5905;
        Res: Record 156;
    begin
        WITH ServLine DO BEGIN
            ServHeader.GET("Document Type", "Document No.");
            IF Type <> Type::" " THEN BEGIN
                SetCurrency(
                ServHeader."Currency Code", ServHeader."Currency Factor", ServHeaderExchDate(ServHeader));
                SetVAT(ServHeader."Prices Including VAT", "VAT %", "VAT Calculation Type", "VAT Bus. Posting Group");
                SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
                SetLineDisc("Line Discount %", "Allow Line Disc.", FALSE);

                TESTFIELD("Qty. per Unit of Measure");
                IF PricesInCurrency THEN
                    ServHeader.TESTFIELD("Currency Factor");
            END;

            CASE Type OF
                Type::Item:
                    BEGIN
                        ServLinePriceExists(ServHeader, ServLine, FALSE);
                        CalcBestUnitPrice(TempSalesPrice);
                        IF FoundSalesPrice OR
                           NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                                (CalledByFieldNo = FIELDNO("Variant Code")))
                        THEN BEGIN
                            IF "Line Discount Type" = "Line Discount Type"::"Line Disc." THEN
                                "Allow Line Disc." := TempSalesPrice."Allow Line Disc.";
                            "Unit Price" := TempSalesPrice."Unit Price";
                        END;
                        IF NOT "Allow Line Disc." AND ("Line Discount Type" = "Line Discount Type"::"Line Disc.") THEN
                            "Line Discount %" := 0;
                    END;
                Type::Resource:
                    BEGIN
                        SetResPrice("No.", "Work Type Code", "Currency Code");
                        ResFindUnitPrice.RUN(ResPrice);

                        ConvertPriceToVAT(FALSE, '', '', ResPrice."Unit Price");
                        ResPrice."Unit Price" := ResPrice."Unit Price" * "Qty. per Unit of Measure";
                        ConvertPriceLCYToFCY(ResPrice."Currency Code", ResPrice."Unit Price");
                        IF (ResPrice."Unit Price" > ServHeader."Max. Labor Unit Price") AND
                           (ServHeader."Max. Labor Unit Price" <> 0)
                        THEN BEGIN
                            Res.GET("No.");
                            "Unit Price" := ServHeader."Max. Labor Unit Price";
                            IF (HideResUnitPriceMessage = FALSE) AND
                             (CalledByFieldNo <> FIELDNO(Quantity))
                          THEN
                                MESSAGE(
                              STRSUBSTNO(
                                Text018,
                                Res.TABLECAPTION, FIELDCAPTION("Unit Price"),
                                ServHeader.FIELDCAPTION("Max. Labor Unit Price"),
                                ServHeader."Max. Labor Unit Price"));
                            HideResUnitPriceMessage := TRUE;
                        END ELSE
                            "Unit Price" := ResPrice."Unit Price";
                    END;
                Type::Cost:
                    BEGIN
                        ServCost.GET("No.");

                        ConvertPriceToVAT(FALSE, '', '', ServCost."Default Unit Price");
                        ConvertPriceLCYToFCY('', ServCost."Default Unit Price");
                        "Unit Price" := ServCost."Default Unit Price";
                    END;
            END;
        END;
    end;

    procedure FindSalesLineLineDisc(SalesHeader: Record 36; var SalesLine: Record 37);
    begin
        WITH SalesLine DO BEGIN
            SetCurrency(SalesHeader."Currency Code", 0, 0D);
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

            TESTFIELD("Qty. per Unit of Measure");

            IF Type = Type::Item THEN BEGIN
                SalesLineLineDiscExists(SalesHeader, SalesLine, FALSE);
                CalcBestLineDisc(TempSalesLineDisc);

                "Line Discount %" := TempSalesLineDisc."Line Discount %";
            END;
        END;
    end;

    procedure FindServLineDisc(ServHeader: Record 5900; var ServInvLine: Record 5902);
    begin
        WITH ServInvLine DO BEGIN
            SetCurrency(ServHeader."Currency Code", 0, 0D);
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

            TESTFIELD("Qty. per Unit of Measure");

            IF Type = Type::Item THEN BEGIN
                Item.GET("No.");
                FindSalesLineDisc(
                TempSalesLineDisc, "Bill-to Customer No.", ServHeader."Contact No.",
                "Customer Disc. Group", '', "No.", Item."Item Disc. Group", "Variant Code",
                "Unit of Measure Code", ServHeader."Currency Code", ServHeader."Order Date", FALSE);
                CalcBestLineDisc(TempSalesLineDisc);
                "Line Discount %" := TempSalesLineDisc."Line Discount %";
            END;
            IF Type IN [Type::Resource, Type::Cost, Type::"G/L Account"] THEN BEGIN
                "Line Discount %" := 0;
                "Line Discount Amount" :=
                ROUND(
                  ROUND(CalcChargeableQty * "Unit Price", Currency."Amount Rounding Precision") *
                  "Line Discount %" / 100, Currency."Amount Rounding Precision");
                "Inv. Discount Amount" := 0;
                "Inv. Disc. Amount to Invoice" := 0;
            END;
        END;
    end;

    procedure FindStdItemJnlLinePrice(var StdItemJnlLine: Record 753; CalledByFieldNo: Integer);
    begin
        WITH StdItemJnlLine DO BEGIN
            SetCurrency('', 0, 0D);
            SetVAT(FALSE, 0, 0, '');
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
            TESTFIELD("Qty. per Unit of Measure");
            Item.GET("Item No.");

            FindSalesPrice(
            TempSalesPrice, '', '', '', '', "Item No.", "Variant Code",
            "Unit of Measure Code", '', WORKDATE, FALSE);
            CalcBestUnitPrice(TempSalesPrice);
            IF FoundSalesPrice OR
             NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                  (CalledByFieldNo = FIELDNO("Variant Code")))
          THEN
                VALIDATE("Unit Amount", TempSalesPrice."Unit Price");
        END;
    end;

    procedure FindAnalysisReportPrice(ItemNo: Code[20]; Date: Date): Decimal;
    begin
        SetCurrency('', 0, 0D);
        SetVAT(FALSE, 0, 0, '');
        SetUoM(0, 1);
        Item.GET(ItemNo);

        FindSalesPrice(TempSalesPrice, '', '', '', '', ItemNo, '', '', '', Date, FALSE);
        CalcBestUnitPrice(TempSalesPrice);
        IF FoundSalesPrice THEN
            EXIT(TempSalesPrice."Unit Price");
        EXIT(Item."Unit Price");
    end;

    local procedure CalcBestUnitPrice(var SalesPrice: Record 7002);
    var
        BestSalesPrice: Record 7002;
    begin
        WITH SalesPrice DO BEGIN
            FoundSalesPrice := FINDSET;
            IF FoundSalesPrice THEN
                REPEAT
                    IF IsInMinQty("Unit of Measure Code", "Minimum Quantity") THEN BEGIN
                        ConvertPriceToVAT(
                      "Price Includes VAT", Item."VAT Prod. Posting Group",
                      "VAT Bus. Posting Gr. (Price)", "Unit Price");
                        ConvertPriceToUoM("Unit of Measure Code", "Unit Price");
                        ConvertPriceLCYToFCY("Currency Code", "Unit Price");

                        CASE TRUE OF
                            ((BestSalesPrice."Currency Code" = '') AND ("Currency Code" <> '')) OR
                      ((BestSalesPrice."Variant Code" = '') AND ("Variant Code" <> '')):
                                BestSalesPrice := SalesPrice;
                            ((BestSalesPrice."Currency Code" = '') OR ("Currency Code" <> '')) AND
                      ((BestSalesPrice."Variant Code" = '') OR ("Variant Code" <> '')):
                                IF (BestSalesPrice."Unit Price" = 0) OR
                                   (CalcLineAmount(BestSalesPrice) > CalcLineAmount(SalesPrice))
                                THEN
                                    BestSalesPrice := SalesPrice;
                        END;
                    END;
                UNTIL NEXT = 0;
        END;

        // No price found in agreement
        IF BestSalesPrice."Unit Price" = 0 THEN BEGIN
            ConvertPriceToVAT(
            Item."Price Includes VAT", Item."VAT Prod. Posting Group",
            Item."VAT Bus. Posting Gr. (Price)", Item."Unit Price");
            ConvertPriceToUoM('', Item."Unit Price");
            ConvertPriceLCYToFCY('', Item."Unit Price");

            CLEAR(BestSalesPrice);
            BestSalesPrice."Unit Price" := Item."Unit Price";
            BestSalesPrice."Allow Line Disc." := AllowLineDisc;
            BestSalesPrice."Allow Invoice Disc." := AllowInvDisc;
        END;

        SalesPrice := BestSalesPrice;
    end;

    local procedure CalcBestLineDisc(var SalesLineDisc: Record 7004);
    var
        BestSalesLineDisc: Record 7004;
    begin
        WITH SalesLineDisc DO BEGIN
            IF FINDSET THEN
                REPEAT
                    IF IsInMinQty("Unit of Measure Code", "Minimum Quantity") THEN
                        CASE TRUE OF
                            ((BestSalesLineDisc."Currency Code" = '') AND ("Currency Code" <> '')) OR
                      ((BestSalesLineDisc."Variant Code" = '') AND ("Variant Code" <> '')):
                                BestSalesLineDisc := SalesLineDisc;
                            ((BestSalesLineDisc."Currency Code" = '') OR ("Currency Code" <> '')) AND
                      ((BestSalesLineDisc."Variant Code" = '') OR ("Variant Code" <> '')):
                                IF BestSalesLineDisc."Line Discount %" < "Line Discount %" THEN
                                    BestSalesLineDisc := SalesLineDisc;
                        END;
                UNTIL NEXT = 0;
        END;

        SalesLineDisc := BestSalesLineDisc;
    end;

    procedure FindSalesPrice(var ToSalesPrice: Record 7002; CustNo: Code[20]; ContNo: Code[20]; CustPriceGrCode: Code[10]; CampaignNo: Code[20]; ItemNo: Code[20]; VariantCode: Code[10]; UOM: Code[10]; CurrencyCode: Code[10]; StartingDate: Date; ShowAll: Boolean);
    var
        FromSalesPrice: Record 7002;
        TempTargetCampaignGr: Record 7030 TEMPORARY;
    begin
        WITH FromSalesPrice DO BEGIN
            SETRANGE("Item No.", ItemNo);
            SETFILTER("Variant Code", '%1|%2', VariantCode, '');
            SETFILTER("Ending Date", '%1|>=%2', 0D, StartingDate);
            IF NOT ShowAll THEN BEGIN
                SETFILTER("Currency Code", '%1|%2', CurrencyCode, '');
                IF UOM <> '' THEN
                    SETFILTER("Unit of Measure Code", '%1|%2', UOM, '');
                SETRANGE("Starting Date", 0D, StartingDate);
            END;

            ToSalesPrice.RESET;
            ToSalesPrice.DELETEALL;

            SETRANGE("Sales Type", "Sales Type"::"All Customers");
            SETRANGE("Sales Code");
            CopySalesPriceToSalesPrice(FromSalesPrice, ToSalesPrice);

            IF CustNo <> '' THEN BEGIN
                SETRANGE("Sales Type", "Sales Type"::Customer);
                SETRANGE("Sales Code", CustNo);
                CopySalesPriceToSalesPrice(FromSalesPrice, ToSalesPrice);
            END;

            IF CustPriceGrCode <> '' THEN BEGIN
                SETRANGE("Sales Type", "Sales Type"::"Customer Price Group");
                SETRANGE("Sales Code", CustPriceGrCode);
                CopySalesPriceToSalesPrice(FromSalesPrice, ToSalesPrice);
            END;

            IF NOT ((CustNo = '') AND (ContNo = '') AND (CampaignNo = '')) THEN BEGIN
                SETRANGE("Sales Type", "Sales Type"::Campaign);
                IF ActivatedCampaignExists(TempTargetCampaignGr, CustNo, ContNo, CampaignNo) THEN
                    REPEAT
                        SETRANGE("Sales Code", TempTargetCampaignGr."Campaign No.");
                        CopySalesPriceToSalesPrice(FromSalesPrice, ToSalesPrice);
                    UNTIL TempTargetCampaignGr.NEXT = 0;
            END;
        END;
    end;

    procedure FindSalesLineDisc(var ToSalesLineDisc: Record 7004; CustNo: Code[20]; ContNo: Code[20]; CustDiscGrCode: Code[20]; CampaignNo: Code[20]; ItemNo: Code[20]; ItemDiscGrCode: Code[20]; VariantCode: Code[10]; UOM: Code[10]; CurrencyCode: Code[10]; StartingDate: Date; ShowAll: Boolean);
    var
        FromSalesLineDisc: Record 7004;
        TempCampaignTargetGr: Record 7030 TEMPORARY;
        InclCampaigns: Boolean;
    begin
        WITH FromSalesLineDisc DO BEGIN
            SETFILTER("Ending Date", '%1|>=%2', 0D, StartingDate);
            SETFILTER("Variant Code", '%1|%2', VariantCode, '');
            IF NOT ShowAll THEN BEGIN
                SETRANGE("Starting Date", 0D, StartingDate);
                SETFILTER("Currency Code", '%1|%2', CurrencyCode, '');
                IF UOM <> '' THEN
                    SETFILTER("Unit of Measure Code", '%1|%2', UOM, '');
            END;

            ToSalesLineDisc.RESET;
            ToSalesLineDisc.DELETEALL;
            FOR "Sales Type" := "Sales Type"::Customer TO "Sales Type"::Campaign DO
                IF ("Sales Type" = "Sales Type"::"All Customers") OR
                   (("Sales Type" = "Sales Type"::Customer) AND (CustNo <> '')) OR
                   (("Sales Type" = "Sales Type"::"Customer Disc. Group") AND (CustDiscGrCode <> '')) OR
                   (("Sales Type" = "Sales Type"::Campaign) AND
                    NOT ((CustNo = '') AND (ContNo = '') AND (CampaignNo = '')))
                THEN BEGIN
                    InclCampaigns := FALSE;

                    SETRANGE("Sales Type", "Sales Type");
                    CASE "Sales Type" OF
                        "Sales Type"::"All Customers":
                            SETRANGE("Sales Code");
                        "Sales Type"::Customer:
                            SETRANGE("Sales Code", CustNo);
                        "Sales Type"::"Customer Disc. Group":
                            SETRANGE("Sales Code", CustDiscGrCode);
                        "Sales Type"::Campaign:
                            BEGIN
                                InclCampaigns := ActivatedCampaignExists(TempCampaignTargetGr, CustNo, ContNo, CampaignNo);
                                SETRANGE("Sales Code", TempCampaignTargetGr."Campaign No.");
                            END;
                    END;

                    REPEAT
                        SETRANGE(Type, Type::Item);
                        SETRANGE(Code, ItemNo);
                        CopySalesDiscToSalesDisc(FromSalesLineDisc, ToSalesLineDisc);

                        IF ItemDiscGrCode <> '' THEN BEGIN
                            SETRANGE(Type, Type::"Item Disc. Group");
                            SETRANGE(Code, ItemDiscGrCode);
                            CopySalesDiscToSalesDisc(FromSalesLineDisc, ToSalesLineDisc);
                        END;

                        IF InclCampaigns THEN BEGIN
                            InclCampaigns := TempCampaignTargetGr.NEXT <> 0;
                            SETRANGE("Sales Code", TempCampaignTargetGr."Campaign No.");
                        END;
                    UNTIL NOT InclCampaigns;
                END;
        END;
    end;

    procedure CopySalesPrice(var SalesPrice: Record 7002);
    begin
        SalesPrice.DELETEALL;
        CopySalesPriceToSalesPrice(TempSalesPrice, SalesPrice);
    end;

    local procedure CopySalesPriceToSalesPrice(var FromSalesPrice: Record 7002; var ToSalesPrice: Record 7002);
    begin
        WITH ToSalesPrice DO BEGIN
            IF FromSalesPrice.FINDSET THEN
                REPEAT
                    IF FromSalesPrice."Unit Price" <> 0 THEN BEGIN
                        ToSalesPrice := FromSalesPrice;
                        INSERT;
                    END;
                UNTIL FromSalesPrice.NEXT = 0;
        END;
    end;

    local procedure CopySalesDiscToSalesDisc(var FromSalesLineDisc: Record 7004; var ToSalesLineDisc: Record 7004);
    begin
        WITH ToSalesLineDisc DO BEGIN
            IF FromSalesLineDisc.FINDSET THEN
                REPEAT
                    IF FromSalesLineDisc."Line Discount %" <> 0 THEN BEGIN
                        ToSalesLineDisc := FromSalesLineDisc;
                        INSERT;
                    END;
                UNTIL FromSalesLineDisc.NEXT = 0;
        END;
    end;

    procedure SetResPrice(Code2: Code[20]; WorkTypeCode: Code[10]; CurrencyCode: Code[10]);
    begin
        WITH ResPrice DO BEGIN
            INIT;
            Code := Code2;
            "Work Type Code" := WorkTypeCode;
            "Currency Code" := CurrencyCode;
        END;
    end;

    local procedure SetCurrency(CurrencyCode2: Code[10]; CurrencyFactor2: Decimal; ExchRateDate2: Date);
    begin
        PricesInCurrency := CurrencyCode2 <> '';
        IF PricesInCurrency THEN BEGIN
            Currency.GET(CurrencyCode2);
            Currency.TESTFIELD("Unit-Amount Rounding Precision");
            CurrencyFactor := CurrencyFactor2;
            ExchRateDate := ExchRateDate2;
        END ELSE
            GLSetup.GET;
    end;

    local procedure SetVAT(PriceInclVAT2: Boolean; VATPerCent2: Decimal; VATCalcType2: Option; VATBusPostingGr2: Code[10]);
    begin
        PricesInclVAT := PriceInclVAT2;
        VATPerCent := VATPerCent2;
        VATCalcType := VATCalcType2;
        VATBusPostingGr := VATBusPostingGr2;
    end;

    local procedure SetUoM(Qty2: Decimal; QtyPerUoM2: Decimal);
    begin
        Qty := Qty2;
        QtyPerUOM := QtyPerUoM2;
    end;

    local procedure SetLineDisc(LineDiscPerCent2: Decimal; AllowLineDisc2: Boolean; AllowInvDisc2: Boolean);
    begin
        LineDiscPerCent := LineDiscPerCent2;
        AllowLineDisc := AllowLineDisc2;
        AllowInvDisc := AllowInvDisc2;
    end;

    local procedure IsInMinQty(UnitofMeasureCode: Code[10]; MinQty: Decimal): Boolean;
    begin
        IF UnitofMeasureCode = '' THEN
            EXIT(MinQty <= QtyPerUOM * Qty);
        EXIT(MinQty <= Qty);
    end;

    local procedure ConvertPriceToVAT(FromPricesInclVAT: Boolean; FromVATProdPostingGr: Code[10]; FromVATBusPostingGr: Code[10]; var UnitPrice: Decimal);
    var
        VATPostingSetup: Record 325;
    begin
        IF FromPricesInclVAT THEN BEGIN
            VATPostingSetup.GET(FromVATBusPostingGr, FromVATProdPostingGr);

            CASE VATPostingSetup."VAT Calculation Type" OF
                VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT":
                    VATPostingSetup."VAT %" := 0;
                VATPostingSetup."VAT Calculation Type"::"Sales Tax":
                    ERROR(
                      Text010,
                      VATPostingSetup.FIELDCAPTION("VAT Calculation Type"),
                      VATPostingSetup."VAT Calculation Type");
            END;

            CASE VATCalcType OF
                VATCalcType::"Normal VAT",
                VATCalcType::"Full VAT",
                VATCalcType::"Sales Tax":
                    BEGIN
                        IF PricesInclVAT THEN BEGIN
                            IF VATBusPostingGr <> FromVATBusPostingGr THEN
                                UnitPrice := UnitPrice * (100 + VATPerCent) / (100 + VATPostingSetup."VAT %");
                        END ELSE
                            UnitPrice := UnitPrice / (1 + VATPostingSetup."VAT %" / 100);
                    END;
                VATCalcType::"Reverse Charge VAT":
                    UnitPrice := UnitPrice / (1 + VATPostingSetup."VAT %" / 100);
            END;
        END ELSE
            IF PricesInclVAT THEN
                UnitPrice := UnitPrice * (1 + VATPerCent / 100);
    end;

    local procedure ConvertPriceToUoM(UnitOfMeasureCode: Code[10]; var UnitPrice: Decimal);
    begin
        IF UnitOfMeasureCode = '' THEN
            UnitPrice := UnitPrice * QtyPerUOM;
    end;

    local procedure ConvertPriceLCYToFCY(CurrencyCode: Code[10]; var UnitPrice: Decimal);
    var
        CurrExchRate: Record 330;
    begin
        IF PricesInCurrency THEN BEGIN
            IF CurrencyCode = '' THEN
                UnitPrice :=
              CurrExchRate.ExchangeAmtLCYToFCY(ExchRateDate, Currency.Code, UnitPrice, CurrencyFactor);
            UnitPrice := ROUND(UnitPrice, Currency."Unit-Amount Rounding Precision");
        END ELSE
            UnitPrice := ROUND(UnitPrice, GLSetup."Unit-Amount Rounding Precision");
    end;

    local procedure CalcLineAmount(SalesPrice: Record 7002): Decimal;
    begin
        WITH SalesPrice DO BEGIN
            IF "Allow Line Disc." THEN
                EXIT("Unit Price" * (1 - LineDiscPerCent / 100));
            EXIT("Unit Price");
        END;
    end;

    procedure GetSalesLinePrice(SalesHeader: Record 36; var SalesLine: Record 37);
    begin
        SalesLinePriceExists(SalesHeader, SalesLine, TRUE);

        WITH SalesLine DO
            IF PAGE.RUNMODAL(PAGE::"Get Sales Price", TempSalesPrice) = ACTION::LookupOK THEN BEGIN
                SetVAT(
                SalesHeader."Prices Including VAT", "VAT %", "VAT Calculation Type", "VAT Bus. Posting Group");
                SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
                SetCurrency(
                SalesHeader."Currency Code", SalesHeader."Currency Factor", SalesHeaderExchDate(SalesHeader));

                IF NOT IsInMinQty(TempSalesPrice."Unit of Measure Code", TempSalesPrice."Minimum Quantity") THEN
                    ERROR(
                  Text000,
                  FIELDCAPTION(Quantity),
                  TempSalesPrice.FIELDCAPTION("Minimum Quantity"),
                  TempSalesPrice.TABLECAPTION);
                IF NOT (TempSalesPrice."Currency Code" IN ["Currency Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Currency Code"),
                  TABLECAPTION,
                  TempSalesPrice.TABLECAPTION);
                IF NOT (TempSalesPrice."Unit of Measure Code" IN ["Unit of Measure Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Unit of Measure Code"),
                  TABLECAPTION,
                  TempSalesPrice.TABLECAPTION);
                IF TempSalesPrice."Starting Date" > SalesHeaderStartDate(SalesHeader, DateCaption) THEN
                    ERROR(
                  Text000,
                  DateCaption,
                  TempSalesPrice.FIELDCAPTION("Starting Date"),
                  TempSalesPrice.TABLECAPTION);

                ConvertPriceToVAT(
                TempSalesPrice."Price Includes VAT", Item."VAT Prod. Posting Group",
                TempSalesPrice."VAT Bus. Posting Gr. (Price)", TempSalesPrice."Unit Price");
                ConvertPriceToUoM(TempSalesPrice."Unit of Measure Code", TempSalesPrice."Unit Price");
                ConvertPriceLCYToFCY(TempSalesPrice."Currency Code", TempSalesPrice."Unit Price");

                "Allow Invoice Disc." := TempSalesPrice."Allow Invoice Disc.";
                "Allow Line Disc." := TempSalesPrice."Allow Line Disc.";
                IF NOT "Allow Line Disc." THEN
                    "Line Discount %" := 0;

                VALIDATE("Unit Price", TempSalesPrice."Unit Price");
            END;
    end;

    procedure GetSalesLineLineDisc(SalesHeader: Record 36; var SalesLine: Record 37);
    begin
        SalesLineLineDiscExists(SalesHeader, SalesLine, TRUE);

        WITH SalesLine DO
            IF PAGE.RUNMODAL(PAGE::"Get Sales Line Disc.", TempSalesLineDisc) = ACTION::LookupOK THEN BEGIN
                SetCurrency(SalesHeader."Currency Code", 0, 0D);
                SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

                IF NOT IsInMinQty(TempSalesLineDisc."Unit of Measure Code", TempSalesLineDisc."Minimum Quantity")
              THEN
                    ERROR(
                  Text000, FIELDCAPTION(Quantity),
                  TempSalesLineDisc.FIELDCAPTION("Minimum Quantity"),
                  TempSalesLineDisc.TABLECAPTION);
                IF NOT (TempSalesLineDisc."Currency Code" IN ["Currency Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Currency Code"),
                  TABLECAPTION,
                  TempSalesLineDisc.TABLECAPTION);
                IF NOT (TempSalesLineDisc."Unit of Measure Code" IN ["Unit of Measure Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Unit of Measure Code"),
                  TABLECAPTION,
                  TempSalesLineDisc.TABLECAPTION);
                IF TempSalesLineDisc."Starting Date" > SalesHeaderStartDate(SalesHeader, DateCaption) THEN
                    ERROR(
                  Text000,
                  DateCaption,
                  TempSalesLineDisc.FIELDCAPTION("Starting Date"),
                  TempSalesLineDisc.TABLECAPTION);

                TESTFIELD("Allow Line Disc.");
                VALIDATE("Line Discount %", TempSalesLineDisc."Line Discount %");
            END;
    end;

    procedure SalesLinePriceExists(SalesHeader: Record 36; var SalesLine: Record 37; ShowAll: Boolean): Boolean;
    begin
        WITH SalesLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                FindSalesPrice(
                TempSalesPrice, "Bill-to Customer No.", SalesHeader."Bill-to Contact No.",
                "Customer Price Group", '', "No.", "Variant Code", "Unit of Measure Code",
                SalesHeader."Currency Code", SalesHeaderStartDate(SalesHeader, DateCaption), ShowAll);
                EXIT(TempSalesPrice.FINDFIRST);
            END;
        EXIT(FALSE);
    end;

    procedure SalesLineLineDiscExists(SalesHeader: Record 36; var SalesLine: Record 37; ShowAll: Boolean): Boolean;
    begin
        WITH SalesLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                FindSalesLineDisc(
                TempSalesLineDisc, "Bill-to Customer No.", SalesHeader."Bill-to Contact No.",
                "Customer Disc. Group", '', "No.", Item."Item Disc. Group", "Variant Code", "Unit of Measure Code",
                SalesHeader."Currency Code", SalesHeaderStartDate(SalesHeader, DateCaption), ShowAll);
                EXIT(TempSalesLineDisc.FINDFIRST);
            END;
        EXIT(FALSE);
    end;

    procedure GetServLinePrice(ServHeader: Record 5900; var ServLine: Record 5902);
    begin
        ServLinePriceExists(ServHeader, ServLine, TRUE);

        WITH ServLine DO
            IF PAGE.RUNMODAL(PAGE::"Get Sales Price", TempSalesPrice) = ACTION::LookupOK THEN BEGIN
                SetVAT(
                ServHeader."Prices Including VAT", "VAT %", "VAT Calculation Type", "VAT Bus. Posting Group");
                SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
                SetCurrency(
                ServHeader."Currency Code", ServHeader."Currency Factor", ServHeaderExchDate(ServHeader));

                IF NOT IsInMinQty(TempSalesPrice."Unit of Measure Code", TempSalesPrice."Minimum Quantity") THEN
                    ERROR(
                  Text000,
                  FIELDCAPTION(Quantity),
                  TempSalesPrice.FIELDCAPTION("Minimum Quantity"),
                  TempSalesPrice.TABLECAPTION);
                IF NOT (TempSalesPrice."Currency Code" IN ["Currency Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Currency Code"),
                  TABLECAPTION,
                  TempSalesPrice.TABLECAPTION);
                IF NOT (TempSalesPrice."Unit of Measure Code" IN ["Unit of Measure Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Unit of Measure Code"),
                  TABLECAPTION,
                  TempSalesPrice.TABLECAPTION);
                IF TempSalesPrice."Starting Date" > ServHeaderStartDate(ServHeader, DateCaption) THEN
                    ERROR(
                  Text000,
                  DateCaption,
                  TempSalesPrice.FIELDCAPTION("Starting Date"),
                  TempSalesPrice.TABLECAPTION);

                ConvertPriceToVAT(
                TempSalesPrice."Price Includes VAT", Item."VAT Prod. Posting Group",
                TempSalesPrice."VAT Bus. Posting Gr. (Price)", TempSalesPrice."Unit Price");
                ConvertPriceToUoM(TempSalesPrice."Unit of Measure Code", TempSalesPrice."Unit Price");
                ConvertPriceLCYToFCY(TempSalesPrice."Currency Code", TempSalesPrice."Unit Price");

                "Allow Invoice Disc." := TempSalesPrice."Allow Invoice Disc.";
                "Allow Line Disc." := TempSalesPrice."Allow Line Disc.";
                IF NOT "Allow Line Disc." THEN
                    "Line Discount %" := 0;

                VALIDATE("Unit Price", TempSalesPrice."Unit Price");
                ConfirmAdjPriceLineChange;
            END;
    end;

    procedure GetServLineLineDisc(ServHeader: Record 5900; var ServLine: Record 5902);
    begin
        ServLineLineDiscExists(ServHeader, ServLine, TRUE);

        WITH ServLine DO
            IF PAGE.RUNMODAL(PAGE::"Get Sales Line Disc.", TempSalesLineDisc) = ACTION::LookupOK THEN BEGIN
                SetCurrency(ServHeader."Currency Code", 0, 0D);
                SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

                IF NOT IsInMinQty(TempSalesLineDisc."Unit of Measure Code", TempSalesLineDisc."Minimum Quantity")
              THEN
                    ERROR(
                  Text000, FIELDCAPTION(Quantity),
                  TempSalesLineDisc.FIELDCAPTION("Minimum Quantity"),
                  TempSalesLineDisc.TABLECAPTION);
                IF NOT (TempSalesLineDisc."Currency Code" IN ["Currency Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Currency Code"),
                  TABLECAPTION,
                  TempSalesLineDisc.TABLECAPTION);
                IF NOT (TempSalesLineDisc."Unit of Measure Code" IN ["Unit of Measure Code", '']) THEN
                    ERROR(
                  Text001,
                  FIELDCAPTION("Unit of Measure Code"),
                  TABLECAPTION,
                  TempSalesLineDisc.TABLECAPTION);
                IF TempSalesLineDisc."Starting Date" > ServHeaderStartDate(ServHeader, DateCaption) THEN
                    ERROR(
                  Text000,
                  DateCaption,
                  TempSalesLineDisc.FIELDCAPTION("Starting Date"),
                  TempSalesLineDisc.TABLECAPTION);

                TESTFIELD("Allow Line Disc.");
                CheckLineDiscount(TempSalesLineDisc."Line Discount %");
                VALIDATE("Line Discount %", TempSalesLineDisc."Line Discount %");
                ConfirmAdjPriceLineChange;
            END;
    end;

    procedure ServLinePriceExists(ServHeader: Record 5900; var ServLine: Record 5902; ShowAll: Boolean): Boolean;
    begin
        WITH ServLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                FindSalesPrice(
                TempSalesPrice, "Bill-to Customer No.", ServHeader."Bill-to Contact No.",
                "Customer Price Group", '', "No.", "Variant Code", "Unit of Measure Code",
                ServHeader."Currency Code", ServHeaderStartDate(ServHeader, DateCaption), ShowAll);
                EXIT(TempSalesPrice.FIND('-'));
            END;
        EXIT(FALSE);
    end;

    procedure ServLineLineDiscExists(ServHeader: Record 5900; var ServLine: Record 5902; ShowAll: Boolean): Boolean;
    begin
        WITH ServLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                FindSalesLineDisc(
                TempSalesLineDisc, "Bill-to Customer No.", ServHeader."Bill-to Contact No.",
                "Customer Disc. Group", '', "No.", Item."Item Disc. Group", "Variant Code", "Unit of Measure Code",
                ServHeader."Currency Code", ServHeaderStartDate(ServHeader, DateCaption), ShowAll);
                EXIT(TempSalesLineDisc.FIND('-'));
            END;
        EXIT(FALSE);
    end;

    local procedure ActivatedCampaignExists(var ToCampaignTargetGr: Record 7030; CustNo: Code[20]; ContNo: Code[20]; CampaignNo: Code[20]): Boolean;
    var
        FromCampaignTargetGr: Record 7030;
        Cont: Record 5050;
    begin
        WITH FromCampaignTargetGr DO BEGIN
            ToCampaignTargetGr.RESET;
            ToCampaignTargetGr.DELETEALL;

            IF CampaignNo <> '' THEN BEGIN
                ToCampaignTargetGr."Campaign No." := CampaignNo;
                ToCampaignTargetGr.INSERT;
            END ELSE BEGIN
                SETRANGE(Type, Type::Customer);
                SETRANGE("No.", CustNo);
                IF FINDSET THEN
                    REPEAT
                        ToCampaignTargetGr := FromCampaignTargetGr;
                        ToCampaignTargetGr.INSERT;
                    UNTIL NEXT = 0
                ELSE BEGIN
                    IF Cont.GET(ContNo) THEN BEGIN
                        SETRANGE(Type, Type::Contact);
                        SETRANGE("No.", Cont."Company No.");
                        IF FINDSET THEN
                            REPEAT
                                ToCampaignTargetGr := FromCampaignTargetGr;
                                ToCampaignTargetGr.INSERT;
                            UNTIL NEXT = 0;
                    END;
                END;
            END;
            EXIT(ToCampaignTargetGr.FINDFIRST);
        END;
    end;

    local procedure SalesHeaderExchDate(SalesHeader: Record 36): Date;
    begin
        WITH SalesHeader DO BEGIN
            IF "Posting Date" <> 0D THEN
                EXIT("Posting Date");
            EXIT(WORKDATE);
        END;
    end;

    local procedure SalesHeaderStartDate(SalesHeader: Record 36; var DateCaption: Text[30]): Date;
    begin
        WITH SalesHeader DO
            IF "Document Type" IN ["Document Type"::Invoice, "Document Type"::"Credit Memo"] THEN BEGIN
                DateCaption := FIELDCAPTION("Posting Date");
                EXIT("Posting Date")
            END ELSE BEGIN
                DateCaption := FIELDCAPTION("Order Date");
                EXIT("Order Date");
            END;
    end;

    local procedure ServHeaderExchDate(ServHeader: Record 5900): Date;
    begin
        WITH ServHeader DO BEGIN
            IF ("Document Type" = "Document Type"::Quote) AND
             ("Posting Date" = 0D)
          THEN
                EXIT(WORKDATE);
            EXIT("Posting Date");
        END;
    end;

    local procedure ServHeaderStartDate(ServHeader: Record 5900; var DateCaption: Text[30]): Date;
    begin
        WITH ServHeader DO
            IF "Document Type" IN ["Document Type"::Invoice, "Document Type"::"Credit Memo"] THEN BEGIN
                DateCaption := FIELDCAPTION("Posting Date");
                EXIT("Posting Date")
            END ELSE BEGIN
                DateCaption := FIELDCAPTION("Order Date");
                EXIT("Order Date");
            END;
    end;

    procedure NoOfSalesLinePrice(SalesHeader: Record 36; var SalesLine: Record 37; ShowAll: Boolean): Integer;
    begin
        IF SalesLinePriceExists(SalesHeader, SalesLine, ShowAll) THEN
            EXIT(TempSalesPrice.COUNT);
    end;

    procedure NoOfSalesLineLineDisc(SalesHeader: Record 36; var SalesLine: Record 37; ShowAll: Boolean): Integer;
    begin
        IF SalesLineLineDiscExists(SalesHeader, SalesLine, ShowAll) THEN
            EXIT(TempSalesLineDisc.COUNT);
    end;

    procedure NoOfServLinePrice(ServHeader: Record 5900; var ServLine: Record 5902; ShowAll: Boolean): Integer;
    begin
        IF ServLinePriceExists(ServHeader, ServLine, ShowAll) THEN
            EXIT(TempSalesPrice.COUNT);
    end;

    procedure NoOfServLineLineDisc(ServHeader: Record 5900; var ServLine: Record 5902; ShowAll: Boolean): Integer;
    begin
        IF ServLineLineDiscExists(ServHeader, ServLine, ShowAll) THEN
            EXIT(TempSalesLineDisc.COUNT);
    end;

    procedure FindJobPlanningLinePrice(var JobPlanningLine: Record 1003; CalledByFieldNo: Integer);
    var
        Job: Record 167;
    begin
        WITH JobPlanningLine DO BEGIN
            SetCurrency("Currency Code", "Currency Factor", "Planning Date");
            SetVAT(FALSE, 0, 0, '');
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

            CASE Type OF
                Type::Item:
                    BEGIN
                        Job.GET("Job No.");
                        Item.GET("No.");
                        TESTFIELD("Qty. per Unit of Measure");
                        FindSalesPrice(
                          TempSalesPrice, Job."Bill-to Customer No.", Job."Bill-to Contact No.",
                          Job."Customer Price Group", '', "No.", "Variant Code", "Unit of Measure Code",
                          Job."Currency Code", "Planning Date", FALSE);
                        CalcBestUnitPrice(TempSalesPrice);
                        IF FoundSalesPrice OR
                           NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                                (CalledByFieldNo = FIELDNO("Variant Code")))
                        THEN
                            "Unit Price" := TempSalesPrice."Unit Price";
                    END;
                Type::Resource:
                    BEGIN
                        Job.GET("Job No.");
                        SetResPrice("No.", "Work Type Code", "Currency Code");
                        ResFindUnitPrice.RUN(ResPrice);
                        ConvertPriceLCYToFCY(ResPrice."Currency Code", ResPrice."Unit Price");
                        "Unit Price" := ResPrice."Unit Price" * "Qty. per Unit of Measure";
                    END;
            END;
        END;
        JobPlanningLineFindJTPrice(JobPlanningLine);
    end;

    procedure JobPlanningLineFindJTPrice(var JobPlanningLine: Record 1003);
    var
        JobItemPrice: Record 1013;
        JobResPrice: Record 1012;
        JobGLAccPrice: Record 1014;
    begin
        WITH JobPlanningLine DO
            CASE Type OF
                Type::Item:
                    BEGIN
                        JobItemPrice.SETRANGE("Job No.", "Job No.");
                        JobItemPrice.SETRANGE("Item No.", "No.");
                        JobItemPrice.SETRANGE("Variant Code", "Variant Code");
                        JobItemPrice.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
                        JobItemPrice.SETRANGE("Currency Code", "Currency Code");
                        JobItemPrice.SETRANGE("Job Task No.", "Job Task No.");
                        IF JobItemPrice.FINDFIRST THEN
                            CopyJobItemPriceToJobPlanLine(JobPlanningLine, JobItemPrice)
                        ELSE BEGIN
                            JobItemPrice.SETRANGE("Job Task No.", ' ');
                            IF JobItemPrice.FINDFIRST THEN
                                CopyJobItemPriceToJobPlanLine(JobPlanningLine, JobItemPrice);
                        END;

                        IF JobItemPrice.ISEMPTY OR (NOT JobItemPrice."Apply Job Discount") THEN
                            FindJobPlanningLineLineDisc(JobPlanningLine);
                    END;
                Type::Resource:
                    BEGIN
                        Res.GET("No.");
                        JobResPrice.SETRANGE("Job No.", "Job No.");
                        JobResPrice.SETRANGE("Currency Code", "Currency Code");
                        JobResPrice.SETRANGE("Job Task No.", "Job Task No.");
                        CASE TRUE OF
                            JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::Resource):
                                CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                            JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::"Group(Resource)"):
                                CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                            JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::All):
                                CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                        ELSE BEGIN
                            JobResPrice.SETRANGE("Job Task No.", '');
                            CASE TRUE OF
                                JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::Resource):
                                    CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                                JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::"Group(Resource)"):
                                    CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                                JobPlanningLineFindJobResPrice(JobPlanningLine, JobResPrice, JobResPrice.Type::All):
                                    CopyJobResPriceToJobPlanLine(JobPlanningLine, JobResPrice);
                            END;
                        END;
                        END;
                    END;
                Type::"G/L Account":
                    BEGIN
                        JobGLAccPrice.SETRANGE("Job No.", "Job No.");
                        JobGLAccPrice.SETRANGE("G/L Account No.", "No.");
                        JobGLAccPrice.SETRANGE("Currency Code", "Currency Code");
                        JobGLAccPrice.SETRANGE("Job Task No.", "Job Task No.");
                        IF JobGLAccPrice.FINDFIRST THEN
                            CopyJobGLAccPriceToJobPlanLine(JobPlanningLine, JobGLAccPrice)
                        ELSE BEGIN
                            JobGLAccPrice.SETRANGE("Job Task No.", '');
                            IF JobGLAccPrice.FINDFIRST THEN;
                            CopyJobGLAccPriceToJobPlanLine(JobPlanningLine, JobGLAccPrice);
                        END;
                    END;
            END;
    end;

    procedure CopyJobItemPriceToJobPlanLine(var JobPlanningLine: Record 1003; JobItemPrice: Record 1013);
    begin
        WITH JobPlanningLine DO BEGIN
            IF JobItemPrice."Apply Job Price" THEN BEGIN
                "Unit Price" := JobItemPrice."Unit Price";
                "Cost Factor" := JobItemPrice."Unit Cost Factor";
            END;
            IF JobItemPrice."Apply Job Discount" THEN
                "Line Discount %" := JobItemPrice."Line Discount %";
        END;
    end;

    procedure CopyJobResPriceToJobPlanLine(var JobPlanningLine: Record 1003; JobResPrice: Record 1012);
    begin
        WITH JobPlanningLine DO BEGIN
            IF JobResPrice."Apply Job Price" THEN BEGIN
                "Unit Price" := JobResPrice."Unit Price" * "Qty. per Unit of Measure";
                "Cost Factor" := JobResPrice."Unit Cost Factor";
            END;
            IF JobResPrice."Apply Job Discount" THEN
                "Line Discount %" := JobResPrice."Line Discount %";
        END;
    end;

    procedure JobPlanningLineFindJobResPrice(var JobPlanningLine: Record 1003; var JobResPrice: Record 1012; PriceType: Option Resource,"Group(Resource)",All): Boolean;
    begin
        CASE PriceType OF
            PriceType::Resource:
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::Resource);
                    JobResPrice.SETRANGE("Work Type Code", JobPlanningLine."Work Type Code");
                    JobResPrice.SETRANGE(Code, JobPlanningLine."No.");
                    EXIT(JobResPrice.FIND('-'));
                END;
            PriceType::"Group(Resource)":
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::"Group(Resource)");
                    JobResPrice.SETRANGE(Code, Res."Resource Group No.");
                    EXIT(FindJobResPrice(JobResPrice, JobPlanningLine."Work Type Code"));
                END;
            PriceType::All:
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::All);
                    JobResPrice.SETRANGE(Code);
                    EXIT(FindJobResPrice(JobResPrice, JobPlanningLine."Work Type Code"));
                END;
        END;
    end;

    procedure CopyJobGLAccPriceToJobPlanLine(var JobPlanningLine: Record 1003; JobGLAccPrice: Record 1014);
    begin
        WITH JobPlanningLine DO BEGIN
            "Unit Cost" := JobGLAccPrice."Unit Cost";
            "Unit Price" := JobGLAccPrice."Unit Price" * "Qty. per Unit of Measure";
            "Cost Factor" := JobGLAccPrice."Unit Cost Factor";
            "Line Discount %" := JobGLAccPrice."Line Discount %";
        END;
    end;

    procedure FindJobJnlLinePrice(var JobJnlLine: Record 210; CalledByFieldNo: Integer);
    var
        Job: Record 167;
    begin
        WITH JobJnlLine DO BEGIN
            SetCurrency("Currency Code", "Currency Factor", "Posting Date");
            SetVAT(FALSE, 0, 0, '');
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");

            CASE Type OF
                Type::Item:
                    BEGIN
                        Item.GET("No.");
                        TESTFIELD("Qty. per Unit of Measure");
                        Job.GET("Job No.");

                        FindSalesPrice(
                          TempSalesPrice, Job."Bill-to Customer No.", Job."Bill-to Contact No.",
                          "Customer Price Group", '', "No.", "Variant Code", "Unit of Measure Code",
                          "Currency Code", "Posting Date", FALSE);
                        CalcBestUnitPrice(TempSalesPrice);
                        IF FoundSalesPrice OR
                           NOT ((CalledByFieldNo = FIELDNO(Quantity)) OR
                                (CalledByFieldNo = FIELDNO("Variant Code")))
                        THEN
                            "Unit Price" := TempSalesPrice."Unit Price";
                    END;
                Type::Resource:
                    BEGIN
                        Job.GET("Job No.");
                        SetResPrice("No.", "Work Type Code", "Currency Code");
                        ResFindUnitPrice.RUN(ResPrice);
                        ConvertPriceLCYToFCY(ResPrice."Currency Code", ResPrice."Unit Price");
                        "Unit Price" := ResPrice."Unit Price" * "Qty. per Unit of Measure";
                    END;
            END;
        END;
        JobJnlLineFindJTPrice(JobJnlLine);
    end;

    procedure JobJnlLineFindJobResPrice(var JobJnlLine: Record 210; var JobResPrice: Record 1012; PriceType: Option Resource,"Group(Resource)",All): Boolean;
    begin
        CASE PriceType OF
            PriceType::Resource:
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::Resource);
                    JobResPrice.SETRANGE("Work Type Code", JobJnlLine."Work Type Code");
                    JobResPrice.SETRANGE(Code, JobJnlLine."No.");
                    EXIT(JobResPrice.FIND('-'));
                END;
            PriceType::"Group(Resource)":
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::"Group(Resource)");
                    JobResPrice.SETRANGE(Code, Res."Resource Group No.");
                    EXIT(FindJobResPrice(JobResPrice, JobJnlLine."Work Type Code"));
                END;
            PriceType::All:
                BEGIN
                    JobResPrice.SETRANGE(Type, JobResPrice.Type::All);
                    JobResPrice.SETRANGE(Code);
                    EXIT(FindJobResPrice(JobResPrice, JobJnlLine."Work Type Code"));
                END;
        END;
    end;

    procedure CopyJobResPriceToJobJnlLine(var JobJnlLine: Record 210; JobResPrice: Record 1012);
    begin
        WITH JobJnlLine DO BEGIN
            IF JobResPrice."Apply Job Price" THEN BEGIN
                "Unit Price" := JobResPrice."Unit Price" * "Qty. per Unit of Measure";
                "Cost Factor" := JobResPrice."Unit Cost Factor";
            END;
            IF JobResPrice."Apply Job Discount" THEN
                "Line Discount %" := JobResPrice."Line Discount %";
        END;
    end;

    procedure CopyJobGLAccPriceToJobJnlLine(var JobJnlLine: Record 210; JobGLAccPrice: Record 1014);
    begin
        WITH JobJnlLine DO BEGIN
            "Unit Cost" := JobGLAccPrice."Unit Cost";
            "Unit Price" := JobGLAccPrice."Unit Price" * "Qty. per Unit of Measure";
            "Cost Factor" := JobGLAccPrice."Unit Cost Factor";
            "Line Discount %" := JobGLAccPrice."Line Discount %";
        END;
    end;

    procedure JobJnlLineFindJTPrice(var JobJnlLine: Record 210);
    var
        JobItemPrice: Record 1013;
        JobResPrice: Record 1012;
        JobGLAccPrice: Record 1014;
    begin
        WITH JobJnlLine DO
            CASE Type OF
                Type::Item:
                    BEGIN
                        JobItemPrice.SETRANGE("Job No.", "Job No.");
                        JobItemPrice.SETRANGE("Item No.", "No.");
                        JobItemPrice.SETRANGE("Variant Code", "Variant Code");
                        JobItemPrice.SETRANGE("Unit of Measure Code", "Unit of Measure Code");
                        JobItemPrice.SETRANGE("Currency Code", "Currency Code");
                        JobItemPrice.SETRANGE("Job Task No.", "Job Task No.");
                        IF JobItemPrice.FINDFIRST THEN
                            CopyJobItemPriceToJobJnlLine(JobJnlLine, JobItemPrice)
                        ELSE BEGIN
                            JobItemPrice.SETRANGE("Job Task No.", ' ');
                            IF JobItemPrice.FINDFIRST THEN
                                CopyJobItemPriceToJobJnlLine(JobJnlLine, JobItemPrice);
                        END;

                        IF JobItemPrice.ISEMPTY OR (NOT JobItemPrice."Apply Job Discount") THEN
                            FindJobJnlLineLineDisc(JobJnlLine);
                    END;
                Type::Resource:
                    BEGIN
                        Res.GET("No.");
                        JobResPrice.SETRANGE("Job No.", "Job No.");
                        JobResPrice.SETRANGE("Currency Code", "Currency Code");
                        JobResPrice.SETRANGE("Job Task No.", "Job Task No.");
                        CASE TRUE OF
                            JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::Resource):
                                CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                            JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::"Group(Resource)"):
                                CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                            JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::All):
                                CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                        ELSE BEGIN
                            JobResPrice.SETRANGE("Job Task No.", '');
                            CASE TRUE OF
                                JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::Resource):
                                    CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                                JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::"Group(Resource)"):
                                    CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                                JobJnlLineFindJobResPrice(JobJnlLine, JobResPrice, JobResPrice.Type::All):
                                    CopyJobResPriceToJobJnlLine(JobJnlLine, JobResPrice);
                            END;
                        END;
                        END;
                    END;
                Type::"G/L Account":
                    BEGIN
                        JobGLAccPrice.SETRANGE("Job No.", "Job No.");
                        JobGLAccPrice.SETRANGE("G/L Account No.", "No.");
                        JobGLAccPrice.SETRANGE("Currency Code", "Currency Code");
                        JobGLAccPrice.SETRANGE("Job Task No.", "Job Task No.");
                        IF JobGLAccPrice.FINDFIRST THEN
                            CopyJobGLAccPriceToJobJnlLine(JobJnlLine, JobGLAccPrice)
                        ELSE BEGIN
                            JobGLAccPrice.SETRANGE("Job Task No.", '');
                            IF JobGLAccPrice.FINDFIRST THEN;
                            CopyJobGLAccPriceToJobJnlLine(JobJnlLine, JobGLAccPrice);
                        END;
                    END;
            END;
    end;

    procedure CopyJobItemPriceToJobJnlLine(var JobJnlLine: Record 210; JobItemPrice: Record 1013);
    begin
        WITH JobJnlLine DO BEGIN
            IF JobItemPrice."Apply Job Price" THEN BEGIN
                "Unit Price" := JobItemPrice."Unit Price";
                "Cost Factor" := JobItemPrice."Unit Cost Factor";
            END;
            IF JobItemPrice."Apply Job Discount" THEN
                "Line Discount %" := JobItemPrice."Line Discount %";
        END;
    end;

    procedure FindJobPlanningLineLineDisc(var JobPlanningLine: Record 1003);
    begin
        WITH JobPlanningLine DO BEGIN
            SetCurrency("Currency Code", "Currency Factor", "Planning Date");
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
            TESTFIELD("Qty. per Unit of Measure");
            IF Type = Type::Item THEN BEGIN
                JobPlanningLineLineDiscExists(JobPlanningLine, FALSE);
                CalcBestLineDisc(TempSalesLineDisc);
                IF TempSalesLineDisc."Line Discount %" <> 0 THEN
                    "Line Discount %" := TempSalesLineDisc."Line Discount %";
            END;
        END;
    end;

    procedure JobPlanningLineLineDiscExists(var JobPlanningLine: Record 1003; ShowAll: Boolean): Boolean;
    var
        Job: Record 167;
    begin
        WITH JobPlanningLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                Job.GET("Job No.");
                FindSalesLineDisc(
                TempSalesLineDisc, Job."Bill-to Customer No.", Job."Bill-to Contact No.",
                Job."Customer Disc. Group", '', "No.", Item."Item Disc. Group", "Variant Code", "Unit of Measure Code",
                "Currency Code", JobPlanningLineStartDate(JobPlanningLine, DateCaption), ShowAll);
                EXIT(TempSalesLineDisc.FIND('-'));
            END;
        EXIT(FALSE);
    end;

    local procedure JobPlanningLineStartDate(JobPlanningLine: Record 1003; var DateCaption: Text[30]): Date;
    begin
        DateCaption := JobPlanningLine.FIELDCAPTION("Planning Date");
        EXIT(JobPlanningLine."Planning Date");
    end;

    procedure FindJobJnlLineLineDisc(var JobJnlLine: Record 210);
    begin
        WITH JobJnlLine DO BEGIN
            SetCurrency("Currency Code", "Currency Factor", "Posting Date");
            SetUoM(ABS(Quantity), "Qty. per Unit of Measure");
            TESTFIELD("Qty. per Unit of Measure");
            IF Type = Type::Item THEN BEGIN
                JobJnlLineLineDiscExists(JobJnlLine, FALSE);
                CalcBestLineDisc(TempSalesLineDisc);
                IF TempSalesLineDisc."Line Discount %" <> 0 THEN
                    "Line Discount %" := TempSalesLineDisc."Line Discount %";
            END;
        END;
    end;

    procedure JobJnlLineLineDiscExists(var JobJnlLine: Record 210; ShowAll: Boolean): Boolean;
    var
        Job: Record 167;
    begin
        WITH JobJnlLine DO
            IF (Type = Type::Item) AND Item.GET("No.") THEN BEGIN
                Job.GET("Job No.");
                FindSalesLineDisc(
                TempSalesLineDisc, Job."Bill-to Customer No.", Job."Bill-to Contact No.",
                Job."Customer Disc. Group", '', "No.", Item."Item Disc. Group", "Variant Code", "Unit of Measure Code",
                "Currency Code", JobJnlLineStartDate(JobJnlLine, DateCaption), ShowAll);
                EXIT(TempSalesLineDisc.FIND('-'));
            END;
        EXIT(FALSE);
    end;

    local procedure JobJnlLineStartDate(JobJnlLine: Record 210; var DateCaption: Text[30]): Date;
    begin
        DateCaption := JobJnlLine.FIELDCAPTION("Posting Date");
        EXIT(JobJnlLine."Posting Date");
    end;

    local procedure FindJobResPrice(var JobResPrice: Record 1012; WorkTypeCode: Code[10]): Boolean;
    begin
        JobResPrice.SETRANGE("Work Type Code", WorkTypeCode);
        IF JobResPrice.FINDFIRST THEN
            EXIT(TRUE);
        JobResPrice.SETRANGE("Work Type Code", '');
        EXIT(JobResPrice.FINDFIRST);
    end;

    procedure "-------WebShop-----------"();
    begin
    end;

    procedure FindWebSalesPrice(ItemNo: Code[20]; VariantCode: Code[20]; CustomerNo: Code[20]; Quantity: Decimal; UOM: Code[20]): Decimal;
    var
        Customer: Record 18;
        ItemUOM: Record 5404;
    begin
        SetCurrency('', 0, 0D);
        SetVAT(FALSE, 0, 0, '');
        //SetUoM(0,1);

        IF CustomerNo = '' THEN BEGIN
            IF Item.GET(ItemNo) THEN;
            IF ItemUOM.GET(ItemNo, UOM) THEN
                SetUoM(Quantity, ItemUOM."Qty. per Unit of Measure")
            ELSE
                SetUoM(0, 1);
            FindSalesPrice(TempSalesPrice, '', '', '', '', ItemNo, VariantCode, UOM, '', TODAY, FALSE);
            CalcBestUnitPrice(TempSalesPrice);
            IF FoundSalesPrice THEN
                EXIT(TempSalesPrice."Unit Price");
            EXIT(Item."Unit Price");
        END ELSE BEGIN
            IF Item.GET(ItemNo) THEN;
            IF ItemUOM.GET(ItemNo, UOM) THEN
                SetUoM(Quantity, ItemUOM."Qty. per Unit of Measure")
            ELSE
                SetUoM(0, 1);

            IF Customer.GET(CustomerNo) THEN;
            FindSalesPrice(TempSalesPrice, Customer."No.",
    '', Customer."Customer Price Group", '', ItemNo, VariantCode, UOM, '', TODAY, FALSE);
            CalcBestUnitPrice(TempSalesPrice);
            IF FoundSalesPrice THEN
                EXIT(TempSalesPrice."Unit Price");
            EXIT(Item."Unit Price");
        END;
    end;

    procedure FindWebSalesDiscount(ItemNo: Code[20]; VariantCode: Code[20]; CustomerNo: Code[20]; Quantity: Decimal; UOM: Code[20]): Decimal;
    var
        Customer: Record 18;
    begin
        IF CustomerNo = '' THEN BEGIN
            IF Item.GET(ItemNo) THEN;
            FindSalesLineDisc(
              TempSalesLineDisc, '', '',
    '', '', ItemNo, Item."Item Disc. Group", VariantCode,
              UOM, '', TODAY, FALSE);
            CalcBestLineDisc(TempSalesLineDisc);
            EXIT(TempSalesLineDisc."Line Discount %");
        END ELSE BEGIN
            IF Item.GET(ItemNo) AND Customer.GET(CustomerNo) THEN BEGIN
                FindSalesLineDisc(
                TempSalesLineDisc, Customer."Bill-to Customer No.", '',
                Customer."Customer Disc. Group", '', Item."No.", Item."Item Disc. Group", VariantCode,
                UOM, '', TODAY, FALSE);
                CalcBestLineDisc(TempSalesLineDisc);
                EXIT(TempSalesLineDisc."Line Discount %");
            END;
        END;
    end;
}

codeunit 70009707 "eShop Data Upgrade Mgmt"
{
    // version ES1.00
    Subtype =Upgrade;

    trigger OnRun();
    begin

    end;

    trigger OnUpgradePerDatabase();
    begin
    end;

    trigger OnUpgradePerCompany();
    begin
        RestoreFieldsInModifiedTables(70009700,70009800);
        RestoreAppTables(70009700,70009800);
    end;

    local procedure RestoreFieldsInModifiedTables(FromField: Integer; ToField: Integer);
    var
        "Field": Record 2000000041;
        AllObj: Record 2000000038;
        ObjectIDlbl : Text; 
    begin
        WITH AllObj DO BEGIN
            ObjectIDlbl := '10|18|27|36|37|44|90|112|113|289|291|901|5401|5404';
            SETRANGE("Object Type", "Object Type"::Table);
            SetFilter("Object ID",ObjectIDlbl);
            IF FINDSET THEN

                REPEAT
                    Field.SETRANGE(TableNo, "Object ID");
                    Field.SETRANGE("No.", FromField, ToField);
                    IF NOT Field.ISEMPTY THEN BEGIN
                        NAVAPP.RESTOREARCHIVEDATA("Object ID");
                    END;
                UNTIL NEXT < 1;
        END;
    end;

    local procedure RestoreAppTables(FromTableID: Integer; ToTableID: Integer);
    var
        AllObj: Record 2000000038;
    begin
        WITH AllObj DO BEGIN
            SETRANGE("Object Type", "Object Type"::Table);
            SETRANGE("Object ID", FromTableID, ToTableID);

            IF FINDSET THEN
                REPEAT
                    NAVAPP.RESTOREARCHIVEDATA("Object ID");
                UNTIL NEXT < 1;
        END;
    end;
}

codeunit 70009708 "eShop Notification Mgmt."
{
    var
        GetStarterTxt: Label 'Thank you for downloading eShop for Business Central. Register with us to start your free trial.';
        GuidTxt: Label '9E0237A2-13DD-4730-8E0C-527616B826E0';
        NoThanksTxt: Label 'No, thanks';
        RunStartupWizardTxt: Label 'eShop Account Registration';
        StartupWizardNotificationTxt: Label 'eShop Account Registration wizard notification.';

        eShopSetupTxt: Label 'eShop Setup';

    local procedure StartupWizardNotificationCode(): Code[50];
    begin
        exit('eShop Account Registration wizard notification.');
        exit(UPPERCASE('eShopAccountRegistrationwizardNotification'))
    end;

    local procedure GetExtensionNotificationId(): Guid;
    var
        StartupWizardNotificationId: Guid;
    begin
        EVALUATE(StartupWizardNotificationId, GuidTxt);
        exit(StartupWizardNotificationId);
    end;

    local procedure IseShopNotificationsInitialised(): Boolean;
    var
        MyNotifications: Record 1518;
    begin
        if MyNotifications.Get(UserId, GetExtensionNotificationId) then
            exit(true);
    end;

    procedure IniteShopNotifications();
    var
        MyNotifications: Record 1518;
        InstructionMgt: Codeunit 1330;
    begin
        if IseShopNotificationsInitialised then
            exit;

        MyNotifications.InsertDefault(
            GetExtensionNotificationId,
            StartupWizardNotificationTxt,
            GetStarterTxt,
            InstructionMgt.IsEnabled(StartupWizardNotificationCode));
    end;

    procedure ShowStartupWizardNotification();
    var
        InstructionMgt: Codeunit 1330;
    begin
        if not AreNotificationsSupported then
            exit;

        if not InstructionMgt.IsEnabled(StartupWizardNotificationCode) then
            exit;

        if IseShopSetupExists then
            exit;

        CreateAndSendStartupWizardNotification;
    end;

    local procedure CreateAndSendStartupWizardNotification();
    var
        StartupWizardNotification: Notification;
    begin
        StartupWizardNotification.ID(GetExtensionNotificationId);
        StartupWizardNotification.Message(GetStarterTxt);
        StartupWizardNotification.SCOPE(NOTIFICATIONSCOPE::LocalScope);
        StartupWizardNotification.ADDACTION(RunStartupWizardTxt, Codeunit::"eShop Notification Mgmt.", 'StartupWizardNotificationAction');
        StartupWizardNotification.ADDACTION(eShopSetupTxt, Codeunit::"eShop Notification Mgmt.", 'RuneShopSetup');
        StartupWizardNotification.ADDACTION(NoThanksTxt, Codeunit::"eShop Notification Mgmt.", 'DisableStartupWizardNotificationAction');
        StartupWizardNotification.SEND;
    end;

    local procedure AreNotificationsSupported(): Boolean;
    begin
        if GUIALLOWED then
            exit(true);
    end;

    local procedure IseShopSetupExists(): Boolean;
    var
        EshopSetup: Record "eShop Setup";
    begin
        IF EshopSetup.get() then;
        exit(EshopSetup."eShop URL" <> '');
    end;

    procedure StartupWizardNotificationAction(StartupWizardNotification: Notification);
    begin
        Page.RunModal(Page::"eShop Wizard");
    end;

    procedure RuneShopSetup(StartupWizardNotification: Notification);
    begin
        Page.RunModal(Page::"eShop Setup Card");
    end;

    procedure DisableStartupWizardNotificationAction(StartupWizardNotification: Notification);
    var
        MyNotifications: Record 1518;
        InstructionMgt: Codeunit 1330;
    begin
        if MyNotifications.Get(UserId, GetExtensionNotificationId) then begin
            MyNotifications.Enabled := false;
            MyNotifications.Modify(true);
            InstructionMgt.DisableMessageForCurrentUser(StartupWizardNotificationCode);
        end;
    end;

    [EventSubscriber(ObjectType::Table, 1518, 'OnStateChanged', '', false, false)]
    local procedure OnStateChangedTable1518(NotificationId: Guid; NewEnabledState: Boolean);
    var
        InstructionMgt: Codeunit 1330;
    begin
        IniteShopNotifications;
        case NotificationId of
            GetExtensionNotificationId:
                if NewEnabledState then
                    InstructionMgt.EnableMessageForCurrentUser(StartupWizardNotificationCode)
                else
                    InstructionMgt.DisableMessageForCurrentUser(StartupWizardNotificationCode);
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"O365 Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent1310(var Rec: Record 1313);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Accountant Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9037(var Rec: Record 9054);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"O365 Sales Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9039(var Rec: Record 9069);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Team Member Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9042(var Rec: Record 9042);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"SO Processor Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9060(var Rec: Record 9053);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"User Security Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9062(var Rec: Record 9062);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"IT Operations Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent9072(var Rec: Record 9059);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Performance", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent770(var Rec: Record 485);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Cash Flow Forecast Chart", 'OnOpenPageEvent', '', false, false)]
    local procedure OnOpenPageEvent869(var Rec: Record 485);
    begin
        IniteShopNotifications;
        ShowStartupWizardNotification;
    end;
}








