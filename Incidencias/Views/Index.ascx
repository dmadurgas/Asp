<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Index.ascx.cs" Inherits="Incidencias.Views.Home" %>
<asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" MaximumDynamicDisplayLevels="0" Orientation="Horizontal">
    <DataBindings>
        <asp:MenuItemBinding DataMember="SiteMapNode" TextField="Title" />
    </DataBindings>
</asp:Menu>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="False" />

