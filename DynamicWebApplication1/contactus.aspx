<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="DynamicWebApplication1.contactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <center>
            <img src="imgs/dimension-data-banner.png" class="img-fluid"/>
        </center>
    </section>

    <br />

      <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">

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
                                    <h3>Contact Us</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h5>We'd Love to hear from You</h5>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>

                         <div class="row">
                            <div class="col-md-6">
                               <label>Email</label>
                               <div class="form-group">                                       
                                   <asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-link btn-lg" Text="info@dimensiondata.co.za" href="https://www.gmail.com">info@dimensiondata.co.za</asp:HyperLink>
                               </div>
                            </div>                   
                     
                            <div class="col-md-6">
                            <label>Phone</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" 
                                       placeholder="031 123 4567" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                               <label>Facebook</label>
                               <div class="form-group">                                
                                   <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-link btn-lg" Text="facebook.com/dimensiondatacafe" href="https://www.faceook.com">facebook.com/dimensiondatacafe</asp:HyperLink>
                               </div>
                            </div>
                            
                            <div class="col-md-6">
                               <label>Twitter</label>
                               <div class="form-group">
                                   <asp:HyperLink ID="HyperLink2" runat="server" CssClass="btn btn-link btn-lg" Text="twitter.com/dimensiondatacafe" href="https://www.twitter.com">twitter.com/dimensiondatacafe</asp:HyperLink>                             
                               </div>
                            </div>                            
                        </div>


                           <div class="row">
                            <div class="col-md-6">
                               <label>Operating Hours</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" 
                                       placeholder="Mon-Fri 8:30 - 17:00" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>
                            
                            <div class="col-md-6">
                               <label>Location</label>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" 
                                       placeholder="Building A, Floor 1, Room 3" ReadOnly="True"></asp:TextBox>
                               </div>
                            </div>                            
                        </div>

                    <br />

                    <div class="d-grid gap-2">
                           <asp:Button class="btn btn-primary btn-lg"  ID="Button4" runat="server" Text="Back to Home" OnClick="Button4_Click" />
            
                             
                    </div>
                                 
                        </div>
                </div>
            </div>  
        </div>
                 
    </div>


</asp:Content>
