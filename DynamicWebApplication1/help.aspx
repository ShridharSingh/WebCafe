<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="DynamicWebApplication1.Help" %>
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
            <div class="col-md-10 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" img src="imgs/dimension-data-logo.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Help & FAQ</h3>
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
                               <label>QUESTION: How long do I have to wait for my order?
</label><ul></ul>
                               <label>ANSWER: The waiting time for an order is approximately 10 minutes.
</label>
                               </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>


                      <div class="row">
                            <div class="col">
                               <label>QUESTION: Are there any vegan/vegetarian/halaal menu items?

</label><ul></ul>
                               <label>ANSWER: Our list of menu items includes vegetarian, vegan as well halaal options.
</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>


                      <div class="row">
                            <div class="col">
                               <label>QUESTION: What payment options are available?
</label><ul></ul>
                               <label>ANSWER: The only form of payment accepted is points earned.
</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>



                      <div class="row">
                            <div class="col">
                               <label>QUESTION: How is the café responding to covid-19 protocols?
</label><ul></ul>
                               <label>ANSWER: All staff in the café wear gloves and masks, and practice social distancing of 1.5 metres.
</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>



                        <div class="row">
                            <div class="col">
                               <label>QUESTION: What are the trading hours of the café?
</label><ul></ul>
                               <label>ANSWER:  The café is open for orders between 08:30 & 17:30
</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <label>QUESTION: Does the café practice no-contact takeaway?
</label><ul></ul>
                               <label>ANSWER: Yes, all barista’s wear face masks and gloves. Perspex shields are also fixed to the counter.
</label>
                            </div>
                        <div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                               <label>QUESTION: Do unused points expire? If so, after how long do they expire?
</label><ul></ul>
                               <label>ANSWER: Points are allocated at the beginning of every month and are only valid for that specific month.
</label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                             <hr />
                            </div>
                        </div>





                               <div class="form-group">
                                    <hr />
                               </div>
                                    
                               <ul></ul>
                               <label>Ask a question</label><ul></ul>
                               <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                               </div>

                                <ul></ul>
                               <div class="d-grid gap-2">
                                   <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Ask" OnClick="Button1_Click" />
                                  <ul></ul>
                               </div>

                            <div class="d-grid gap-2">
                                   <asp:Button class="btn btn-primary" ID="Button2" runat="server" Text="Back to Home" OnClick="Button2_Click" />
                                  <ul></ul>
                            </div>

                            </div>

                        </div>
                     

                </div>  
             </div>

               
            </div>
        </div>
    </div>

</asp:Content>
