using Dapper;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClientManager.Models
{
    public class ClientModel
    {
        [Display(Name = "Id")]
        [Key]
        public int ClientID { get; set; }

        [DisplayName("Full Name")]
        [Required(ErrorMessage = "Enter Full Name")]
        public string FullName { get; set; }

        [DisplayName("Address")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "Enter Address")]
        public string Address { get; set; }

        [Display(Name = "Phone Number")]
        [RegularExpression(@"^([0-9]{10})$", ErrorMessage = "Invalid Mobile Number.")]
        public string PhoneNumber { get; set; }

        [DisplayName("PIN Code")]
        [Required(ErrorMessage = "Enter PIN Code")]
        public string PINCode { get; set; }

        [DisplayName("City Name")]
        [Required(ErrorMessage = "Enter City Name")]
        public string CityName { get; set; }

        [DisplayName("Email")]
        [Required(ErrorMessage = "Enter Email ID")]
        public string Email { get; set; }



        public SqlConnection con;
        //To Handle connection related activities
        private void connection()
        {
            con = new SqlConnection(ConfigurationManager.AppSettings["SqlConn"].ToString());

            //string constr = ConfigurationManager.ConnectionStrings["SqlConn"].ToString();
            string constr = con.ConnectionString;
            con = new SqlConnection(constr);
        }
        //To Add Client details
        public void AddClient(ClientModel objClient)
        {
            //Adding the Clients
            try
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@FullName", objClient.FullName);
                param.Add("@Address", objClient.Address);
                param.Add("@PhoneNumber", objClient.PhoneNumber);
                param.Add("@PINCode", objClient.PINCode);
                param.Add("@PINCode", objClient.PINCode);
                param.Add("@CityName", objClient.CityName);
                param.Add("@Email", objClient.Email);
                connection();
                con.Open();
                con.Execute("AddClientDetails", param, commandType: CommandType.StoredProcedure);
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //To view client details with generic list 
        public List<ClientModel> GetAllClients()
        {
            try
            {
                connection();
                con.Open();
                IList<ClientModel> EmpList = SqlMapper.Query<ClientModel>(
                                  con, "GetClients").ToList();
                con.Close();
                return EmpList.ToList();
            }
            catch (Exception)
            {
                throw;
            }
        }
        //To Update Client details
        public void UpdateClient(ClientModel objUpdate)
        {
            try
            {
                connection();
                con.Open();
                con.Execute("UpdateClientDetails", objUpdate, commandType: CommandType.StoredProcedure);
                con.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }


}