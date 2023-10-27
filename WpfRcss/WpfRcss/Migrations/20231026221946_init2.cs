using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WpfRcss.Migrations
{
    /// <inheritdoc />
    public partial class init2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Addresses_Cities_CityId",
                table: "Addresses");

            migrationBuilder.DropForeignKey(
                name: "FK_Addresses_Countries_CountryId",
                table: "Addresses");

            migrationBuilder.DropForeignKey(
                name: "FK_Buyers_Addresses_AddressId",
                table: "Buyers");

            migrationBuilder.DropForeignKey(
                name: "FK_DayVariants_Employees_CreatedByEmployeeId",
                table: "DayVariants");

            migrationBuilder.DropForeignKey(
                name: "FK_DayVariants_Employees_UpdatedByEmployeeId",
                table: "DayVariants");

            migrationBuilder.DropForeignKey(
                name: "FK_Distributors_Addresses_AddressId",
                table: "Distributors");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Addresses_HomeAddressId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Employees_CreatedByEmployeeId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Images_ImageId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Stores_StoreWorkedAtId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Images_Employees_CreatedByEmployeeId",
                table: "Images");

            migrationBuilder.DropForeignKey(
                name: "FK_Materials_Colors_ColorId",
                table: "Materials");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductItems_Items_ItemId",
                table: "ProductItems");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Distributors_DistributorId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Employees_CreatedByEmployeeId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Employees_UpdatedByEmployeeId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_ProductClassifications_ClassificationId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactionInfos_ProductTransactions_TransactionId",
                table: "ProductTransactionInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactionInfos_Products_ProductId",
                table: "ProductTransactionInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Buyers_BuyerId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_CreatedByEmployeeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_EmployeePerformedTransactionEm~",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_UpdatedByEmployeeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Stores_StoreId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_TransactionTypes_TransactionTypeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_Receipts_ProductTransactions_TransactionId",
                table: "Receipts");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_DayVariants_DayVariantId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Employees_CreatedByEmployeeId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Employees_UpdatedByEmployeeId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Stores_StoreId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Addresses_AddressId",
                table: "Stores");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Countries_CountryId",
                table: "Stores");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Images_LogoId",
                table: "Stores");

            migrationBuilder.AlterColumn<int>(
                name: "LogoId",
                table: "Stores",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CountryId",
                table: "Stores",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Stores",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "StoreHours",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "StoreId",
                table: "StoreHours",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "DayVariantId",
                table: "StoreHours",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "StoreHours",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "TransactionId",
                table: "Receipts",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "TransactionTypeId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "StoreId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "EmployeePerformedTransactionEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "BuyerId",
                table: "ProductTransactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "TransactionId",
                table: "ProductTransactionInfos",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "ProductId",
                table: "ProductTransactionInfos",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "Products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "DistributorId",
                table: "Products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "ClassificationId",
                table: "Products",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "ItemId",
                table: "ProductItems",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "ColorId",
                table: "Materials",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Images",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "StoreWorkedAtId",
                table: "Employees",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "ImageId",
                table: "Employees",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "HomeAddressId",
                table: "Employees",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Employees",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Distributors",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "DayVariants",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "DayVariants",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "PhotoId",
                table: "Buyers",
                type: "int",
                nullable: true,
                oldClrType: typeof(byte[]),
                oldType: "longblob",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Buyers",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CountryId",
                table: "Addresses",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CityId",
                table: "Addresses",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateIndex(
                name: "IX_Buyers_PhotoId",
                table: "Buyers",
                column: "PhotoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Addresses_Cities_CityId",
                table: "Addresses",
                column: "CityId",
                principalTable: "Cities",
                principalColumn: "CityId");

            migrationBuilder.AddForeignKey(
                name: "FK_Addresses_Countries_CountryId",
                table: "Addresses",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Buyers_Addresses_AddressId",
                table: "Buyers",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Buyers_Images_PhotoId",
                table: "Buyers",
                column: "PhotoId",
                principalTable: "Images",
                principalColumn: "ImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_DayVariants_Employees_CreatedByEmployeeId",
                table: "DayVariants",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_DayVariants_Employees_UpdatedByEmployeeId",
                table: "DayVariants",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Distributors_Addresses_AddressId",
                table: "Distributors",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Addresses_HomeAddressId",
                table: "Employees",
                column: "HomeAddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Employees_CreatedByEmployeeId",
                table: "Employees",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Images_ImageId",
                table: "Employees",
                column: "ImageId",
                principalTable: "Images",
                principalColumn: "ImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Stores_StoreWorkedAtId",
                table: "Employees",
                column: "StoreWorkedAtId",
                principalTable: "Stores",
                principalColumn: "StoreId");

            migrationBuilder.AddForeignKey(
                name: "FK_Images_Employees_CreatedByEmployeeId",
                table: "Images",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Materials_Colors_ColorId",
                table: "Materials",
                column: "ColorId",
                principalTable: "Colors",
                principalColumn: "ColorId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductItems_Items_ItemId",
                table: "ProductItems",
                column: "ItemId",
                principalTable: "Items",
                principalColumn: "ItemId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Distributors_DistributorId",
                table: "Products",
                column: "DistributorId",
                principalTable: "Distributors",
                principalColumn: "DistributorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Employees_CreatedByEmployeeId",
                table: "Products",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Employees_UpdatedByEmployeeId",
                table: "Products",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_ProductClassifications_ClassificationId",
                table: "Products",
                column: "ClassificationId",
                principalTable: "ProductClassifications",
                principalColumn: "ClassificationId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactionInfos_ProductTransactions_TransactionId",
                table: "ProductTransactionInfos",
                column: "TransactionId",
                principalTable: "ProductTransactions",
                principalColumn: "TransactionId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactionInfos_Products_ProductId",
                table: "ProductTransactionInfos",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "ProductId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Buyers_BuyerId",
                table: "ProductTransactions",
                column: "BuyerId",
                principalTable: "Buyers",
                principalColumn: "BuyerId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_CreatedByEmployeeId",
                table: "ProductTransactions",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_EmployeePerformedTransactionEm~",
                table: "ProductTransactions",
                column: "EmployeePerformedTransactionEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_UpdatedByEmployeeId",
                table: "ProductTransactions",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Stores_StoreId",
                table: "ProductTransactions",
                column: "StoreId",
                principalTable: "Stores",
                principalColumn: "StoreId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_TransactionTypes_TransactionTypeId",
                table: "ProductTransactions",
                column: "TransactionTypeId",
                principalTable: "TransactionTypes",
                principalColumn: "TransactionTypeId");

            migrationBuilder.AddForeignKey(
                name: "FK_Receipts_ProductTransactions_TransactionId",
                table: "Receipts",
                column: "TransactionId",
                principalTable: "ProductTransactions",
                principalColumn: "TransactionId");

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_DayVariants_DayVariantId",
                table: "StoreHours",
                column: "DayVariantId",
                principalTable: "DayVariants",
                principalColumn: "DayVariantId");

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Employees_CreatedByEmployeeId",
                table: "StoreHours",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Employees_UpdatedByEmployeeId",
                table: "StoreHours",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId");

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Stores_StoreId",
                table: "StoreHours",
                column: "StoreId",
                principalTable: "Stores",
                principalColumn: "StoreId");

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Addresses_AddressId",
                table: "Stores",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId");

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Countries_CountryId",
                table: "Stores",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "CountryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Images_LogoId",
                table: "Stores",
                column: "LogoId",
                principalTable: "Images",
                principalColumn: "ImageId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Addresses_Cities_CityId",
                table: "Addresses");

            migrationBuilder.DropForeignKey(
                name: "FK_Addresses_Countries_CountryId",
                table: "Addresses");

            migrationBuilder.DropForeignKey(
                name: "FK_Buyers_Addresses_AddressId",
                table: "Buyers");

            migrationBuilder.DropForeignKey(
                name: "FK_Buyers_Images_PhotoId",
                table: "Buyers");

            migrationBuilder.DropForeignKey(
                name: "FK_DayVariants_Employees_CreatedByEmployeeId",
                table: "DayVariants");

            migrationBuilder.DropForeignKey(
                name: "FK_DayVariants_Employees_UpdatedByEmployeeId",
                table: "DayVariants");

            migrationBuilder.DropForeignKey(
                name: "FK_Distributors_Addresses_AddressId",
                table: "Distributors");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Addresses_HomeAddressId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Employees_CreatedByEmployeeId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Images_ImageId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Employees_Stores_StoreWorkedAtId",
                table: "Employees");

            migrationBuilder.DropForeignKey(
                name: "FK_Images_Employees_CreatedByEmployeeId",
                table: "Images");

            migrationBuilder.DropForeignKey(
                name: "FK_Materials_Colors_ColorId",
                table: "Materials");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductItems_Items_ItemId",
                table: "ProductItems");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Distributors_DistributorId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Employees_CreatedByEmployeeId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Employees_UpdatedByEmployeeId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_ProductClassifications_ClassificationId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactionInfos_ProductTransactions_TransactionId",
                table: "ProductTransactionInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactionInfos_Products_ProductId",
                table: "ProductTransactionInfos");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Buyers_BuyerId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_CreatedByEmployeeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_EmployeePerformedTransactionEm~",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Employees_UpdatedByEmployeeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_Stores_StoreId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductTransactions_TransactionTypes_TransactionTypeId",
                table: "ProductTransactions");

            migrationBuilder.DropForeignKey(
                name: "FK_Receipts_ProductTransactions_TransactionId",
                table: "Receipts");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_DayVariants_DayVariantId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Employees_CreatedByEmployeeId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Employees_UpdatedByEmployeeId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_StoreHours_Stores_StoreId",
                table: "StoreHours");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Addresses_AddressId",
                table: "Stores");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Countries_CountryId",
                table: "Stores");

            migrationBuilder.DropForeignKey(
                name: "FK_Stores_Images_LogoId",
                table: "Stores");

            migrationBuilder.DropIndex(
                name: "IX_Buyers_PhotoId",
                table: "Buyers");

            migrationBuilder.AlterColumn<int>(
                name: "LogoId",
                table: "Stores",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CountryId",
                table: "Stores",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Stores",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "StoreHours",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "StoreId",
                table: "StoreHours",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "DayVariantId",
                table: "StoreHours",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "StoreHours",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "TransactionId",
                table: "Receipts",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "TransactionTypeId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "StoreId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "EmployeePerformedTransactionEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BuyerId",
                table: "ProductTransactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "TransactionId",
                table: "ProductTransactionInfos",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ProductId",
                table: "ProductTransactionInfos",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "DistributorId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ClassificationId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ItemId",
                table: "ProductItems",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ColorId",
                table: "Materials",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Images",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "StoreWorkedAtId",
                table: "Employees",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "ImageId",
                table: "Employees",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "HomeAddressId",
                table: "Employees",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "Employees",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Distributors",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UpdatedByEmployeeId",
                table: "DayVariants",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CreatedByEmployeeId",
                table: "DayVariants",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<byte[]>(
                name: "PhotoId",
                table: "Buyers",
                type: "longblob",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AddressId",
                table: "Buyers",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CountryId",
                table: "Addresses",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CityId",
                table: "Addresses",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Addresses_Cities_CityId",
                table: "Addresses",
                column: "CityId",
                principalTable: "Cities",
                principalColumn: "CityId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Addresses_Countries_CountryId",
                table: "Addresses",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "CountryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Buyers_Addresses_AddressId",
                table: "Buyers",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_DayVariants_Employees_CreatedByEmployeeId",
                table: "DayVariants",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_DayVariants_Employees_UpdatedByEmployeeId",
                table: "DayVariants",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Distributors_Addresses_AddressId",
                table: "Distributors",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Addresses_HomeAddressId",
                table: "Employees",
                column: "HomeAddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Employees_CreatedByEmployeeId",
                table: "Employees",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Images_ImageId",
                table: "Employees",
                column: "ImageId",
                principalTable: "Images",
                principalColumn: "ImageId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Employees_Stores_StoreWorkedAtId",
                table: "Employees",
                column: "StoreWorkedAtId",
                principalTable: "Stores",
                principalColumn: "StoreId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Images_Employees_CreatedByEmployeeId",
                table: "Images",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Materials_Colors_ColorId",
                table: "Materials",
                column: "ColorId",
                principalTable: "Colors",
                principalColumn: "ColorId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductItems_Items_ItemId",
                table: "ProductItems",
                column: "ItemId",
                principalTable: "Items",
                principalColumn: "ItemId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Distributors_DistributorId",
                table: "Products",
                column: "DistributorId",
                principalTable: "Distributors",
                principalColumn: "DistributorId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Employees_CreatedByEmployeeId",
                table: "Products",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Employees_UpdatedByEmployeeId",
                table: "Products",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Products_ProductClassifications_ClassificationId",
                table: "Products",
                column: "ClassificationId",
                principalTable: "ProductClassifications",
                principalColumn: "ClassificationId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactionInfos_ProductTransactions_TransactionId",
                table: "ProductTransactionInfos",
                column: "TransactionId",
                principalTable: "ProductTransactions",
                principalColumn: "TransactionId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactionInfos_Products_ProductId",
                table: "ProductTransactionInfos",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "ProductId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Buyers_BuyerId",
                table: "ProductTransactions",
                column: "BuyerId",
                principalTable: "Buyers",
                principalColumn: "BuyerId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_CreatedByEmployeeId",
                table: "ProductTransactions",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_EmployeePerformedTransactionEm~",
                table: "ProductTransactions",
                column: "EmployeePerformedTransactionEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Employees_UpdatedByEmployeeId",
                table: "ProductTransactions",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_Stores_StoreId",
                table: "ProductTransactions",
                column: "StoreId",
                principalTable: "Stores",
                principalColumn: "StoreId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductTransactions_TransactionTypes_TransactionTypeId",
                table: "ProductTransactions",
                column: "TransactionTypeId",
                principalTable: "TransactionTypes",
                principalColumn: "TransactionTypeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Receipts_ProductTransactions_TransactionId",
                table: "Receipts",
                column: "TransactionId",
                principalTable: "ProductTransactions",
                principalColumn: "TransactionId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_DayVariants_DayVariantId",
                table: "StoreHours",
                column: "DayVariantId",
                principalTable: "DayVariants",
                principalColumn: "DayVariantId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Employees_CreatedByEmployeeId",
                table: "StoreHours",
                column: "CreatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Employees_UpdatedByEmployeeId",
                table: "StoreHours",
                column: "UpdatedByEmployeeId",
                principalTable: "Employees",
                principalColumn: "EmployeeId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_StoreHours_Stores_StoreId",
                table: "StoreHours",
                column: "StoreId",
                principalTable: "Stores",
                principalColumn: "StoreId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Addresses_AddressId",
                table: "Stores",
                column: "AddressId",
                principalTable: "Addresses",
                principalColumn: "AddressId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Countries_CountryId",
                table: "Stores",
                column: "CountryId",
                principalTable: "Countries",
                principalColumn: "CountryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Stores_Images_LogoId",
                table: "Stores",
                column: "LogoId",
                principalTable: "Images",
                principalColumn: "ImageId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
