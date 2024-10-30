alter table InvoiceDetails rename column UnitPrice to LineTotal;

alter table PurchaseOrderDetails rename column UnitPrice to LineToTal;

alter table PriceHistories rename column Price to SellingPrice;

alter table PriceHistories add PurchasePrice number not null;