<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="NCB.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <div class="container">
     <div class="row">
         <div class="col-md-6 border-right-2">
                <span class="border-right"></span>
                <div class="container">
                        <div class="row">
                          <!-- required bootstrap js -->
                          <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" data-toggle="tab" href="#home"
                                ><h3>Sign Up</h3></a
                              >
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#menu1"
                                ><h3>Log In</h3></a
                              >
                            </li>
                          </ul>
                        </div>
                      </div>
                    
                      <div class="tab-content">
                        <div id="home" class="container tab-pane active">
                          <div class="row">
                            <div class="col-md-12"><br>
                              <div class="row my-2"> <h4>Sign up with us!</h4></div><br>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">id</label> <asp:TextBox ID="id" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">name</label> <asp:TextBox ID="name" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">email</label> <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">password</label> <asp:TextBox ID="password" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row"> <asp:Button ID="signup" runat="server" Text="sign up" class="btn btn-block btn-primary" OnClick="signup_Click" /></div>
                            </div>
                          </div>
                        </div>
                        <div id="menu1" class="container tab-pane fade">
                          <div class="row">
                            <div class="col-md-12"><br>
                              <div class="row my-2"> <h4>log on to our system!</h4></div><br>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">id</label> <asp:TextBox ID="lid" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row my-2"><div class="col-md-12 pl-0" > <label for="username" class="my-1 mx-1 text-muted">password</label> <asp:TextBox ID="lpassword" runat="server" class="form-control"></asp:TextBox></div></div>
                              <div class="row"> <asp:Button OnClick="login_Click" ID="login" runat="server" Text="log in" class="btn btn-block btn-primary" /></div>
                            </div>
                          </div>
                        </div>
                      </div>
         </div>
         <div class="col-md-6 border-left-5">
                <div class="row">
                        <div class="col-md-12">
                            webservice one
                        </div>
                    </div>
                    <div class="row">
                            <div class="col-md-12">
                            webservice two                                
                            </div>
                        </div>
         </div>
     </div>
 </div>
</asp:Content>
