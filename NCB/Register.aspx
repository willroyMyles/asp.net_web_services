<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NCB.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div class="container">
     <div class="row">
         <div class="col-md-4 offset-2">
           
                    
                    
                          <div class="form-group">
                            <div class="col-md-12"><br>
                              <div class="row my-2"> <h4>Sign up with us!</h4></div><br>
                              <div class="row my-2"><div class="col-md-12 pl-0 justify-content-cente" > <label for="username" class="my-1 mx-1 text-muted">id</label> <asp:TextBox ID="id" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">name</label> <asp:TextBox ID="name" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">email</label> <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">password</label> <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password"></asp:TextBox></div></div>
                              <div class="row"> <asp:Button ID="signup" runat="server" Text="sign up" class="btn btn-block btn-primary" OnClick="signup_Click" /></div>
                            </div>
                          </div>
                      
         </div>
         <div class="col-md-4 offset-1">
                <div class="row">
                            <div class="col-md-12"><br>
                              <div class="row my-2"> <h4>log on to our system!</h4></div><br>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">id</label> <asp:TextBox ID="lid" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">password</label> <asp:TextBox ID="lpassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox></div></div>
                              <div class="row"> <asp:Button OnClick="login_Click" ID="login" runat="server" Text="log in" class="btn btn-block btn-primary" /></div>
                            </div>
                          </div>
         </div>
     </div>
 </div>
</asp:Content>
