<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NCB.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my-3" style="min-height:60vh;">
        <br /><br /><br />
        <div class="form-group row">
                <div class="col-md-4 offset-4">

                                <br>
                                <div class="row my-2">
                                    <h2>Log on to NCB Online!</h2>
                                </div>
                                <br>
                                <div class="row my-2">
                                        <asp:TextBox ID="lid" runat="server" class="form-control block" placeholder="ID Number" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter an id number</div>
                                </div>
                                <div class="row my-2">
                                        <asp:TextBox placeholder="Password" ID="lpassword" runat="server" class="form-control" TextMode="Password" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a password</div>
                                    </div>
                                <div class="row my-2">
                                    <asp:Button OnClick="login_Click" ID="login" runat="server" Text="Log In" class="btn btn-block btn-primary" /></div>
                            </div>
                        </div>

    </div>
</asp:Content>
