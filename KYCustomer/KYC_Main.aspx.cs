using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYCustomer
{
    public partial class KYC_Main : System.Web.UI.Page
    {
        Boolean Status = true;
        #region Database Connection  
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindGridViewCustomer();
                }                
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }
        }
        #endregion
        #region show message  
        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");  
        }
        void clear()
        {
            txtName.Text = string.Empty; txtLastName.Text = string.Empty; txtPhoneNo.Text = string.Empty;
            txtEmail.Text = string.Empty;  RBLStatus.Items[0].Selected = false; RBLStatus.Items[1].Selected = false;
            txtName.Focus();
        }
        #endregion
        #region bind data to GridViewCustomer  
        private void BindGridViewCustomer()
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("USP_SelectInContactInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                GridViewCustomer.DataSource = ds;
                GridViewCustomer.DataBind();
                lbltotalcount.Text = GridViewCustomer.Rows.Count.ToString();                                
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
        #endregion
        #region Insert Customer Data  
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                Boolean Status = true;
                SqlCommand cmd = new SqlCommand("USP_InsertInContactInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustFirstName",SqlDbType.VarChar).Value = Convert.ToString(txtName.Text);
                cmd.Parameters.AddWithValue("@CustLastName", SqlDbType.VarChar).Value = Convert.ToString(txtLastName.Text);
                cmd.Parameters.AddWithValue("@EmailId", SqlDbType.VarChar).Value = Convert.ToString(txtEmail.Text);
                cmd.Parameters.AddWithValue("@PhoneNo", SqlDbType.Int).Value =  Convert.ToDouble(txtPhoneNo.Text);                              
                if (RBLStatus.Items[0].Selected == true)
                    Status = true;
                else if (RBLStatus.Items[1].Selected == true)
                    Status = false;
                cmd.Parameters.AddWithValue("@Status", SqlDbType.Bit).Value = Status;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Registered successfully......!");
                clear();
                BindGridViewCustomer();
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        #endregion
        #region SelectedIndexChanged  
        protected void GridViewCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewCustomer.SelectedRow;
            lblCID.Text = row.Cells[2].Text;
            txtName.Text = row.Cells[3].Text;
            txtLastName.Text = row.Cells[4].Text;
            txtEmail.Text = row.Cells[5].Text;
            txtPhoneNo.Text = row.Cells[6].Text;
            if (row.Cells[7].Text == "Active")
                RBLStatus.Items[0].Selected = true;
            else
                RBLStatus.Items[1].Selected = true;                             
            btnSubmit.Visible = false;
            btnUpdate.Visible = true;
        }
        #endregion
        #region Delete Customer Data  
        protected void GridViewCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                conn.Open();
                int CID = Convert.ToInt32(GridViewCustomer.DataKeys[e.RowIndex].Value);
                SqlCommand cmd = new SqlCommand("USP_DeleteInContactInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CID", CID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Customer Data Delete Successfully......!");
                GridViewCustomer.EditIndex = -1;
                BindGridViewCustomer();
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
        #region Customer data update  
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string CID = lblCID.Text;
                SqlCommand cmd = new SqlCommand("USP_UpdateInContactInformation", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustFirstName", txtName.Text);
                cmd.Parameters.AddWithValue("@CustLastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNo", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@EmailId", txtEmail.Text);
                if (RBLStatus.Items[0].Selected == true)
                    Status = true;
                else if (RBLStatus.Items[1].Selected == true)
                    Status = false;
                cmd.Parameters.AddWithValue("@Status", Status);
                cmd.Parameters.AddWithValue("@CID", CID);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                ShowMessage("Customer Data update Successfully......!");
                GridViewCustomer.EditIndex = -1;
                BindGridViewCustomer(); btnUpdate.Visible = false;
                clear();
                btnSubmit.Visible = true;
            }
            catch (SqlException ex)
            {
                ShowMessage(ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        #endregion
        #region textbox clear  
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
        }
        #endregion

        protected void GridViewCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCustomer.PageIndex = e.NewPageIndex;
            BindGridViewCustomer();
        }       
    }
}