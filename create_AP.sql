USE master
GO

/****** Object:  Database AP     ******/
IF DB_ID('AP') IS NOT NULL
	DROP DATABASE AP
GO

CREATE DATABASE AP
GO 

USE [AP]
GO

/****** Object:  Table [dbo].[ContactUpdates]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUpdates](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GLAccounts]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GLAccounts](
	[AccountNo] [int] NOT NULL,
	[AccountDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GLAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InvoiceArchive]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceArchive](
	[InvoiceID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [date] NOT NULL,
	[PaymentDate] [date] NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InvoiceLineItems]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLineItems](
	[InvoiceID] [int] NOT NULL,
	[InvoiceSequence] [smallint] NOT NULL,
	[AccountNo] [int] NOT NULL,
	[InvoiceLineItemAmount] [money] NOT NULL,
	[InvoiceLineItemDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_InvoiceLineItems] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[InvoiceSequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Invoices]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [date] NOT NULL,
	[PaymentDate] [date] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Terms]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[TermsID] [int] IDENTITY(1,1) NOT NULL,
	[TermsDescription] [varchar](50) NOT NULL,
	[TermsDueDays] [smallint] NOT NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[TermsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Vendors]    Script Date: 2/14/2020 12:45:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](50) NOT NULL,
	[VendorAddress1] [varchar](50) NULL,
	[VendorAddress2] [varchar](50) NULL,
	[VendorCity] [varchar](50) NOT NULL,
	[VendorState] [char](2) NOT NULL,
	[VendorZipCode] [varchar](20) NOT NULL,
	[VendorPhone] [varchar](50) NULL,
	[VendorContactLName] [varchar](50) NULL,
	[VendorContactFName] [varchar](50) NULL,
	[DefaultTermsID] [int] NOT NULL,
	[DefaultAccountNo] [int] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactUpdates] ON 

INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (5, N'Davison', N'Michelle')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (12, N'Mayteh', N'Kendall')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (17, N'Onandonga', N'Bruce')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (44, N'Antavius', N'Anthony')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (76, N'Bradlee', N'Danny')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (94, N'Suscipe', N'Reynaldo')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (101, N'O''Sullivan', N'Geraldine')
INSERT [dbo].[ContactUpdates] ([VendorID], [LastName], [FirstName]) VALUES (123, N'Bucket', N'Charles')
SET IDENTITY_INSERT [dbo].[ContactUpdates] OFF
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (100, N'Cash')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (110, N'Accounts Receivable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (120, N'Book Inventory')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (150, N'Furniture')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (160, N'Computer Equipment')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (162, N'Capitalized Lease')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (167, N'Software')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (170, N'Other Equipment')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (181, N'Book Development')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (200, N'Accounts Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (205, N'Royalties Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (221, N'401K Employee Contributions')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (230, N'Sales Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (234, N'Medicare Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (235, N'Income Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (237, N'State Payroll Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (238, N'Employee FICA Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (239, N'Employer FICA Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (241, N'Employer FUTA Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (242, N'Employee SDI Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (243, N'Employer UCI Taxes Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (251, N'IBM Credit Corporation Payable')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (280, N'Capital Stock')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (290, N'Retained Earnings')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (300, N'Retail Sales')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (301, N'College Sales')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (302, N'Trade Sales')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (306, N'Consignment Sales')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (310, N'Compositing Revenue')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (394, N'Book Club Royalties')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (400, N'Book Printing Costs')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (403, N'Book Production Costs')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (500, N'Salaries and Wages')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (505, N'FICA')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (506, N'FUTA')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (507, N'UCI')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (508, N'Medicare')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (510, N'Group Insurance')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (520, N'Building Lease')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (521, N'Utilities')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (522, N'Telephone')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (523, N'Building Maintenance')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (527, N'Computer Equipment Maintenance')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (528, N'IBM Lease')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (532, N'Equipment Rental')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (536, N'Card Deck Advertising')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (540, N'Direct Mail Advertising')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (541, N'Space Advertising')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (546, N'Exhibits and Shows')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (548, N'Web Site Production and Fees')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (550, N'Packaging Materials')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (551, N'Business Forms')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (552, N'Postage')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (553, N'Freight')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (555, N'Collection Agency Fees')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (556, N'Credit Card Handling')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (565, N'Bank Fees')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (568, N'Auto License Fee')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (569, N'Auto Expense')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (570, N'Office Supplies')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (572, N'Books, Dues, and Subscriptions')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (574, N'Business Licenses and Taxes')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (576, N'PC Software')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (580, N'Meals')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (582, N'Travel and Accomodations')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (589, N'Outside Services')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (590, N'Business Insurance')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (591, N'Accounting')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (610, N'Charitable Contributions')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (611, N'Profit Sharing Contributions')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (620, N'Interest Paid to Banks')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (621, N'Other Interest')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (630, N'Federal Corporation Income Taxes')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (631, N'State Corporation Income Taxes')
INSERT [dbo].[GLAccounts] ([AccountNo], [AccountDescription]) VALUES (632, N'Sales Tax')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (1, 1, 553, 3813.3300, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (2, 1, 553, 40.2000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (3, 1, 553, 138.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (4, 1, 553, 144.7000, N'Int''l shipment')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (5, 1, 553, 15.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (6, 1, 553, 42.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (7, 1, 553, 172.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (8, 1, 522, 95.0000, N'Telephone service')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (9, 1, 403, 601.9500, N'Cover design')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (10, 1, 553, 42.6700, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (11, 1, 553, 42.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (12, 1, 580, 50.0000, N'DiCicco''s')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (12, 2, 570, 75.6000, N'Kinko''s')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (12, 3, 570, 58.4000, N'Office Max')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (12, 4, 540, 478.0000, N'Publishers Marketing')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (13, 1, 522, 16.3300, N'Telephone (line 5)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (14, 1, 553, 6.0000, N'Freight out')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (15, 1, 574, 856.9200, N'Property Taxes')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (16, 1, 572, 9.9500, N'Monthly access fee')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (17, 1, 553, 10.0000, N'Address correction')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (18, 1, 553, 104.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (19, 1, 160, 116.5400, N'MVS Online Library')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (20, 1, 553, 6.0000, N'Freight out')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (21, 1, 589, 4901.2600, N'Office lease')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (22, 1, 553, 108.2500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (23, 1, 572, 9.9500, N'Monthly access fee')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (24, 1, 520, 1750.0000, N'Warehouse lease')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (25, 1, 553, 129.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (26, 1, 553, 10.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (27, 1, 540, 207.7800, N'Prospect list')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (28, 1, 553, 109.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (29, 1, 523, 450.0000, N'Back office additions')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (30, 1, 553, 63.4000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (31, 1, 589, 7125.3400, N'Web site design')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (32, 1, 403, 953.1000, N'Crash Course revision')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (33, 1, 591, 220.0000, N'Form 571-L')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (34, 1, 553, 127.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (35, 1, 507, 1600.0000, N'Income Tax')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (36, 1, 403, 565.1500, N'Crash Course Ad')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (37, 1, 553, 36.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (38, 1, 553, 61.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (39, 1, 400, 37966.1900, N'CICS Desk Reference')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (40, 1, 403, 639.7700, N'Card deck')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (41, 1, 553, 53.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (42, 1, 553, 400.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (43, 1, 400, 21842.0000, N'Book repro')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (44, 1, 522, 19.6700, N'Telephone (Line 3)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (45, 1, 553, 2765.3600, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (46, 1, 510, 224.0000, N'Health Insurance')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (47, 1, 572, 1575.0000, N'Catalog ad')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (48, 1, 553, 33.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (49, 1, 522, 16.3300, N'Telephone (line 6)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (50, 1, 510, 116.0000, N'Health Insurance')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (51, 1, 553, 2184.1100, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (52, 1, 160, 1083.5800, N'MSDN')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (53, 1, 522, 46.2100, N'Telephone (Line 1)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (54, 1, 403, 313.5500, N'Card revision')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (55, 1, 553, 40.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (56, 1, 572, 2433.0000, N'Card deck')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (57, 1, 589, 1367.5000, N'401K Contributions')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (58, 1, 553, 53.2500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (59, 1, 553, 13.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (60, 1, 553, 2312.2000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (61, 1, 553, 25.6700, N'Freight out')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (62, 1, 553, 26.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (63, 1, 553, 2115.8100, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (64, 1, 553, 23.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (65, 1, 400, 6940.2500, N'OS Utilities')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (66, 1, 553, 31.9500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (67, 1, 553, 1927.5400, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (68, 1, 160, 936.9300, N'Quarterly Maintenance')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (69, 1, 540, 175.0000, N'Card deck advertising')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (70, 1, 553, 6.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (71, 1, 553, 108.5000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (72, 1, 553, 10.0000, N'Address correction')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (73, 1, 552, 290.0000, N'International pkg.')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (74, 1, 570, 41.8000, N'Coffee')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (75, 1, 553, 27.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (76, 1, 553, 241.0000, N'Int''l shipment')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (77, 1, 403, 904.1400, N'Cover design')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (78, 1, 403, 1197.0000, N'Cover design')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (78, 2, 540, 765.1300, N'Catalog design')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (79, 1, 540, 2184.5000, N'PC card deck')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (80, 1, 553, 2318.0300, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (81, 1, 553, 26.2500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (82, 1, 150, 17.5000, N'Supplies')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (83, 1, 522, 39.7700, N'Telephone (Line 2)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (84, 1, 553, 111.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (85, 1, 553, 158.0000, N'Int''l shipment')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (86, 1, 553, 739.2000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (87, 1, 553, 60.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (88, 1, 553, 147.2500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (89, 1, 400, 85.3100, N'Book copy')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (90, 1, 553, 38.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (91, 1, 522, 32.7000, N'Telephone (line 4)')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (92, 1, 521, 16.6200, N'Propane-forklift')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (93, 1, 553, 162.7500, N'International shipment')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (94, 1, 553, 52.2500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (95, 1, 572, 600.0000, N'Books for research')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (96, 1, 400, 26881.4000, N'MVS JCL')
GO
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (97, 1, 170, 356.4800, N'Network wiring')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (98, 1, 572, 579.4200, N'Catalog ad')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (99, 1, 553, 59.9700, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (100, 1, 553, 67.9200, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (101, 1, 553, 30.7500, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (102, 1, 400, 20551.1800, N'CICS book printing')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (103, 1, 553, 2051.5900, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (104, 1, 553, 44.4400, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (105, 1, 582, 503.2000, N'Bronco lease')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (106, 1, 400, 23517.5800, N'DB2 book printing')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (107, 1, 553, 3689.9900, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (108, 1, 553, 67.0000, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (109, 1, 403, 1000.4600, N'Crash Course covers')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (110, 1, 540, 90.3600, N'Card deck advertising')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (111, 1, 553, 22.5700, N'Freight')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (112, 1, 400, 10976.0600, N'VSAM book printing')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (113, 1, 510, 224.0000, N'Health Insurance')
INSERT [dbo].[InvoiceLineItems] ([InvoiceID], [InvoiceSequence], [AccountNo], [InvoiceLineItemAmount], [InvoiceLineItemDescription]) VALUES (114, 1, 553, 127.7500, N'Freight')
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (1, 122, N'989319-457', CAST(N'2019-10-08' AS Date), 3813.3300, 3813.3300, 0.0000, 3, CAST(N'2019-11-08' AS Date), CAST(N'2019-11-07' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (2, 123, N'263253241', CAST(N'2019-10-10' AS Date), 40.2000, 40.2000, 0.0000, 3, CAST(N'2019-11-10' AS Date), CAST(N'2019-11-14' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (3, 123, N'963253234', CAST(N'2019-10-13' AS Date), 138.7500, 138.7500, 0.0000, 3, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (4, 123, N'2-000-2993', CAST(N'2019-10-16' AS Date), 144.7000, 144.7000, 0.0000, 3, CAST(N'2019-11-16' AS Date), CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (5, 123, N'963253251', CAST(N'2019-10-16' AS Date), 15.5000, 15.5000, 0.0000, 3, CAST(N'2019-11-16' AS Date), CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (6, 123, N'963253261', CAST(N'2019-10-16' AS Date), 42.7500, 42.7500, 0.0000, 3, CAST(N'2019-11-16' AS Date), CAST(N'2019-11-21' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (7, 123, N'963253237', CAST(N'2019-10-21' AS Date), 172.5000, 172.5000, 0.0000, 3, CAST(N'2019-11-21' AS Date), CAST(N'2019-11-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (8, 89, N'125520-1', CAST(N'2019-10-24' AS Date), 95.0000, 95.0000, 0.0000, 1, CAST(N'2019-11-04' AS Date), CAST(N'2019-11-01' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (9, 121, N'97/488', CAST(N'2019-10-24' AS Date), 601.9500, 601.9500, 0.0000, 3, CAST(N'2019-11-24' AS Date), CAST(N'2019-11-21' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (10, 123, N'263253250', CAST(N'2019-10-24' AS Date), 42.6700, 42.6700, 0.0000, 3, CAST(N'2019-11-24' AS Date), CAST(N'2019-11-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (11, 123, N'963253262', CAST(N'2019-10-25' AS Date), 42.5000, 42.5000, 0.0000, 3, CAST(N'2019-11-25' AS Date), CAST(N'2019-11-20' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (12, 96, N'I77271-O01', CAST(N'2019-10-26' AS Date), 662.0000, 662.0000, 0.0000, 2, CAST(N'2019-11-16' AS Date), CAST(N'2019-11-13' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (13, 95, N'111-92R-10096', CAST(N'2019-10-30' AS Date), 16.3300, 16.3300, 0.0000, 2, CAST(N'2019-11-20' AS Date), CAST(N'2019-11-23' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (14, 115, N'25022117', CAST(N'2019-11-01' AS Date), 6.0000, 6.0000, 0.0000, 4, CAST(N'2019-12-10' AS Date), CAST(N'2019-12-10' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (15, 48, N'P02-88D77S7', CAST(N'2019-11-03' AS Date), 856.9200, 856.9200, 0.0000, 3, CAST(N'2019-12-02' AS Date), CAST(N'2019-11-30' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (16, 97, N'21-4748363', CAST(N'2019-11-03' AS Date), 9.9500, 9.9500, 0.0000, 2, CAST(N'2019-11-23' AS Date), CAST(N'2019-11-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (17, 123, N'4-321-2596', CAST(N'2019-11-05' AS Date), 10.0000, 10.0000, 0.0000, 3, CAST(N'2019-12-04' AS Date), CAST(N'2019-12-05' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (18, 123, N'963253242', CAST(N'2019-11-06' AS Date), 104.0000, 104.0000, 0.0000, 3, CAST(N'2019-12-05' AS Date), CAST(N'2019-12-05' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (19, 34, N'QP58872', CAST(N'2019-11-07' AS Date), 116.5400, 116.5400, 0.0000, 1, CAST(N'2019-11-17' AS Date), CAST(N'2019-11-19' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (20, 115, N'24863706', CAST(N'2019-11-10' AS Date), 6.0000, 6.0000, 0.0000, 4, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-15' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (21, 119, N'10843', CAST(N'2019-11-11' AS Date), 4901.2600, 4901.2600, 0.0000, 2, CAST(N'2019-11-30' AS Date), CAST(N'2019-11-29' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (22, 123, N'963253235', CAST(N'2019-11-11' AS Date), 108.2500, 108.2500, 0.0000, 3, CAST(N'2019-12-10' AS Date), CAST(N'2019-12-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (23, 97, N'21-4923721', CAST(N'2019-11-13' AS Date), 9.9500, 9.9500, 0.0000, 2, CAST(N'2019-12-02' AS Date), CAST(N'2019-11-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (24, 113, N'77290', CAST(N'2019-11-13' AS Date), 1750.0000, 1750.0000, 0.0000, 5, CAST(N'2020-01-02' AS Date), CAST(N'2020-01-05' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (25, 123, N'963253246', CAST(N'2019-11-13' AS Date), 129.0000, 129.0000, 0.0000, 3, CAST(N'2019-12-12' AS Date), CAST(N'2019-12-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (26, 123, N'4-342-8069', CAST(N'2019-11-14' AS Date), 10.0000, 10.0000, 0.0000, 3, CAST(N'2019-12-13' AS Date), CAST(N'2019-12-13' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (27, 88, N'972110', CAST(N'2019-11-15' AS Date), 207.7800, 207.7800, 0.0000, 1, CAST(N'2019-11-25' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (28, 123, N'963253263', CAST(N'2019-11-16' AS Date), 109.5000, 109.5000, 0.0000, 3, CAST(N'2019-12-15' AS Date), CAST(N'2019-12-10' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (29, 108, N'121897', CAST(N'2019-11-19' AS Date), 450.0000, 450.0000, 0.0000, 4, CAST(N'2019-12-28' AS Date), CAST(N'2020-01-03' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (30, 123, N'1-200-5164', CAST(N'2019-11-20' AS Date), 63.4000, 63.4000, 0.0000, 3, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (31, 104, N'P02-3772', CAST(N'2019-11-21' AS Date), 7125.3400, 7125.3400, 0.0000, 3, CAST(N'2019-12-20' AS Date), CAST(N'2019-12-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (32, 121, N'97/486', CAST(N'2019-11-21' AS Date), 953.1000, 953.1000, 0.0000, 3, CAST(N'2019-12-20' AS Date), CAST(N'2019-12-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (33, 105, N'94007005', CAST(N'2019-11-23' AS Date), 220.0000, 220.0000, 0.0000, 3, CAST(N'2019-12-22' AS Date), CAST(N'2019-12-26' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (34, 123, N'963253232', CAST(N'2019-11-23' AS Date), 127.7500, 127.7500, 0.0000, 3, CAST(N'2019-12-22' AS Date), CAST(N'2019-12-18' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (35, 107, N'RTR-72-3662-X', CAST(N'2019-11-25' AS Date), 1600.0000, 1600.0000, 0.0000, 4, CAST(N'2020-01-04' AS Date), CAST(N'2020-01-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (36, 121, N'97/465', CAST(N'2019-11-25' AS Date), 565.1500, 565.1500, 0.0000, 3, CAST(N'2019-12-24' AS Date), CAST(N'2019-12-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (37, 123, N'963253260', CAST(N'2019-11-25' AS Date), 36.0000, 36.0000, 0.0000, 3, CAST(N'2019-12-24' AS Date), CAST(N'2019-12-26' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (38, 123, N'963253272', CAST(N'2019-11-26' AS Date), 61.5000, 61.5000, 0.0000, 3, CAST(N'2019-12-25' AS Date), CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (39, 110, N'0-2058', CAST(N'2019-11-28' AS Date), 37966.1900, 37966.1900, 0.0000, 3, CAST(N'2019-12-27' AS Date), CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (40, 121, N'97/503', CAST(N'2019-11-30' AS Date), 639.7700, 639.7700, 0.0000, 3, CAST(N'2019-12-28' AS Date), CAST(N'2019-12-25' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (41, 123, N'963253255', CAST(N'2019-11-30' AS Date), 53.7500, 53.7500, 0.0000, 3, CAST(N'2019-12-28' AS Date), CAST(N'2019-12-27' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (42, 123, N'94007069', CAST(N'2019-11-30' AS Date), 400.0000, 400.0000, 0.0000, 3, CAST(N'2019-12-28' AS Date), CAST(N'2020-01-01' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (43, 72, N'40318', CAST(N'2019-12-01' AS Date), 21842.0000, 21842.0000, 0.0000, 3, CAST(N'2020-01-01' AS Date), CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (44, 95, N'111-92R-10094', CAST(N'2019-12-01' AS Date), 19.6700, 19.6700, 0.0000, 2, CAST(N'2019-12-21' AS Date), CAST(N'2019-12-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (45, 122, N'989319-437', CAST(N'2019-12-01' AS Date), 2765.3600, 2765.3600, 0.0000, 3, CAST(N'2020-01-01' AS Date), CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (46, 37, N'547481328', CAST(N'2019-12-03' AS Date), 224.0000, 224.0000, 0.0000, 3, CAST(N'2020-01-03' AS Date), CAST(N'2020-01-04' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (47, 83, N'31359783', CAST(N'2019-12-03' AS Date), 1575.0000, 1575.0000, 0.0000, 2, CAST(N'2019-12-23' AS Date), CAST(N'2019-12-21' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (48, 123, N'1-202-2978', CAST(N'2019-12-03' AS Date), 33.0000, 33.0000, 0.0000, 3, CAST(N'2020-01-03' AS Date), CAST(N'2020-01-05' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (49, 95, N'111-92R-10097', CAST(N'2019-12-04' AS Date), 16.3300, 16.3300, 0.0000, 2, CAST(N'2019-12-24' AS Date), CAST(N'2019-12-26' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (50, 37, N'547479217', CAST(N'2019-12-07' AS Date), 116.0000, 116.0000, 0.0000, 3, CAST(N'2020-01-07' AS Date), CAST(N'2020-01-07' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (51, 122, N'989319-477', CAST(N'2019-12-08' AS Date), 2184.1100, 2184.1100, 0.0000, 3, CAST(N'2020-01-08' AS Date), CAST(N'2020-01-08' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (52, 34, N'Q545443', CAST(N'2019-12-09' AS Date), 1083.5800, 1083.5800, 0.0000, 1, CAST(N'2019-12-19' AS Date), CAST(N'2019-12-23' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (53, 95, N'111-92R-10092', CAST(N'2019-12-09' AS Date), 46.2100, 46.2100, 0.0000, 2, CAST(N'2019-12-28' AS Date), CAST(N'2020-01-02' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (54, 121, N'97/553B', CAST(N'2019-12-10' AS Date), 313.5500, 313.5500, 0.0000, 3, CAST(N'2020-01-10' AS Date), CAST(N'2020-01-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (55, 123, N'963253245', CAST(N'2019-12-10' AS Date), 40.7500, 40.7500, 0.0000, 3, CAST(N'2020-01-10' AS Date), CAST(N'2020-01-12' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (56, 86, N'367447', CAST(N'2019-12-11' AS Date), 2433.0000, 2433.0000, 0.0000, 1, CAST(N'2019-12-21' AS Date), CAST(N'2019-12-17' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (57, 103, N'75C-90227', CAST(N'2019-12-11' AS Date), 1367.5000, 1367.5000, 0.0000, 5, CAST(N'2020-01-31' AS Date), CAST(N'2020-01-31' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (58, 123, N'963253256', CAST(N'2019-12-11' AS Date), 53.2500, 53.2500, 0.0000, 3, CAST(N'2020-01-11' AS Date), CAST(N'2020-01-07' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (59, 123, N'4-314-3057', CAST(N'2019-12-11' AS Date), 13.7500, 13.7500, 0.0000, 3, CAST(N'2020-01-11' AS Date), CAST(N'2020-01-15' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (60, 122, N'989319-497', CAST(N'2019-12-12' AS Date), 2312.2000, 2312.2000, 0.0000, 3, CAST(N'2020-01-12' AS Date), CAST(N'2020-01-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (61, 115, N'24946731', CAST(N'2019-12-15' AS Date), 25.6700, 25.6700, 0.0000, 4, CAST(N'2020-01-25' AS Date), CAST(N'2020-01-26' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (62, 123, N'963253269', CAST(N'2019-12-15' AS Date), 26.7500, 26.7500, 0.0000, 3, CAST(N'2020-01-15' AS Date), CAST(N'2020-01-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (63, 122, N'989319-427', CAST(N'2019-12-16' AS Date), 2115.8100, 2115.8100, 0.0000, 3, CAST(N'2020-01-16' AS Date), CAST(N'2020-01-19' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (64, 123, N'963253267', CAST(N'2019-12-17' AS Date), 23.5000, 23.5000, 0.0000, 3, CAST(N'2020-01-17' AS Date), CAST(N'2020-01-19' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (65, 99, N'509786', CAST(N'2019-12-18' AS Date), 6940.2500, 6940.2500, 0.0000, 3, CAST(N'2020-01-18' AS Date), CAST(N'2020-01-15' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (66, 123, N'263253253', CAST(N'2019-12-18' AS Date), 31.9500, 31.9500, 0.0000, 3, CAST(N'2020-01-18' AS Date), CAST(N'2020-01-21' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (67, 122, N'989319-487', CAST(N'2019-12-20' AS Date), 1927.5400, 1927.5400, 0.0000, 3, CAST(N'2020-01-20' AS Date), CAST(N'2020-01-18' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (68, 81, N'MABO1489', CAST(N'2019-12-21' AS Date), 936.9300, 936.9300, 0.0000, 2, CAST(N'2020-01-11' AS Date), CAST(N'2020-01-10' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (69, 80, N'133560', CAST(N'2019-12-22' AS Date), 175.0000, 175.0000, 0.0000, 2, CAST(N'2020-01-12' AS Date), CAST(N'2020-01-16' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (70, 115, N'24780512', CAST(N'2019-12-22' AS Date), 6.0000, 6.0000, 0.0000, 4, CAST(N'2020-02-01' AS Date), CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (71, 123, N'963253254', CAST(N'2019-12-22' AS Date), 108.5000, 108.5000, 0.0000, 3, CAST(N'2020-01-22' AS Date), CAST(N'2020-01-20' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (72, 123, N'43966316', CAST(N'2019-12-22' AS Date), 10.0000, 10.0000, 0.0000, 3, CAST(N'2020-01-22' AS Date), CAST(N'2020-01-17' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (73, 114, N'CBM9920-M-T77109', CAST(N'2019-12-23' AS Date), 290.0000, 290.0000, 0.0000, 1, CAST(N'2020-01-03' AS Date), CAST(N'2019-12-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (74, 102, N'109596', CAST(N'2019-12-24' AS Date), 41.8000, 41.8000, 0.0000, 4, CAST(N'2020-02-03' AS Date), CAST(N'2020-02-04' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (75, 123, N'7548906-20', CAST(N'2019-12-24' AS Date), 27.0000, 27.0000, 0.0000, 3, CAST(N'2020-01-24' AS Date), CAST(N'2020-01-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (76, 123, N'963253248', CAST(N'2019-12-24' AS Date), 241.0000, 241.0000, 0.0000, 3, CAST(N'2020-01-24' AS Date), CAST(N'2020-01-25' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (77, 121, N'97/553', CAST(N'2019-12-25' AS Date), 904.1400, 904.1400, 0.0000, 3, CAST(N'2020-01-25' AS Date), CAST(N'2020-01-25' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (78, 121, N'97/522', CAST(N'2019-12-28' AS Date), 1962.1300, 1762.1300, 200.0000, 3, CAST(N'2020-01-28' AS Date), CAST(N'2020-01-30' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (79, 100, N'587056', CAST(N'2019-12-28' AS Date), 2184.5000, 2184.5000, 0.0000, 4, CAST(N'2020-02-09' AS Date), CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (80, 122, N'989319-467', CAST(N'2020-01-01' AS Date), 2318.0300, 2318.0300, 0.0000, 3, CAST(N'2020-01-31' AS Date), CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (81, 123, N'263253265', CAST(N'2020-01-02' AS Date), 26.2500, 26.2500, 0.0000, 3, CAST(N'2020-02-01' AS Date), CAST(N'2020-01-28' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (82, 94, N'203339-13', CAST(N'2020-01-05' AS Date), 17.5000, 17.5000, 0.0000, 2, CAST(N'2020-01-25' AS Date), CAST(N'2020-01-27' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (83, 95, N'111-92R-10093', CAST(N'2020-01-06' AS Date), 39.7700, 39.7700, 0.0000, 2, CAST(N'2020-01-26' AS Date), CAST(N'2020-01-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (84, 123, N'963253258', CAST(N'2020-01-06' AS Date), 111.0000, 111.0000, 0.0000, 3, CAST(N'2020-02-05' AS Date), CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (85, 123, N'963253271', CAST(N'2020-01-07' AS Date), 158.0000, 158.0000, 0.0000, 3, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (86, 123, N'963253230', CAST(N'2020-01-07' AS Date), 739.2000, 739.2000, 0.0000, 3, CAST(N'2020-02-06' AS Date), CAST(N'2020-02-06' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (87, 123, N'963253244', CAST(N'2020-01-08' AS Date), 60.0000, 60.0000, 0.0000, 3, CAST(N'2020-02-07' AS Date), CAST(N'2020-02-09' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (88, 123, N'963253239', CAST(N'2020-01-08' AS Date), 147.2500, 147.2500, 0.0000, 3, CAST(N'2020-02-07' AS Date), CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (89, 72, N'39104', CAST(N'2020-01-10' AS Date), 85.3100, 0.0000, 0.0000, 3, CAST(N'2020-02-09' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (90, 123, N'963253252', CAST(N'2020-01-12' AS Date), 38.7500, 38.7500, 0.0000, 3, CAST(N'2020-02-11' AS Date), CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (91, 95, N'111-92R-10095', CAST(N'2020-01-15' AS Date), 32.7000, 32.7000, 0.0000, 2, CAST(N'2020-02-04' AS Date), CAST(N'2020-02-06' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (92, 117, N'111897', CAST(N'2020-01-15' AS Date), 16.6200, 16.6200, 0.0000, 3, CAST(N'2020-02-14' AS Date), CAST(N'2020-02-14' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (93, 123, N'4-327-7357', CAST(N'2020-01-16' AS Date), 162.7500, 162.7500, 0.0000, 3, CAST(N'2020-02-15' AS Date), CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (94, 123, N'963253264', CAST(N'2020-01-18' AS Date), 52.2500, 0.0000, 0.0000, 3, CAST(N'2020-02-17' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (95, 82, N'C73-24', CAST(N'2020-01-19' AS Date), 600.0000, 600.0000, 0.0000, 2, CAST(N'2020-02-08' AS Date), CAST(N'2020-02-13' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (96, 110, N'P-0259', CAST(N'2020-01-19' AS Date), 26881.4000, 26881.4000, 0.0000, 3, CAST(N'2020-02-18' AS Date), CAST(N'2020-02-20' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (97, 90, N'97-1024A', CAST(N'2020-01-20' AS Date), 356.4800, 356.4800, 0.0000, 2, CAST(N'2020-02-09' AS Date), CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (98, 83, N'31361833', CAST(N'2020-01-21' AS Date), 579.4200, 0.0000, 0.0000, 2, CAST(N'2020-02-10' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (99, 123, N'263253268', CAST(N'2020-01-21' AS Date), 59.9700, 0.0000, 0.0000, 3, CAST(N'2020-02-20' AS Date), NULL)
GO
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (100, 123, N'263253270', CAST(N'2020-01-22' AS Date), 67.9200, 0.0000, 0.0000, 3, CAST(N'2020-02-21' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (101, 123, N'263253273', CAST(N'2020-01-22' AS Date), 30.7500, 0.0000, 0.0000, 3, CAST(N'2020-02-21' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (102, 110, N'P-0608', CAST(N'2020-01-23' AS Date), 20551.1800, 0.0000, 1200.0000, 3, CAST(N'2020-02-22' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (103, 122, N'989319-417', CAST(N'2020-01-23' AS Date), 2051.5900, 2051.5900, 0.0000, 3, CAST(N'2020-02-22' AS Date), CAST(N'2020-02-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (104, 123, N'263253243', CAST(N'2020-01-23' AS Date), 44.4400, 44.4400, 0.0000, 3, CAST(N'2020-02-22' AS Date), CAST(N'2020-02-24' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (105, 106, N'9982771', CAST(N'2020-01-24' AS Date), 503.2000, 0.0000, 0.0000, 3, CAST(N'2020-02-23' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (106, 110, N'0-2060', CAST(N'2020-01-24' AS Date), 23517.5800, 21221.6300, 2295.9500, 3, CAST(N'2020-02-23' AS Date), CAST(N'2020-02-27' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (107, 122, N'989319-447', CAST(N'2020-01-24' AS Date), 3689.9900, 3689.9900, 0.0000, 3, CAST(N'2020-02-23' AS Date), CAST(N'2020-02-19' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (108, 123, N'963253240', CAST(N'2020-01-24' AS Date), 67.0000, 67.0000, 0.0000, 3, CAST(N'2020-02-23' AS Date), CAST(N'2020-02-23' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (109, 121, N'97/222', CAST(N'2020-01-25' AS Date), 1000.4600, 1000.4600, 0.0000, 3, CAST(N'2020-02-24' AS Date), CAST(N'2020-02-22' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (110, 80, N'134116', CAST(N'2020-01-28' AS Date), 90.3600, 0.0000, 0.0000, 2, CAST(N'2020-02-17' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (111, 123, N'263253257', CAST(N'2020-01-30' AS Date), 22.5700, 22.5700, 0.0000, 3, CAST(N'2020-02-29' AS Date), CAST(N'2020-03-03' AS Date))
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (112, 110, N'0-2436', CAST(N'2020-01-31' AS Date), 10976.0600, 0.0000, 0.0000, 3, CAST(N'2020-02-29' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (113, 37, N'547480102', CAST(N'2020-02-01' AS Date), 224.0000, 0.0000, 0.0000, 3, CAST(N'2020-02-29' AS Date), NULL)
INSERT [dbo].[Invoices] ([InvoiceID], [VendorID], [InvoiceNumber], [InvoiceDate], [InvoiceTotal], [PaymentTotal], [CreditTotal], [TermsID], [InvoiceDueDate], [PaymentDate]) VALUES (114, 123, N'963253249', CAST(N'2020-02-02' AS Date), 127.7500, 127.7500, 0.0000, 3, CAST(N'2020-03-01' AS Date), CAST(N'2020-03-04' AS Date))
SET IDENTITY_INSERT [dbo].[Invoices] OFF
SET IDENTITY_INSERT [dbo].[Terms] ON 

INSERT [dbo].[Terms] ([TermsID], [TermsDescription], [TermsDueDays]) VALUES (1, N'Net due 10 days', 10)
INSERT [dbo].[Terms] ([TermsID], [TermsDescription], [TermsDueDays]) VALUES (2, N'Net due 20 days', 20)
INSERT [dbo].[Terms] ([TermsID], [TermsDescription], [TermsDueDays]) VALUES (3, N'Net due 30 days', 30)
INSERT [dbo].[Terms] ([TermsID], [TermsDescription], [TermsDueDays]) VALUES (4, N'Net due 60 days', 60)
INSERT [dbo].[Terms] ([TermsID], [TermsDescription], [TermsDueDays]) VALUES (5, N'Net due 90 days', 90)
SET IDENTITY_INSERT [dbo].[Terms] OFF
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (1, N'US Postal Service', N'Attn:  Supt. Window Services', N'PO Box 7005', N'Madison', N'WI', N'53707', N'(800) 555-1205', N'Alberto', N'Francesco', 1, 552)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (2, N'National Information Data Ctr', N'PO Box 96621', NULL, N'Washington', N'DC', N'20090', N'(301) 555-8950', N'Irvin', N'Ania', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (3, N'Register of Copyrights', N'Library Of Congress', NULL, N'Washington', N'DC', N'20559', NULL, N'Liana', N'Lukas', 3, 403)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (4, N'Jobtrak', N'1990 Westwood Blvd Ste 260', NULL, N'Los Angeles', N'CA', N'90025', N'(800) 555-8725', N'Quinn', N'Kenzie', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (5, N'Newbrige Book Clubs', N'3000 Cindel Drive', NULL, N'Washington', N'NJ', N'07882', N'(800) 555-9980', N'Marks', N'Michelle', 4, 394)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (6, N'California Chamber Of Commerce', N'3255 Ramos Cir', NULL, N'Sacramento', N'CA', N'95827', N'(916) 555-6670', N'Mauro', N'Anton', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (7, N'Towne Advertiser''s Mailing Svcs', N'Kevin Minder', N'3441 W Macarthur Blvd', N'Santa Ana', N'CA', N'92704', NULL, N'Maegen', N'Ted', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (8, N'BFI Industries', N'PO Box 9369', NULL, N'Fresno', N'CA', N'93792', N'(559) 555-1551', N'Kaleigh', N'Erick', 3, 521)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (9, N'Pacific Gas & Electric', N'Box 52001', NULL, N'San Francisco', N'CA', N'94152', N'(800) 555-6081', N'Anthoni', N'Kaitlyn', 3, 521)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (10, N'Robbins Mobile Lock And Key', N'4669 N Fresno', NULL, N'Fresno', N'CA', N'93726', N'(559) 555-9375', N'Leigh', N'Bill', 2, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (11, N'Bill Marvin Electric Inc', N'4583 E Home', NULL, N'Fresno', N'CA', N'93703', N'(559) 555-5106', N'Hostlery', N'Kaitlin', 2, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (12, N'City Of Fresno', N'PO Box 2069', NULL, N'Fresno', N'CA', N'93718', N'(559) 555-9999', N'Mayte', N'Kendall', 3, 574)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (13, N'Golden Eagle Insurance Co', N'PO Box 85826', NULL, N'San Diego', N'CA', N'92186', NULL, N'Blanca', N'Korah', 3, 590)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (14, N'Expedata Inc', N'4420 N. First Street, Suite 108', NULL, N'Fresno', N'CA', N'93726', N'(559) 555-9586', N'Quintin', N'Marvin', 3, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (15, N'ASC Signs', N'1528 N Sierra Vista', NULL, N'Fresno', N'CA', N'93703', NULL, N'Darien', N'Elisabeth', 1, 546)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (16, N'Internal Revenue Service', NULL, NULL, N'Fresno', N'CA', N'93888', NULL, N'Aileen', N'Joan', 1, 235)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (17, N'Blanchard & Johnson Associates', N'27371 Valderas', NULL, N'Mission Viejo', N'CA', N'92691', N'(214) 555-3647', N'Keeton', N'Gonzalo', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (18, N'Fresno Photoengraving Company', N'1952 "H" Street', N'P.O. Box 1952', N'Fresno', N'CA', N'93718', N'(559) 555-3005', N'Chaddick', N'Derek', 3, 403)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (19, N'Crown Printing', N'1730 "H" St', NULL, N'Fresno', N'CA', N'93721', N'(559) 555-7473', N'Randrup', N'Leann', 2, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (20, N'Diversified Printing & Pub', N'2632 Saturn St', NULL, N'Brea', N'CA', N'92621', N'(714) 555-4541', N'Lane', N'Vanesa', 3, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (21, N'The Library Ltd', N'7700 Forsyth', NULL, N'St Louis', N'MO', N'63105', N'(314) 555-8834', N'Marques', N'Malia', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (22, N'Micro Center', N'1555 W Lane Ave', NULL, N'Columbus', N'OH', N'43221', N'(614) 555-4435', N'Evan', N'Emily', 2, 160)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (23, N'Yale Industrial Trucks-Fresno', N'3711 W Franklin', NULL, N'Fresno', N'CA', N'93706', N'(559) 555-2993', N'Alexis', N'Alexandro', 3, 532)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (24, N'Zee Medical Service Co', N'4221 W Sierra Madre #104', NULL, N'Washington', N'IA', N'52353', NULL, N'Hallie', N'Juliana', 3, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (25, N'California Data Marketing', N'2818 E Hamilton', NULL, N'Fresno', N'CA', N'93721', N'(559) 555-3801', N'Jonessen', N'Moises', 4, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (26, N'Small Press', N'121 E Front St - 4th Floor', NULL, N'Traverse City', N'MI', N'49684', NULL, N'Colette', N'Dusty', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (27, N'Rich Advertising', N'12 Daniel Road', NULL, N'Fairfield', N'NJ', N'07004', N'(201) 555-9742', N'Neil', N'Ingrid', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (29, N'Vision Envelope & Printing', N'PO Box 3100', NULL, N'Gardena', N'CA', N'90247', N'(310) 555-7062', N'Raven', N'Jamari', 3, 551)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (30, N'Costco', N'Fresno Warehouse', N'4500 W Shaw', N'Fresno', N'CA', N'93711', NULL, N'Jaquan', N'Aaron', 3, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (31, N'Enterprise Communications Inc', N'1483 Chain Bridge Rd, Ste 202', NULL, N'Mclean', N'VA', N'22101', N'(770) 555-9558', N'Lawrence', N'Eileen', 2, 536)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (32, N'RR Bowker', N'PO Box 31', NULL, N'East Brunswick', N'NJ', N'08810', N'(800) 555-8110', N'Essence', N'Marjorie', 3, 532)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (33, N'Nielson', N'Ohio Valley Litho Division', N'Location #0470', N'Cincinnati', N'OH', N'45264', NULL, N'Brooklynn', N'Keely', 2, 541)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (34, N'IBM', N'PO Box 61000', NULL, N'San Francisco', N'CA', N'94161', N'(800) 555-4426', N'Camron', N'Trentin', 1, 160)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (35, N'Cal State Termite', N'PO Box 956', NULL, N'Selma', N'CA', N'93662', N'(559) 555-1534', N'Hunter', N'Demetrius', 2, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (36, N'Graylift', N'PO Box 2808', NULL, N'Fresno', N'CA', N'93745', N'(559) 555-6621', N'Sydney', N'Deangelo', 3, 532)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (37, N'Blue Cross', N'PO Box 9061', NULL, N'Oxnard', N'CA', N'93031', N'(800) 555-0912', N'Eliana', N'Nikolas', 3, 510)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (38, N'Venture Communications Int''l', N'60 Madison Ave', NULL, N'New York', N'NY', N'10010', N'(212) 555-4800', N'Neftaly', N'Thalia', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (39, N'Custom Printing Company', N'PO Box 7028', NULL, N'St Louis', N'MO', N'63177', N'(301) 555-1494', N'Myles', N'Harley', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (40, N'Nat Assoc of College Stores', N'500 East Lorain Street', NULL, N'Oberlin', N'OH', N'44074', NULL, N'Bernard', N'Lucy', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (41, N'Shields Design', N'415 E Olive Ave', NULL, N'Fresno', N'CA', N'93728', N'(559) 555-8060', N'Kerry', N'Rowan', 2, 403)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (42, N'Opamp Technical Books', N'1033 N Sycamore Ave.', NULL, N'Los Angeles', N'CA', N'90038', N'(213) 555-4322', N'Paris', N'Gideon', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (43, N'Capital Resource Credit', N'PO Box 39046', NULL, N'Minneapolis', N'MN', N'55439', N'(612) 555-0057', N'Maxwell', N'Jayda', 3, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (44, N'Courier Companies, Inc', N'PO Box 5317', NULL, N'Boston', N'MA', N'02206', N'(508) 555-6351', N'Antavius', N'Troy', 4, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (45, N'Naylor Publications Inc', N'PO Box 40513', NULL, N'Jacksonville', N'FL', N'32231', N'(800) 555-6041', N'Gerald', N'Kristofer', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (46, N'Open Horizons Publishing', N'Book Marketing Update', N'PO Box 205', N'Fairfield', N'IA', N'52556', N'(515) 555-6130', N'Damien', N'Deborah', 2, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (47, N'Baker & Taylor Books', N'Five Lakepointe Plaza, Ste 500', N'2709 Water Ridge Parkway', N'Charlotte', N'NC', N'28217', N'(704) 555-3500', N'Bernardo', N'Brittnee', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (48, N'Fresno County Tax Collector', N'PO Box 1192', NULL, N'Fresno', N'CA', N'93715', N'(559) 555-3482', N'Brenton', N'Kila', 3, 574)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (49, N'Mcgraw Hill Companies', N'PO Box 87373', NULL, N'Chicago', N'IL', N'60680', N'(614) 555-3663', N'Holbrooke', N'Rashad', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (50, N'Publishers Weekly', N'Box 1979', NULL, N'Marion', N'OH', N'43305', N'(800) 555-1669', N'Carrollton', N'Priscilla', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (51, N'Blue Shield of California', N'PO Box 7021', NULL, N'Anaheim', N'CA', N'92850', N'(415) 555-5103', N'Smith', N'Kylie', 3, 510)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (52, N'Aztek Label', N'Accounts Payable', N'1150 N Tustin Ave', N'Anaheim', N'CA', N'92807', N'(714) 555-9000', N'Griffin', N'Brian', 3, 551)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (53, N'Gary McKeighan Insurance', N'3649 W Beechwood Ave #101', NULL, N'Fresno', N'CA', N'93711', N'(559) 555-2420', N'Jair', N'Caitlin', 3, 590)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (54, N'Ph Photographic Services', N'2384 E Gettysburg', NULL, N'Fresno', N'CA', N'93726', N'(559) 555-0765', N'Cheyenne', N'Kaylea', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (55, N'Quality Education Data', N'PO Box 95857', NULL, N'Chicago', N'IL', N'60694', N'(800) 555-5811', N'Misael', N'Kayle', 2, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (56, N'Springhouse Corp', N'PO Box 7247-7051', NULL, N'Philadelphia', N'PA', N'19170', N'(215) 555-8700', N'Maeve', N'Clarence', 3, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (57, N'The Windows Deck', N'117 W Micheltorena Top Floor', NULL, N'Santa Barbara', N'CA', N'93101', N'(800) 555-3353', N'Wood', N'Liam', 3, 536)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (58, N'Fresno Rack & Shelving Inc', N'4718 N Bendel Ave', NULL, N'Fresno', N'CA', N'93722', NULL, N'Baylee', N'Dakota', 2, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (59, N'Publishers Marketing Assoc', N'627 Aviation Way', NULL, N'Manhatttan Beach', N'CA', N'90266', N'(310) 555-2732', N'Walker', N'Jovon', 3, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (60, N'The Mailers Guide Co', N'PO Box 1550', NULL, N'New Rochelle', N'NY', N'10802', NULL, N'Lacy', N'Karina', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (61, N'American Booksellers Assoc', N'828 S Broadway', NULL, N'Tarrytown', N'NY', N'10591', N'(800) 555-0037', N'Angelica', N'Nashalie', 3, 574)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (62, N'Cmg Information Services', N'PO Box 2283', NULL, N'Boston', N'MA', N'02107', N'(508) 555-7000', N'Randall', N'Yash', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (63, N'Lou Gentile''s Flower Basket', N'722 E Olive Ave', NULL, N'Fresno', N'CA', N'93728', N'(559) 555-6643', N'Anum', N'Trisha', 1, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (64, N'Texaco', N'PO Box 6070', NULL, N'Inglewood', N'CA', N'90312', NULL, N'Oren', N'Grace', 3, 582)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (65, N'The Drawing Board', N'PO Box 4758', NULL, N'Carol Stream', N'IL', N'60197', NULL, N'Mckayla', N'Jeffery', 2, 551)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (66, N'Ascom Hasler Mailing Systems', N'PO Box 895', NULL, N'Shelton', N'CT', N'06484', NULL, N'Lewis', N'Darnell', 3, 532)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (67, N'Bill Jones', N'Secretary Of State', N'PO Box 944230', N'Sacramento', N'CA', N'94244', NULL, N'Deasia', N'Tristin', 3, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (68, N'Computer Library', N'3502 W Greenway #7', NULL, N'Phoenix', N'AZ', N'85023', N'(602) 547-0331', N'Aryn', N'Leroy', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (69, N'Frank E Wilber Co', N'2437 N Sunnyside', NULL, N'Fresno', N'CA', N'93727', N'(559) 555-1881', N'Millerton', N'Johnathon', 3, 532)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (70, N'Fresno Credit Bureau', N'PO Box 942', NULL, N'Fresno', N'CA', N'93714', N'(559) 555-7900', N'Braydon', N'Anne', 2, 555)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (71, N'The Fresno Bee', N'1626 E Street', NULL, N'Fresno', N'CA', N'93786', N'(559) 555-4442', N'Colton', N'Leah', 2, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (72, N'Data Reproductions Corp', N'4545 Glenmeade Lane', NULL, N'Auburn Hills', N'MI', N'48326', N'(810) 555-3700', N'Arodondo', N'Cesar', 3, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (73, N'Executive Office Products', N'353 E Shaw Ave', NULL, N'Fresno', N'CA', N'93710', N'(559) 555-1704', N'Danielson', N'Rachael', 2, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (74, N'Leslie Company', N'PO Box 610', NULL, N'Olathe', N'KS', N'66061', N'(800) 255-6210', N'Alondra', N'Zev', 3, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (75, N'Retirement Plan Consultants', N'6435 North Palm Ave, Ste 101', NULL, N'Fresno', N'CA', N'93704', N'(559) 555-7070', N'Edgardo', N'Salina', 3, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (76, N'Simon Direct Inc', N'4 Cornwall Dr Ste 102', NULL, N'East Brunswick', N'NJ', N'08816', N'(908) 555-7222', N'Bradlee', N'Daniel', 2, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (77, N'State Board Of Equalization', N'PO Box 942808', NULL, N'Sacramento', N'CA', N'94208', N'(916) 555-4911', N'Dean', N'Julissa', 1, 631)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (78, N'The Presort Center', N'1627 "E" Street', NULL, N'Fresno', N'CA', N'93706', N'(559) 555-6151', N'Marissa', N'Kyle', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (79, N'Valprint', N'PO Box 12332', NULL, N'Fresno', N'CA', N'93777', N'(559) 555-3112', N'Warren', N'Quentin', 3, 551)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (80, N'Cardinal Business Media, Inc.', N'P O Box 7247-7844', NULL, N'Philadelphia', N'PA', N'19170', N'(215) 555-1500', N'Eulalia', N'Kelsey', 2, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (81, N'Wang Laboratories, Inc.', N'P.O. Box 21209', NULL, N'Pasadena', N'CA', N'91185', N'(800) 555-0344', N'Kapil', N'Robert', 2, 160)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (82, N'Reiter''s Scientific & Pro Books', N'2021 K Street Nw', NULL, N'Washington', N'DC', N'20006', N'(202) 555-5561', N'Rodolfo', N'Carlee', 2, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (83, N'Ingram', N'PO Box 845361', NULL, N'Dallas', N'TX', N'75284', NULL, N'Yobani', N'Trey', 2, 541)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (84, N'Boucher Communications Inc', N'1300 Virginia Dr. Ste 400', NULL, N'Fort Washington', N'PA', N'19034', N'(215) 555-8000', N'Carson', N'Julian', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (85, N'Champion Printing Company', N'3250 Spring Grove Ave', NULL, N'Cincinnati', N'OH', N'45225', N'(800) 555-1957', N'Clifford', N'Jillian', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (86, N'Computerworld', N'Department #1872', N'PO Box 61000', N'San Francisco', N'CA', N'94161', N'(617) 555-0700', N'Lloyd', N'Angel', 1, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (87, N'DMV Renewal', N'PO Box 942894', NULL, N'Sacramento', N'CA', N'94294', NULL, N'Josey', N'Lorena', 4, 568)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (88, N'Edward Data Services', N'4775 E Miami River Rd', NULL, N'Cleves', N'OH', N'45002', N'(513) 555-3043', N'Helena', N'Jeanette', 1, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (89, N'Evans Executone Inc', N'4918 Taylor Ct', NULL, N'Turlock', N'CA', N'95380', NULL, N'Royce', N'Hannah', 1, 522)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (90, N'Wakefield Co', N'295 W Cromwell Ave Ste 106', NULL, N'Fresno', N'CA', N'93711', N'(559) 555-4744', N'Rothman', N'Nathanael', 2, 170)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (91, N'McKesson Water Products', N'P O Box 7126', NULL, N'Pasadena', N'CA', N'91109', N'(800) 555-7009', N'Destin', N'Luciano', 2, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (92, N'Zip Print & Copy Center', N'PO Box 12332', NULL, N'Fresno', N'CA', N'93777', N'(233) 555-6400', N'Javen', N'Justin', 2, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (93, N'AT&T', N'PO Box 78225', NULL, N'Phoenix', N'AZ', N'85062', NULL, N'Wesley', N'Alisha', 3, 522)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (94, N'Abbey Office Furnishings', N'4150 W Shaw Ave', NULL, N'Fresno', N'CA', N'93722', N'(559) 555-8300', N'Francis', N'Kyra', 2, 150)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (95, N'Pacific Bell', NULL, NULL, N'Sacramento', N'CA', N'95887', N'(209) 555-7500', N'Nickalus', N'Kurt', 2, 522)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (96, N'Wells Fargo Bank', N'Business Mastercard', N'P.O. Box 29479', N'Phoenix', N'AZ', N'85038', N'(947) 555-3900', N'Damion', N'Mikayla', 2, 160)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (97, N'Compuserve', N'Dept L-742', NULL, N'Columbus', N'OH', N'43260', N'(614) 555-8600', N'Armando', N'Jan', 2, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (98, N'American Express', N'Box 0001', NULL, N'Los Angeles', N'CA', N'90096', N'(800) 555-3344', N'Story', N'Kirsten', 2, 160)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (99, N'Bertelsmann Industry Svcs. Inc', N'28210 N Avenue Stanford', NULL, N'Valencia', N'CA', N'91355', N'(805) 555-0584', N'Potter', N'Lance', 3, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (100, N'Cahners Publishing Company', N'Citibank Lock Box 4026', N'8725 W Sahara Zone 1127', N'The Lake', N'NV', N'89163', N'(301) 555-2162', N'Jacobsen', N'Samuel', 4, 540)
GO
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (101, N'California Business Machines', N'Gallery Plz', N'5091 N Fresno', N'Fresno', N'CA', N'93710', N'(559) 555-5570', N'Rohansen', N'Anders', 2, 170)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (102, N'Coffee Break Service', N'PO Box 1091', NULL, N'Fresno', N'CA', N'93714', N'(559) 555-8700', N'Smitzen', N'Jeffrey', 4, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (103, N'Dean Witter Reynolds', N'9 River Pk Pl E 400', NULL, N'Boston', N'MA', N'02134', N'(508) 555-8737', N'Johnson', N'Vance', 5, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (104, N'Digital Dreamworks', N'5070 N Sixth Ste. 71', NULL, N'Fresno', N'CA', N'93711', NULL, N'Elmert', N'Ron', 3, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (105, N'Dristas Groom & McCormick', N'7112 N Fresno St Ste 200', NULL, N'Fresno', N'CA', N'93720', N'(559) 555-8484', N'Aaronsen', N'Thom', 3, 591)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (106, N'Ford Motor Credit Company', N'Dept 0419', NULL, N'Los Angeles', N'CA', N'90084', N'(800) 555-7000', N'Snyder', N'Karen', 3, 582)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (107, N'Franchise Tax Board', N'PO Box 942857', NULL, N'Sacramento', N'CA', N'94257', NULL, N'Prado', N'Anita', 4, 507)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (108, N'Gostanian General Building', N'427 W Bedford #102', NULL, N'Fresno', N'CA', N'93711', N'(559) 555-5100', N'Bragg', N'Walter', 4, 523)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (109, N'Kent H Landsberg Co', N'File No 72686', N'PO Box 61000', N'San Francisco', N'CA', N'94160', N'(916) 555-8100', N'Stevens', N'Wendy', 3, 540)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (110, N'Malloy Lithographing Inc', N'5411 Jackson Road', N'PO Box 1124', N'Ann Arbor', N'MI', N'48106', N'(313) 555-6113', N'Regging', N'Abe', 3, 400)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (111, N'Net Asset, Llc', N'1315 Van Ness Ave Ste. 103', NULL, N'Fresno', N'CA', N'93721', NULL, N'Kraggin', N'Laura', 1, 572)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (112, N'Office Depot', N'File No 81901', NULL, N'Los Angeles', N'CA', N'90074', N'(800) 555-1711', N'Pinsippi', N'Val', 3, 570)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (113, N'Pollstar', N'4697 W Jacquelyn Ave', NULL, N'Fresno', N'CA', N'93722', N'(559) 555-2631', N'Aranovitch', N'Robert', 5, 520)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (114, N'Postmaster', N'Postage Due Technician', N'1900 E Street', N'Fresno', N'CA', N'93706', N'(559) 555-7785', N'Finklestein', N'Fyodor', 1, 552)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (115, N'Roadway Package System, Inc', N'Dept La 21095', NULL, N'Pasadena', N'CA', N'91185', NULL, N'Smith', N'Sam', 4, 553)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (116, N'State of California', N'Employment Development Dept', N'PO Box 826276', N'Sacramento', N'CA', N'94230', N'(209) 555-5132', N'Articunia', N'Mercedez', 1, 631)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (117, N'Suburban Propane', N'2874 S Cherry Ave', NULL, N'Fresno', N'CA', N'93706', N'(559) 555-2770', N'Spivak', N'Harold', 3, 521)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (118, N'Unocal', N'P.O. Box 860070', NULL, N'Pasadena', N'CA', N'91186', N'(415) 555-7600', N'Bluzinski', N'Rachael', 3, 582)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (119, N'Yesmed, Inc', N'PO Box 2061', NULL, N'Fresno', N'CA', N'93718', N'(559) 555-0600', N'Hernandez', N'Reba', 2, 589)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (120, N'Dataforms/West', N'1617 W. Shaw Avenue', N'Suite F', N'Fresno', N'CA', N'93711', NULL, N'Church', N'Charlie', 3, 551)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (121, N'Zylka Design', N'3467 W Shaw Ave #103', NULL, N'Fresno', N'CA', N'93711', N'(559) 555-8625', N'Ronaldsen', N'Jaime', 3, 403)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (122, N'United Parcel Service', N'P.O. Box 505820', NULL, N'Reno', N'NV', N'88905', N'(800) 555-0855', N'Beauregard', N'Violet', 3, 553)
INSERT [dbo].[Vendors] ([VendorID], [VendorName], [VendorAddress1], [VendorAddress2], [VendorCity], [VendorState], [VendorZipCode], [VendorPhone], [VendorContactLName], [VendorContactFName], [DefaultTermsID], [DefaultAccountNo]) VALUES (123, N'Federal Express Corporation', N'P.O. Box 1140', N'Dept A', N'Memphis', N'TN', N'38101', N'(800) 555-4091', N'Bucket', N'Charlie', 3, 553)
SET IDENTITY_INSERT [dbo].[Vendors] OFF
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_PaymentTotal]  DEFAULT ((0)) FOR [PaymentTotal]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_CreditTotal]  DEFAULT ((0)) FOR [CreditTotal]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_TermsID]  DEFAULT ((3)) FOR [DefaultTermsID]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_AccountNo]  DEFAULT ((570)) FOR [DefaultAccountNo]
GO
ALTER TABLE [dbo].[InvoiceLineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_InvoiceLineItems_GLAccounts] FOREIGN KEY([AccountNo])
REFERENCES [dbo].[GLAccounts] ([AccountNo])
GO
ALTER TABLE [dbo].[InvoiceLineItems] CHECK CONSTRAINT [FK_InvoiceLineItems_GLAccounts]
GO
ALTER TABLE [dbo].[InvoiceLineItems]  WITH NOCHECK ADD  CONSTRAINT [FK_InvoiceLineItems_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceLineItems] CHECK CONSTRAINT [FK_InvoiceLineItems_Invoices]
GO
ALTER TABLE [dbo].[Invoices]  WITH NOCHECK ADD  CONSTRAINT [FK_Invoices_Terms] FOREIGN KEY([TermsID])
REFERENCES [dbo].[Terms] ([TermsID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Terms]
GO
ALTER TABLE [dbo].[Invoices]  WITH NOCHECK ADD  CONSTRAINT [FK_Invoices_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Vendors]
GO
ALTER TABLE [dbo].[Vendors]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendors_GLAccounts] FOREIGN KEY([DefaultAccountNo])
REFERENCES [dbo].[GLAccounts] ([AccountNo])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_GLAccounts]
GO
ALTER TABLE [dbo].[Vendors]  WITH NOCHECK ADD  CONSTRAINT [FK_Vendors_Terms] FOREIGN KEY([DefaultTermsID])
REFERENCES [dbo].[Terms] ([TermsID])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_Terms]
GO
