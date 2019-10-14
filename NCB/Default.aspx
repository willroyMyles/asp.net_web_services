<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NCB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container flex" style="min-height:0vh;">
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
                        <p>Balance : $<%= user.Balance %></p>
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
                           <%--     <asp:RequiredFieldValidator ControlToValidate="DepositBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field cannot be empty"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ControlToValidate="DepositBox" ID="RangeValidator1" runat="server" MinimumValue="1" MaximumValue="1000000000000" ErrorMessage="Value must get greater than 0"></asp:RangeValidator>
                              --%> </div>
                               <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="Widthdrawl_Click" ID="Widthdrawl" runat="server" Text="Withdrawl" class="btn btn-secondary"/>   
                                       </div>
                                       <asp:TextBox ID="WithdrawlBox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ControlToValidate="WithdrawlBox" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field cannot be empty"></asp:RequiredFieldValidator>--%>

                                 <%--      <asp:RangeValidator ControlToValidate="WithdrawlBox" ID="RangeValidator3" runat="server" MaximumValue="500" ErrorMessage="Only can withdraw $500 at a time"></asp:RangeValidator>
                                       <asp:RangeValidator ControlToValidate="WithdrawlBox" ID="RangeValidator4" runat="server" MinimumValue="1" MaximumValue="99999999999999" ErrorMessage="cant withdraw less than 1 dollar" CssClass="alert-danger p-1 rounded"></asp:RangeValidator>--%>

                                   </div>
                               </div>
                        <div class="row justify-content-center">
                        <asp:Button OnClick="logoff_Click" ID="logoff" runat="server" Text="Sign Out" class="btn btn-light btn-block"/>   

                        </div>
                    </div>
                    <%}
                        else
                        {%>
                    <div class="row justify-content-center p-5">
                                                  <a href="Register.aspx">LogIn to see details</a>

                    </div>
                    <%}%>
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
                                        <span class="input-group-text" id="my-addon">NCB Id</span>
                                       </div>
                                       <asp:TextBox ID="ncbidbox" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                        <span class="input-group-text" id="my-addon">NCB Password</span>
                                       </div>
                                       <asp:TextBox ID="nwcPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-3 center text-center align-center justify-content-center">
                                    <asp:Button OnClick="NWCSubmit_Click" ID="NWCSubmit" runat="server" Text="Link" CssClass="btn btn-secondary btn-block" /> 
                               </div>
                                    
                                <div class="row justify-content-center">or  </div>
                                  
                            </div>
                            <div class="card-footer text-muted  my-n2">
                                 <div class="row my-2 justify-content-center">
                        <asp:Button OnClick="NWCLogin_Click" ID="NWCLogin" runat="server" Text="Login To NWC" class="btn btn-primary btn-block"/>   
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
                                <p><%= nwcUser["id"] %></p>
                                <p><%= nwcUser["name"] %></p>
                                <p><%= nwcUser["email"] %></p>
                                <p>Balance : $<%= nwcUser["balance"] %></p>
                            </div>
                            <div class="card-footer text-muted justify-content-between">
                                 <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="nwcPaymentButton_Click" ID="nwcPaymentButton" runat="server" Text="Make Payment" class="btn btn-primary"/>   
                                       </div>
                                       <asp:TextBox ID="nwcPayment" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row justify-content-center">
                                    <asp:Button OnClick="nwcUnlink_Click" ID="nwcUnlink" runat="server" Text="UnLink Account" class="btn btn-secondary btn-block btn-light"/>
                                </div>
                            </div>
                            
                        </div>
                <%}

                    } %>
            </div>
            <div class="col-md-4">
                                <% if (user != null)
                         {
                             if (user.Jps == false) //shows when jps isnt linked
                             {%>
                    <div class="card justify-content-between">
                            <div class="card-header">
                                Link JPS Account
                            </div>
                            <div class="card-body">
                                <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                        <span class="input-group-text" id="my-addon">NCB Id</span>
                                       </div>
                                       <asp:TextBox ID="jpsidbox" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                        <span class="input-group-text" id="my-addon">NCB Password</span>
                                       </div>
                                       <asp:TextBox ID="jpspassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row my-3 justify-content-center">
                                    <asp:Button OnClick="JPSSubmit_Click" ID="JPSSubmit" runat="server" Text="Link" CssClass="btn btn-secondary btn-block" /> 
                               </div>
                                    
                                <div class="row justify-content-center">or  </div>
                                  
                            </div>
                            <div class="card-footer text-muted justify-content-between my-n2">
                                 <div class="row my-2 justify-content-center">
                        <asp:Button OnClick="JPSLogin_Click" ID="JPSLogin" runat="server" Text="Login To JPS" class="btn btn-primary btn-block"/>   
                               </div>
                            </div>
                            
                        </div>
                <%}
                        else { // shows when jps is linked%> 
                
                 <div class="card">
                            <div class="card-header">
                                JPS Account Information
                            </div>
                            <div class="card-body">
                                <p><%= jpsUser["id"] %></p>
                                <p><%= jpsUser["name"] %></p>
                                <p><%= jpsUser["email"] %></p>
                                <p>Balance : $<%= jpsUser["balance"] %></p>
                            </div>
                            <div class="card-footer text-muted justify-content-between">
                                 <div class="row my-2">
                                   <div class="input-group">
                                       <div class="input-group-prepend">
                                           <asp:Button OnClick="jpsPaymentButton_Click" ID="jpsPaymentButton" runat="server" Text="Make Payment" class="btn btn-primary"/>   
                                       </div>
                                       <asp:TextBox ID="jpsPayment" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row justify-content-center">
                                    <asp:Button OnClick="jpsUnlink_Click" ID="jpsUnlink" runat="server" Text="UnLink Account" class="btn btn-secondary btn-block btn-light"/>
                                </div>
                            </div>
                            
                        </div>
                <%}

                    } %>
            </div> 
            </div>

           

        </div>
     <div class="col-md-4 my-4">
                <div class="card">
                    <div class="card-header">
                    Check Linked Status
                    </div>
                    <div class="card-body p-2 m-2">
                        <asp:TextBox ID="IdBox" runat="server" CssClass="form-control m-2" placeholder="Id Number"></asp:TextBox>
                        <asp:TextBox ID="passwordBox" runat="server" CssClass="form-control m-2" placeholder="Password"></asp:TextBox>
                        <asp:Button OnClick="checkBtn_Click" ID="checkBtn" runat="server" Text="Check" CssClass="m-2 btn-block btn btn-primary" placeholder=""/></div>
                    <br />
                    <asp:PlaceHolder ID="statusText" runat="server"></asp:PlaceHolder>
                    <div class="card-footer text-muted">
                        Check Linked Status
                    </div>
                </div>
            </div>

    </div>

</asp:Content>
