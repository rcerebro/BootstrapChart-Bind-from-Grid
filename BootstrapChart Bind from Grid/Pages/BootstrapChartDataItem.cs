/// <summary>
/// Summary description for BootstrapChartDataItem
/// </summary>
public class BootstrapChartDataItem
{
    public BootstrapChartDataItem(string productName, int supplierID, int categoryID, string quantityPerUnit, decimal unitPrice,
        int unitsInStock, int unitsOnOrder, int reorderLevel)
    {
        ProductName = productName;
        SupplierID = supplierID;
        CategoryID = categoryID;
        QuantityPerUnit = quantityPerUnit;
        UnitPrice = unitPrice;
        UnitsInStock = unitsInStock;
        UnitsOnOrder = unitsOnOrder;
        ReorderLevel = reorderLevel;
    }

    public BootstrapChartDataItem(string productName, string quantityPerUnit, decimal unitPrice)
    {
        ProductName = productName;
        QuantityPerUnit = quantityPerUnit;
        UnitPrice = unitPrice;

    }

    public BootstrapChartDataItem(string productName, decimal unitPrice)
    {
        ProductName = productName;
        UnitPrice = unitPrice;
    }

    public string ProductName { get; set; }
    public int SupplierID { get; set; }
    public int CategoryID { get; }
    public string QuantityPerUnit { get; }
    public decimal UnitPrice { get; }
    public int UnitsInStock { get; }
    public int UnitsOnOrder { get; }
    public int ReorderLevel { get; }
    public int Discontinued { get; }

}

