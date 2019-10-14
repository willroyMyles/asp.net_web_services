<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NCB.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container my3" style="min-height:60vh;">
        <div class="row">
            <div class="col-md-4 offset-4">



                <div class="form-group">
                    <div class="col-md-12">
                        <br>
                        <div class="row my-2 center">
                            <h2 class="">Sign up with NCB Online!</h2>
                        </div>
                        <br>
                        <div class="row my-2">
                                <asp:TextBox ID="id" runat="server" class="form-control" placeholder="Id Number" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter an id number</div>
                            </div>
                        <div class="row my-2">
                                <asp:TextBox ID="name" runat="server" class="form-control" placeholder="Name" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a name</div>
                        </div>
                        <div class="row my-2">
                                <asp:TextBox ID="email" runat="server" class="form-control" placeholder="Email" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter an email</div>
                        </div>
                        <div class="row my-2">
                                <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" placeholder="Password" required></asp:TextBox>
                                <div class="invalid-feedback">Please enter a password</div>
                        </div>
                        <div class="row my-2">
                            <asp:Button ID="signup" runat="server" Text="sign up" class="btn btn-block btn-primary" OnClick="signup_Click" /></div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
