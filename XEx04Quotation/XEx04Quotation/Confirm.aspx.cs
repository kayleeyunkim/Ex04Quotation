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
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace XEx04Quotation
{

    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            decimal SalesPrice = Convert.ToDecimal(Session["SalesPrice"]);
            decimal discountAmount = Convert.ToDecimal(Session["discountAmount"]);
            decimal totalPrice = Convert.ToDecimal(Session["totalPrice"]);

            if ((Session["SalesPrice"] == null) || (Session["discountAmount"] == null) || (Session["totalPrice"] == null))
            {
                lblSalesPrice.Text = "";
                lblDiscountAmount.Text = "";
                lblTotalPrice.Text = "";
            }

            else
            {
                lblSalesPrice.Text = SalesPrice.ToString("c");
                lblDiscountAmount.Text = discountAmount.ToString("c");
                lblTotalPrice.Text = totalPrice.ToString("c");
            }
        }

        protected void btnSendQuotation_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string email = txtEmail.Text;
                string name = txtName.Text;

                if ((Regex.IsMatch(name, @"^[a-zA-Z]+$")) && validemail(email))
                {
                    lblConfirmMessage.Text = "Quotation sent to " + name + " at " + email + ".";

                    Session.Remove("SalesPrice");
                    Session.Remove("discountAmount");
                    Session.Remove("totalPrice");
                }

                else if (!Regex.IsMatch(name, @"^[a-zA-Z]+$"))
                    lblConfirmMessage.Text = "Name must contains only letters.";

                else if (!validemail(email))
                    lblConfirmMessage.Text = "Email must be email form.";
            }
        }

        public bool validemail(string emailAddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailAddress);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
    }
}