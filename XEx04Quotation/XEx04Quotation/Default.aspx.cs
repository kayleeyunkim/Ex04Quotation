/*
  Yun Kim
  WLAC COS 963
  WEB APPLICATION USING ASP.NET
  Project 3: Enhance te Quotation Application
  Oct. 17, 2016
*/


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XEx04Quotation
{
    public partial class Default : System.Web.UI.Page
    {
       


        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                decimal salesPrice = Convert.ToDecimal(txtSalesPrice.Text);
                decimal discountPercent = Convert.ToDecimal(txtDiscountPercent.Text) / 100;

                decimal discountAmount = salesPrice * discountPercent;
                decimal totalPrice = salesPrice - discountAmount;

                lblDiscountAmount.Text = discountAmount.ToString("c");
                lblTotalPrice.Text = totalPrice.ToString("c");

                Session["SalesPrice"] = salesPrice;
                Session["discountAmount"] = discountAmount;
                Session["totalPrice"] = totalPrice;
            }   
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if ((Session["SalesPrice"] == null) || (Session["discountAmount"] == null) || (Session["totalPrice"] == null))
            {
                warningMessage.Text = "Click the Calculate button before you confirm.";
            }

            else 
                Response.Redirect("~/Confirm.aspx");
        }

    }
}