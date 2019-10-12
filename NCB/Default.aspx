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
                <% if (user != null)
                         {
                             if (user.Nwc == false) //shows when nwc isnt linked
                             {%>
                    <div class="card justify-content-between">
                            <div class="card-header">
                                Link NWC Account
                            </div>
                            <div class="card-body">
                                <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Widthdrawl_Click" ID="nwcId" runat="server" Text="NCB ID" class="btn btn-secondary"/>   
                                       </div>
                                       <asp:TextBox ID="ncbidbox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Widthdrawl_Click" ID="Button4" runat="server" Text="NCB Password" class="btn btn-secondary"/>   
                                       </div>
                                       <asp:TextBox ID="nwcPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-3 center text-center align-center justify-content-between">
                                    <asp:Button OnClick="NWCSubmit_Click" ID="NWCSubmit" runat="server" Text="Link" CssClass="btn btn-secondary btn-block" /> 
                               </div>
                                    
                                <div class="row justify-content-center">or  </div>
                                  
                            </div>
                            <div class="card-footer text-muted justify-content-between my-n2">
                                 <div class="row my-2">
                   <div class="col-md-12">
                        <asp:Button OnClick="Widthdrawl_Click" ID="Button3" runat="server" Text="Login To NWC" class="btn btn-primary btn-block"/>   
                   </div>
                               </div>
                            </div>
                            
                        </div>
                <%}
                        else { // shows when nwc is linked%> 
                
                 <div class="card">
                            <div class="card-header">
                                NWC Information
                            </div>
                            <div class="card-body">
                                sign up or log in
                            </div>
                            <div class="card-footer text-muted justify-content-between">
                                 <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Widthdrawl_Click" ID="Button2" runat="server" Text="Make Payment" class="btn btn-secondary"/>   
                                       </div>
                                       <asp:TextBox ID="TextBox2" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                            </div>
                            
                        </div>
                <%}

                    } %>
            </div>
            <div class="col-md-4">
                
            </div>
        </div>
    </div>

</asp:Content>
