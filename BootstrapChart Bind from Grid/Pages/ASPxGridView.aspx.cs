using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BootstrapChart_Bind_from_Grid.Pages
{
    public partial class ASPxGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void btChart_DataBinding(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_DataBinding(object sender, EventArgs e)
        {
            ASPxGridView1.DataSource = SqlDataSource1;
        }

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btChart.DataSource = GetBootstrapChartData();
                btChart.DataBind();
            }
        }

        protected BootstrapChartDataItem[] GetBootstrapChartData()
        {
            DataRow gridDataRow;
            BootstrapChartDataItem[] BootstrapChartDataItems = new BootstrapChartDataItem[ASPxGridView1.VisibleRowCount];

            for (int i = 0; i < ASPxGridView1.VisibleRowCount; i++)
            {
                gridDataRow = (ASPxGridView1.GetRow(i) as DataRowView).Row;
                BootstrapChartDataItems[i] = new BootstrapChartDataItem(gridDataRow.Field<string>("ProductName"),
                    gridDataRow.Field<string>("QuantityPerUnit"), gridDataRow.Field<decimal>("UnitPrice"));
            }

            return BootstrapChartDataItems;
        }

        protected void cbChart_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (e.Parameter == "Load")
            {
                btChart.DataSource = GetBootstrapChartData();
                btChart.DataBind();
            }
        }
    }
}