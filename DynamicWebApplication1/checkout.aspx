<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="DynamicWebApplication1.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <br />

     <div class="container-fluid">
        <div class="row">

            <div class="col-md-10 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/shopping-cart2.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h3>Checkout</h3>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>

                          <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h5>Review your Order</h5>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>


                     


                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>
                        

                    <div>
                        <asp:Label ID="Label1" runat="server" Text="1 Samoosa - 25"></asp:Label>

                    </div>

                        
                        <div class="row">
                            <div class="col">
                                <%--Data Tables Library to be added for search functionality--%>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                        <div class="d-grid gap-2 col-6 mx-auto">
                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Process Order" OnClick="Button1_Click" />
                             
                    </div>
                                 
                   </div>
                </div>

            </div>
         



</asp:Content>
