<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DynamicWebApplication1.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="imgs/generaluser.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                               <label>Email</label><ul></ul>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email"></asp:TextBox>
                               </div>
                                    
                               <ul></ul>
                               <label>Password</label><ul></ul>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                               </div>

                                <ul></ul>
                               <div class="d-grid gap-2">
                                   <asp:Button class="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                  <ul></ul>
                               </div>

                            </div>

                        </div>
          
                </div>  
             </div>

                <asp:Button class="btn btn-success m-2 mx-3" ID="Button2" runat="server" Text="Back to Home" OnClick="Button2_Click"/>
               
            </div>
        </div>
    </div>
    

</asp:Content>
