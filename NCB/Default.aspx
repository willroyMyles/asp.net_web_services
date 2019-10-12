<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NCB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Account Information
                    </div>
                        <% if (user != null)
                            {%>

                    <div class="card-body">
                        <p><%= user.Id %></p>
                        <p><%= user.Name %></p>
                        <p><%= user.Email %></p>
                        <p>Balance : <%= user.Balance %></p>
                        <p>Connected to JPS : <%= user.Jps %></p>
                        <p>Connected to NWC : <%= user.Nwc %></p>
                    </div>
                    <div class="card-footer text-muted justify-content-between">
                            <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Deposit_Click" ID="Deposit" runat="server" Text="Deposit" class="btn btn-primary"/>   
                                       </div>
                                       <asp:TextBox ID="DepositBox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                               <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Widthdrawl_Click" ID="Widthdrawl" runat="server" Text="Withdrawl" class="btn btn-secondary"/>   
                                       </div>
                                       <asp:TextBox ID="WithdrawlBox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                    </div>
                    <%} %>
                </div>
            </div>
            <div class="col-md-4">
                
            </div>
            <div class="col-md-4">
                
            </div>
        </div>
    </div>

</asp:Content>
