using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using ClientManager.Models;

namespace ClientManager.Controllers
{
    public class ClientController : Controller
    {
        // GET: Client
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["SqlConn"].ToString());

        public ActionResult Index()
        {

            //ClientModel Client = new ClientModel();
            ////  var employees = Client.GetAllClients();
            ////  return Json(new { data = employees }, JsonRequestBehavior.AllowGet);
            //return View(Client.GetAllClients());
            return View();
        }
        public ActionResult GetData()
        {
            ClientModel client = new ClientModel();
            List<ClientModel> objClient = new List<ClientModel>();
            objClient = client.GetAllClients();
            return Json(objClient, JsonRequestBehavior.AllowGet);

        }

        // GET: Client/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Client/Create
        [HttpPost]
        public ActionResult Create(ClientModel client)
        {

            try
            {
                if (ModelState.IsValid)
                {
                    ClientModel Client = new ClientModel();
                    Client.AddClient(client);
                    ViewBag.Message = "Records added successfully.";


                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Client/Edit/5
        public ActionResult Edit(int id)
        {
            ClientModel Client = new ClientModel();
            return View(Client.GetAllClients().Find(Emp => Emp.ClientID == id));
        }

        // POST: Client/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, ClientModel obj)
        {
            try
            {
                ClientModel Client = new ClientModel();
                Client.UpdateClient(obj);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

    }
}
