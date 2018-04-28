<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ASPxGridView.aspx.cs" Inherits="BootstrapChart_Bind_from_Grid.Pages.ASPxGridView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <section>
        <dx:BootstrapCallbackPanel ID="cbGrid" ClientInstanceName="cbGrid" runat="server">
            <ContentCollection>
                <dx:ContentControl>
                    <dx:ASPxPanel runat="server" ID="dxPanel" ClientInstanceName="dxPanel" Width="100%">
                        <Paddings Padding="10" />
                        <PanelCollection>
                            <dx:PanelContent>
                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="MetropolisBlue" ClientInstanceName="grid" Width="100%" AutoGenerateColumns="False" KeyFieldName="ProductID" OnDataBinding="ASPxGridView1_DataBinding" OnDataBound="ASPxGridView1_DataBound">
                                    <ClientSideEvents EndCallback="function(s,e) { cbChart.PerformCallback('Load'); }" />
                                    <Settings ShowFilterRow="True"></Settings>
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UnitPrice" PropertiesTextEdit-DisplayFormatString="c" VisibleIndex="6"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="7"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="8"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="9"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="10"></dx:GridViewDataCheckColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:ContentControl>
            </ContentCollection>
        </dx:BootstrapCallbackPanel>
        <div class="container">
            <div class="row">
                <div style="margin: 0 auto; float: none">
                    <dx:BootstrapCallbackPanel ID="cbChart" runat="server" OnCallback="cbChart_Callback" CssClasses-Control="center-block">
                        <ContentCollection>
                            <dx:ContentControl>
                                <dx:BootstrapChart ID="btChart" ClientInstanceName="btChart" Width="900px" runat="server" OnDataBinding="btChart_DataBinding">
                                    <SettingsCommonSeries ArgumentField="UnitPrice"></SettingsCommonSeries>
                                    <SeriesCollection>
                                        <dx:BootstrapChartBarSeries ValueField="ProductName" Name="UnitPrice"></dx:BootstrapChartBarSeries>
                                    </SeriesCollection>
                                </dx:BootstrapChart>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:BootstrapCallbackPanel>
                </div>
            </div>
        </div>
    </section>
    <section id="secaoDataSource">
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:NorthwindConnectionString %>' ProviderName='<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>' SelectCommand="SELECT ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM Products WHERE (SupplierID IS NOT NULL)"></asp:SqlDataSource>
    </section>
</asp:Content>
