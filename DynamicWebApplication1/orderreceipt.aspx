<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orderreceipt.aspx.cs" Inherits="DynamicWebApplication1.orderreceipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        
    <section>
        <center>
            <img src="imgs/dimension-data-banner.png" class="img-fluid"/>
        </center>
    </section>

         <br />

     <div class="container-fluid">
        <div class="row">

            <div class="col-md-10 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/dimension-data-logo.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h3>Your Order Has Been Processed!</h3>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>

                                    <h3>Order No:</h3>                                   
                                    <asp:Label CssClass="display-1" ID="Label1" runat="server" Text="Label" Font-Size="XX-Large"></asp:Label>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>

                        

                        <div class="row">
                            <div class="col">
                                <center>
                                    <ul></ul>
                                    <h5>Enjoy your Meal!</h5>
                                    <ul></ul>
                                </center>
                            </div>
                        </div>
                                 
                </div>
            </div>

        </div>

</asp:Content>
